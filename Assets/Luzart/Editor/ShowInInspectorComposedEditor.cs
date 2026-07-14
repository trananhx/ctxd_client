#if UNITY_EDITOR
using System;
using System.Collections.Generic;
using System.Reflection;
using UnityEngine;
using UnityEditor;

namespace Luzart
{
    public class ShowInInspectorComposedEditor : Editor
    {

        private UnityEngine.Object TargetObject => target as UnityEngine.Object;

        private const BindingFlags ShowInInspectorFlags = BindingFlags.Instance | BindingFlags.Public | BindingFlags.NonPublic;
        private const BindingFlags ButtonMethodFlags = BindingFlags.Instance | BindingFlags.Static | BindingFlags.Public | BindingFlags.NonPublic | BindingFlags.DeclaredOnly;

        private sealed class ShowFieldEntry
        {
            public FieldInfo Field;
            public ShowInInspectorAttribute Attribute;
            public string Label;
        }

        private sealed class ShowPropertyEntry
        {
            public PropertyInfo Property;
            public ShowInInspectorAttribute Attribute;
            public string Label;
        }

        private sealed class ShowMethodEntry
        {
            public MethodInfo Method;
            public string Label;
        }

        private sealed class ButtonEntry
        {
            public MethodInfo Method;
            public ButtonAttribute Attribute;
            public ParameterInfo[] Parameters;
            public string[] ParameterLabels;
            public string FoldoutLabel;
            public string MethodSignature;
            public GUIContent SimpleContent;
            public GUIContent FramedContent;
        }

        private sealed class InspectorMembers
        {
            public static readonly InspectorMembers Empty = new InspectorMembers
            {
                Fields = Array.Empty<ShowFieldEntry>(),
                Properties = Array.Empty<ShowPropertyEntry>(),
                Methods = Array.Empty<ShowMethodEntry>(),
                Buttons = Array.Empty<ButtonEntry>(),
            };

            public ShowFieldEntry[] Fields;
            public ShowPropertyEntry[] Properties;
            public ShowMethodEntry[] Methods;
            public ButtonEntry[] Buttons;

            public bool HasAny => Fields.Length > 0 || Properties.Length > 0 || Methods.Length > 0 || Buttons.Length > 0;
        }

        private static readonly Dictionary<Type, InspectorMembers> MembersCache = new Dictionary<Type, InspectorMembers>();
        private static readonly Dictionary<(ButtonStyle, ButtonSize), GUIStyle> ButtonStyleCache = new Dictionary<(ButtonStyle, ButtonSize), GUIStyle>();
        private static readonly Dictionary<Color, Texture2D> ColorTextureCache = new Dictionary<Color, Texture2D>();
        private static GUIStyle foldoutTitleStyle;

        private static Dictionary<string, object[]> methodParameters = new Dictionary<string, object[]>();
        private static Dictionary<string, bool> parameterFoldouts = new Dictionary<string, bool>();

        public override void OnInspectorGUI()
        {
            base.OnInspectorGUI();
            if (target == null)
                return;

            InspectorMembers members = GetMembers(target.GetType());
            if (!members.HasAny)
                return;

            DrawShowInInspectorMembers(members);
            DrawMethodButtons(members);
        }

        private static InspectorMembers GetMembers(Type type)
        {
            if (MembersCache.TryGetValue(type, out InspectorMembers members))
                return members;

            members = BuildMembers(type);
            MembersCache[type] = members;
            return members;
        }

