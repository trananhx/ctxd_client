namespace Luzart
{
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using UnityEngine;

    [CreateAssetMenu(menuName = "Luzart/ContentBag")]
    public class ContentBag : ScriptableObject
    {
        [SerializeField] private List<ScriptableObject> allContents;
        public IEnumerable<IContent> AllContents => allContents?.OfType<IContent>() ?? Enumerable.Empty<IContent>();
    }

    public sealed class ContentManager
    {
        private readonly IDomain _domain;
        private readonly List<IContent> _installed = new();

        public ContentManager(IDomain domain) { _domain = domain; }

        public void InstallBags(IEnumerable<ContentBag> bags)
        {
            foreach (var bag in bags)
            {
                foreach (var c in bag.AllContents)
                {
                    _installed.Add(c);
                    _domain.Add(c,c.Id); // inject + register
                }
            }
        }

        public void InitializeAndStart()
        {
            int count = 0;
            foreach (var c in _installed)
            {
                try
                {
                    c.Initialize();
                    count++;    
                }
                catch (System.Exception e)
                {
                    Debug.LogError($"Initialize Bug with {c} : {e} ");
                }
            }
            Debug.Log($"Run {count}");
            foreach (var c in _installed)
            {
                try
                {
                    c.Start();
                }
                catch (System.Exception e)
                {
                    Debug.LogError($"StartContent with {c} : {e} ");
                }
            }
        }

        public void StopAndTerminate()
        {
            for (int i = _installed.Count - 1; i >= 0; i--) _installed[i].Stop();
            for (int i = _installed.Count - 1; i >= 0; i--) _installed[i].Terminate();
        }
    }
}

