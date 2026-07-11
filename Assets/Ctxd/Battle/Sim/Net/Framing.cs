using System.IO;
using System.Text;

namespace Ctxd.Battle.Sim.Net
{
    /// <summary>
    /// Length-prefixed framing over a byte stream: <c>[4-byte little-endian int length][UTF8 JSON]</c>.
    /// Byte layout is written/read explicitly (not via BitConverter) so it is endianness-independent and
    /// identical on the Unity client and the .NET server.
    /// </summary>
    public static class Framing
    {
        public const int MaxFrameBytes = 4 * 1024 * 1024; // 4 MB guard against a corrupt length header.

        public static void WriteFrame(Stream stream, string json)
        {
            byte[] payload = Encoding.UTF8.GetBytes(json);
            byte[] header =
            {
                (byte)(payload.Length & 0xFF),
                (byte)((payload.Length >> 8) & 0xFF),
                (byte)((payload.Length >> 16) & 0xFF),
                (byte)((payload.Length >> 24) & 0xFF),
            };
            stream.Write(header, 0, 4);
            stream.Write(payload, 0, payload.Length);
            stream.Flush();
        }

        /// <summary>Blocking read of one frame. Returns null on a clean EOF before any byte of the header.</summary>
        public static string ReadFrame(Stream stream)
        {
            byte[] header = ReadExactly(stream, 4);
            if (header == null) return null;
            int len = header[0] | (header[1] << 8) | (header[2] << 16) | (header[3] << 24);
            if (len < 0 || len > MaxFrameBytes)
                throw new IOException($"Frame length out of range: {len}");
            if (len == 0) return string.Empty;
            byte[] payload = ReadExactly(stream, len);
            if (payload == null) throw new EndOfStreamException("Stream closed mid-frame");
            return Encoding.UTF8.GetString(payload);
        }

        private static byte[] ReadExactly(Stream stream, int count)
        {
            byte[] buf = new byte[count];
            int read = 0;
            while (read < count)
            {
                int n = stream.Read(buf, read, count - read);
                if (n <= 0)
                {
                    if (read == 0) return null;            // clean EOF at a frame boundary
                    throw new EndOfStreamException();      // truncated mid-frame
                }
                read += n;
            }
            return buf;
        }
    }
}