        private static InspectorMembers BuildMembers(Type type)
        {
            List<ShowFieldEntry> fields = null;
            List<ShowPropertyEntry> properties = null;
            List<ShowMethodEntry> methods = null;
            List<ButtonEntry> buttons = null;

            foreach (FieldInfo field in type.GetFields(ShowInInspectorFlags))
            {
                object[] attrs = field.GetCustomAttributes(typeof(ShowInInspectorAttribute), true);
                if (attrs.Length == 0)
                    continue;

                var attr = (ShowInInspectorAttribute)attrs[0];
                fields ??= new List<ShowFieldEntry>();
                fields.Add(new ShowFieldEntry
                {
                    Field = field,
                    Attribute = attr,
                    Label = !string.IsNullOrEmpty(attr.Label) ? attr.Label : ObjectNames.NicifyVariableName(field.Name),
                });
            }

            foreach (PropertyInfo property in type.GetProperties(ShowInInspectorFlags))
            {
                object[] attrs = property.GetCustomAttributes(typeof(ShowInInspectorAttribute), true);
                if (attrs.Length == 0)
                    continue;

                var attr = (ShowInInspectorAttribute)attrs[0];
                properties ??= new List<ShowPropertyEntry>();
                properties.Add(new ShowPropertyEntry
                {
                    Property = property,
                    Attribute = attr,
                    Label = !string.IsNullOrEmpty(attr.Label) ? attr.Label : ObjectNames.NicifyVariableName(property.Name),
                });
            }

            foreach (MethodInfo method in type.GetMethods(ShowInInspectorFlags))
            {
                if (method.ReturnType == typeof(void) || method.GetParameters().Length != 0)
                    continue;

                object[] attrs = method.GetCustomAttributes(typeof(ShowInInspectorAttribute), true);
                if (attrs.Length == 0)
                    continue;

                var attr = (ShowInInspectorAttribute)attrs[0];
                methods ??= new List<ShowMethodEntry>();
                methods.Add(new ShowMethodEntry
                {
                    Method = method,
                    Label = !string.IsNullOrEmpty(attr.Label) ? attr.Label : ObjectNames.NicifyVariableName(method.Name),
                });
            }

            // Walk the hierarchy with DeclaredOnly so a derived override wins over its base declaration
            Type currentType = type;
            while (currentType != null && currentType != typeof(object))
            {
                foreach (MethodInfo method in currentType.GetMethods(ButtonMethodFlags))
                {
                    object[] attrs = method.GetCustomAttributes(typeof(ButtonAttribute), false);
                    if (attrs.Length == 0)
                        continue;

                    ParameterInfo[] parameters = method.GetParameters();
                    if (buttons != null && ContainsSignature(buttons, method, parameters))
                        continue;

                    buttons ??= new List<ButtonEntry>();
                    buttons.Add(CreateButtonEntry(method, (ButtonAttribute)attrs[0], parameters));
                }

                currentType = currentType.BaseType;
            }

            if (fields == null && properties == null && methods == null && buttons == null)
                return InspectorMembers.Empty;

            return new InspectorMembers
            {
                Fields = fields?.ToArray() ?? Array.Empty<ShowFieldEntry>(),
                Properties = properties?.ToArray() ?? Array.Empty<ShowPropertyEntry>(),
                Methods = methods?.ToArray() ?? Array.Empty<ShowMethodEntry>(),
                Buttons = buttons?.ToArray() ?? Array.Empty<ButtonEntry>(),
            };
        }

        private static ButtonEntry CreateButtonEntry(MethodInfo method, ButtonAttribute attribute, ParameterInfo[] parameters)
        {
            string buttonText = !string.IsNullOrEmpty(attribute.ButtonText) ?
                attribute.ButtonText :
                ObjectNames.NicifyVariableName(method.Name);

            var parameterLabels = new string[parameters.Length];
            for (int i = 0; i < parameters.Length; i++)
            {
                parameterLabels[i] = $"{ObjectNames.NicifyVariableName(parameters[i].Name)} ({parameters[i].ParameterType.Name})";
            }

            GUIContent simpleContent;
            if (!string.IsNullOrEmpty(attribute.IconName))
            {
                var icon = EditorGUIUtility.IconContent(attribute.IconName);
                simpleContent = new GUIContent($"  {buttonText}", icon.image);
            }
            else
            {
                simpleContent = new GUIContent(buttonText);
            }

            return new ButtonEntry
            {
                Method = method,
                Attribute = attribute,
                Parameters = parameters,
                ParameterLabels = parameterLabels,
                FoldoutLabel = $"{buttonText} ({parameters.Length} parameters)",
                MethodSignature = method.ToString(),
                SimpleContent = simpleContent,
                FramedContent = new GUIContent(buttonText),
            };
        }

