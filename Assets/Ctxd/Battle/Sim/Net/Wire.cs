using Newtonsoft.Json;

namespace Ctxd.Battle.Sim.Net
{
    /// <summary>
    /// JSON (de)serialization shared by client and server — Newtonsoft (Json.NET) on BOTH sides
    /// (owner decision 2026-06-30). Enums serialize as integers (default) so client/server stay in lockstep.
    /// </summary>
    public static class Wire
    {
        private static readonly JsonSerializerSettings Settings = new JsonSerializerSettings
        {
            NullValueHandling = NullValueHandling.Ignore,
            Formatting = Formatting.None,
        };

        public static string Serialize(object value) => JsonConvert.SerializeObject(value, Settings);

        public static T Deserialize<T>(string json) => JsonConvert.DeserializeObject<T>(json, Settings);
    }
}