        private static bool ContainsSignature(List<ButtonEntry> buttons, MethodInfo method, ParameterInfo[] parameters)
        {
            for (int i = 0; i < buttons.Count; i++)
            {
                ButtonEntry existing = buttons[i];
                if (existing.Method.Name != method.Name || existing.Parameters.Length != parameters.Length)
                    continue;

                bool sameSignature = true;
                for (int p = 0; p < parameters.Length; p++)
                {
                    if (existing.Parameters[p].ParameterType != parameters[p].ParameterType)
                    {
                        sameSignature = false;
                        break;
                    }
                }

                if (sameSignature)
                    return true;
            }

            return false;
        }

        private void DrawShowInInspectorMembers(InspectorMembers members)
        {
            foreach (ShowFieldEntry entry in members.Fields)
            {
                DrawShowInInspectorField(entry);
            }

            foreach (ShowPropertyEntry entry in members.Properties)
            {
                DrawShowInInspectorProperty(entry);
            }

            foreach (ShowMethodEntry entry in members.Methods)
            {
                DrawShowInInspectorMethod(entry);
            }
        }

        private void DrawShowInInspectorField(ShowFieldEntry entry)
        {
            try
            {
                object value = entry.Field.GetValue(target);
                object newValue = DrawValueField(entry.Label, value, entry.Field.FieldType, entry.Attribute.ReadOnly);

                if (!entry.Attribute.ReadOnly && !object.Equals(value, newValue))
                {
                    if (TargetObject != null) Undo.RecordObject(TargetObject, $"Change {entry.Field.Name}");
                    entry.Field.SetValue(target, newValue);
                    if (TargetObject != null) EditorUtility.SetDirty(TargetObject);
                }
            }
            catch (Exception ex)
            {
                EditorGUILayout.LabelField(entry.Label, $"Error: {ex.Message}");
            }
        }

        private void DrawShowInInspectorProperty(ShowPropertyEntry entry)
        {
            try
            {
                object value = entry.Property.GetValue(target);
                bool isReadOnly = entry.Attribute.ReadOnly || !entry.Property.CanWrite;

                object newValue = DrawValueField(entry.Label, value, entry.Property.PropertyType, isReadOnly);

                if (!isReadOnly && entry.Property.CanWrite && !object.Equals(value, newValue))
                {
                    if (TargetObject != null) Undo.RecordObject(TargetObject, $"Change {entry.Property.Name}");
                    entry.Property.SetValue(target, newValue);
                    if (TargetObject != null) EditorUtility.SetDirty(TargetObject);
                }
            }
            catch (Exception ex)
            {
                EditorGUILayout.LabelField(entry.Label, $"Error: {ex.Message}");
            }
        }

        private void DrawShowInInspectorMethod(ShowMethodEntry entry)
        {
            try
            {
                object value = entry.Method.Invoke(target, null);
                DrawValueField(entry.Label, value, entry.Method.ReturnType, true);
            }
            catch (Exception ex)
            {
                EditorGUILayout.LabelField(entry.Label, $"Error: {ex.Message}");
            }
        }

        private object DrawValueField(string label, object value, Type fieldType, bool readOnly)
        {
            bool wasEnabled = GUI.enabled;
            if (readOnly) GUI.enabled = false;

            object newValue = value;

            if (fieldType == typeof(int))
            {
                newValue = EditorGUILayout.IntField(label, value != null ? (int)value : 0);
            }
            else if (fieldType == typeof(float))
            {
                newValue = EditorGUILayout.FloatField(label, value != null ? (float)value : 0f);
            }
            else if (fieldType == typeof(bool))
            {
                newValue = EditorGUILayout.Toggle(label, value != null ? (bool)value : false);
            }
            else if (fieldType == typeof(string))
            {
                newValue = EditorGUILayout.TextField(label, value?.ToString() ?? "");
            }
            else if (fieldType == typeof(Vector2))
            {
                newValue = EditorGUILayout.Vector2Field(label, value != null ? (Vector2)value : Vector2.zero);
            }
            else if (fieldType == typeof(Vector3))
            {
                newValue = EditorGUILayout.Vector3Field(label, value != null ? (Vector3)value : Vector3.zero);
            }
            else if (fieldType == typeof(Color))
            {
                newValue = EditorGUILayout.ColorField(label, value != null ? (Color)value : Color.white);
            }
            else if (fieldType.IsEnum)
            {
                newValue = EditorGUILayout.EnumPopup(label, value != null ? (Enum)value : (Enum)Activator.CreateInstance(fieldType));
            }
            else if (typeof(UnityEngine.Object).IsAssignableFrom(fieldType))
            {
                newValue = EditorGUILayout.ObjectField(label, value as UnityEngine.Object, fieldType, true);
            }
            else
            {
                string displayValue = value?.ToString() ?? "null";
                EditorGUILayout.LabelField(label, displayValue);
                newValue = value;
            }

            GUI.enabled = wasEnabled;
            return newValue;
        }

        private void DrawMethodButtons(InspectorMembers members)
        {
            ButtonEntry[] buttons = members.Buttons;
            if (buttons.Length == 0)
                return;

            EditorGUILayout.Space(10);

            for (int i = 0; i < buttons.Length; i++)
            {
                DrawStyledMethodButton(buttons[i]);
                EditorGUILayout.Space(4);
            }
        }

        private void DrawStyledMethodButton(ButtonEntry entry)
        {
            string methodKey = $"{(TargetObject != null ? TargetObject.GetInstanceID() : 0)}.{entry.MethodSignature}";

            if (!methodParameters.TryGetValue(methodKey, out object[] parameterValues))
            {
                parameterValues = new object[entry.Parameters.Length];
                for (int i = 0; i < entry.Parameters.Length; i++)
                {
                    parameterValues[i] = GetDefaultValue(entry.Parameters[i].ParameterType);
                }
                methodParameters[methodKey] = parameterValues;
            }

            if (entry.Parameters.Length > 0)
            {
                DrawFramedMethodButton(entry, methodKey, parameterValues);
            }
            else
            {
                DrawSimpleMethodButton(entry, methodKey);
            }
        }

        private void DrawFramedMethodButton(ButtonEntry entry, string methodKey, object[] parameterValues)
        {
            EditorGUILayout.BeginVertical(GUI.skin.box);
            GUIStyle titleStyle = GetFoldoutTitleStyle();

            if (!parameterFoldouts.ContainsKey(methodKey))
                parameterFoldouts[methodKey] = true;

            parameterFoldouts[methodKey] = EditorGUILayout.Foldout(
                parameterFoldouts[methodKey],
                entry.FoldoutLabel,
                true,
                titleStyle
            );

            if (parameterFoldouts[methodKey])
            {
                EditorGUILayout.Space(2);

                EditorGUILayout.BeginVertical();
                EditorGUI.indentLevel++;

                for (int i = 0; i < entry.Parameters.Length; i++)
                {
                    parameterValues[i] = DrawStyledParameterField(entry.ParameterLabels[i],
                        parameterValues[i], entry.Parameters[i].ParameterType);
                }

                EditorGUI.indentLevel--;
                EditorGUILayout.EndVertical();

                EditorGUILayout.Space(4);
            }
            GUIStyle buttonStyle = GetEnhancedButtonStyle(entry.Attribute);

            float buttonHeight = GetButtonHeight(entry.Attribute.Size);

            if (GUILayout.Button(entry.FramedContent, buttonStyle, GUILayout.Height(buttonHeight)))
            {
                foreach (var t in targets)
                {
                    InvokeMethod(t, entry, methodKey);
                }
            }

            EditorGUILayout.EndVertical();
        }

        private void DrawSimpleMethodButton(ButtonEntry entry, string methodKey)
        {
            GUIStyle buttonStyle = GetEnhancedButtonStyle(entry.Attribute);

            float buttonHeight = GetButtonHeight(entry.Attribute.Size);

            if (GUILayout.Button(entry.SimpleContent, buttonStyle, GUILayout.Height(buttonHeight)))
            {
                foreach (var t in targets)
                {
                    InvokeMethod(t, entry, methodKey);
                }
            }
        }

        private static GUIStyle GetFoldoutTitleStyle()
        {
            if (foldoutTitleStyle == null)
            {
                foldoutTitleStyle = new GUIStyle(EditorStyles.foldout)
                {
                    fontStyle = FontStyle.Bold,
                };
                foldoutTitleStyle.normal.textColor = Color.white;
            }

            return foldoutTitleStyle;
        }

        private static GUIStyle GetEnhancedButtonStyle(ButtonAttribute buttonAttribute)
        {
            var key = (buttonAttribute.Style, buttonAttribute.Size);
            if (ButtonStyleCache.TryGetValue(key, out GUIStyle style))
                return style;

            style = new GUIStyle(GUI.skin.button);

            switch (buttonAttribute.Style)
            {
                case ButtonStyle.Framed:
                case ButtonStyle.Default:
                    style.fontStyle = FontStyle.Bold;
                    style.alignment = TextAnchor.MiddleCenter;
                    break;

                case ButtonStyle.Colored:
                    style.fontStyle = FontStyle.Bold;
                    style.normal.textColor = Color.white;
                    style.normal.background = GetColorTexture(new Color(0.3f, 0.6f, 0.9f));
                    break;

                case ButtonStyle.Flat:
                    style.border = new RectOffset(2, 2, 2, 2);
                    style.normal.background = GetColorTexture(new Color(0.9f, 0.9f, 0.9f));
                    break;
            }

            switch (buttonAttribute.Size)
            {
                case ButtonSize.Small:
                    style.fontSize = 10;
                    break;
                case ButtonSize.Medium:
                    style.fontSize = 12;
                    break;
                case ButtonSize.Large:
                    style.fontSize = 14;
                    style.fontStyle = FontStyle.Bold;
                    break;
            }

            ButtonStyleCache[key] = style;
            return style;
        }

        private object DrawStyledParameterField(string label, object currentValue, Type parameterType)
        {
            if (parameterType == typeof(int))
            {
                int intValue = 0;
                if (currentValue != null)
                {
                    if (currentValue is int)
                        intValue = (int)currentValue;
                    else if (int.TryParse(currentValue.ToString(), out int parsed))
                        intValue = parsed;
                }
                return EditorGUILayout.IntField(label, intValue);
            }
            else if (parameterType == typeof(float))
            {
                float floatValue = 0f;
                if (currentValue != null)
                {
                    if (currentValue is float)
                        floatValue = (float)currentValue;
                    else if (currentValue is double)
                        floatValue = (float)(double)currentValue;
                    else if (float.TryParse(currentValue.ToString(), out float parsed))
                        floatValue = parsed;
                }
                return EditorGUILayout.FloatField(label, floatValue);
            }
            else if (parameterType == typeof(bool))
            {
                bool boolValue = false;
                if (currentValue != null)
                {
                    if (currentValue is bool)
                        boolValue = (bool)currentValue;
                    else if (bool.TryParse(currentValue.ToString(), out bool parsed))
                        boolValue = parsed;
                }
                return EditorGUILayout.Toggle(label, boolValue);
            }
            else if (parameterType == typeof(string))
            {
                string stringValue = "";
                if (currentValue != null)
                {
                    stringValue = currentValue.ToString();
                }
                return EditorGUILayout.TextField(label, stringValue);
            }
            else if (parameterType == typeof(Vector2))
            {
                Vector2 vector2Value = Vector2.zero;
                if (currentValue != null && currentValue is Vector2)
                {
                    vector2Value = (Vector2)currentValue;
                }
                return EditorGUILayout.Vector2Field(label, vector2Value);
            }
            else if (parameterType == typeof(Vector3))
            {
                Vector3 vector3Value = Vector3.zero;
                if (currentValue != null && currentValue is Vector3)
                {
                    vector3Value = (Vector3)currentValue;
                }
                return EditorGUILayout.Vector3Field(label, vector3Value);
            }
            else if (parameterType == typeof(Color))
            {
                Color colorValue = Color.white;
                if (currentValue != null && currentValue is Color)
                {
                    colorValue = (Color)currentValue;
                }
                return EditorGUILayout.ColorField(label, colorValue);
            }
            else if (parameterType.IsEnum)
            {
                Enum enumValue = null;
                if (currentValue != null && parameterType.IsAssignableFrom(currentValue.GetType()))
                {
                    enumValue = (Enum)currentValue;
                }
                else
                {
                    Array enumValues = Enum.GetValues(parameterType);
                    if (enumValues.Length > 0)
                    {
                        enumValue = (Enum)enumValues.GetValue(0);
                    }
                }
                return EditorGUILayout.EnumPopup(label, enumValue);
            }
            else if (typeof(UnityEngine.Object).IsAssignableFrom(parameterType))
            {
                UnityEngine.Object objectValue = null;
                if (currentValue != null && parameterType.IsAssignableFrom(currentValue.GetType()))
                {
                    objectValue = (UnityEngine.Object)currentValue;
                }
                return EditorGUILayout.ObjectField(label, objectValue, parameterType, true);
            }
            else
            {
                EditorGUILayout.LabelField(label, $"Unsupported type: {parameterType.Name}");
                return currentValue ?? GetDefaultValue(parameterType);
            }
        }

        private static Texture2D GetColorTexture(Color color)
        {
            // Texture can be destroyed on scene/playmode transitions — treat Unity fake-null as a miss
            if (ColorTextureCache.TryGetValue(color, out Texture2D texture) && texture != null)
                return texture;

            texture = new Texture2D(1, 1) { hideFlags = HideFlags.HideAndDontSave };
            texture.SetPixel(0, 0, color);
            texture.Apply();
            ColorTextureCache[color] = texture;
            return texture;
        }

        private void InvokeMethod(object target, ButtonEntry entry, string methodKey)
        {
            try
            {
                if (target is UnityEngine.Object unityObject)
                {
                    Undo.RecordObject(unityObject, $"Button {entry.Method.Name}");
                }

                if (entry.Parameters.Length == 0)
                {
                    entry.Method.Invoke(target, null);
                }
                else
                {
                    object[] parameterValues = methodParameters[methodKey];
                    entry.Method.Invoke(target, parameterValues);
                }

                if (target is UnityEngine.Object targetObject)
                {
                    EditorUtility.SetDirty(targetObject);
                }
            }
            catch (Exception ex)
            {
                Debug.LogError($"Error invoking method {entry.Method.Name}: {ex.Message}");
            }
        }

        private object GetDefaultValue(Type type)
        {
            if (type == typeof(int))
                return 0;
            else if (type == typeof(float))
                return 0f;
            else if (type == typeof(double))
                return 0.0;
            else if (type == typeof(bool))
                return false;
            else if (type == typeof(string))
                return "";
            else if (type == typeof(Vector2))
                return Vector2.zero;
            else if (type == typeof(Vector3))
                return Vector3.zero;
            else if (type == typeof(Vector4))
                return Vector4.zero;
            else if (type == typeof(Color))
                return Color.white;
            else if (type.IsEnum)
            {
                Array enumValues = Enum.GetValues(type);
                return enumValues.Length > 0 ? enumValues.GetValue(0) : null;
            }
            else if (typeof(UnityEngine.Object).IsAssignableFrom(type))
            {
                return null;
            }
            else if (type.IsValueType)
            {
                return Activator.CreateInstance(type);
            }
            return null;
        }

        private float GetButtonHeight(ButtonSize size)
        {
            return size switch
            {
                ButtonSize.Small => 18f,
                ButtonSize.Medium => 24f,
                ButtonSize.Large => 32f,
                _ => 24f
            };
        }
    }
}
#endif
