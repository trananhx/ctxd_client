namespace Luzart
{
    /// <summary>
    /// Compile-time ID cho UI. Dev dùng khi gọi trong code.
    /// Thêm UI mới: (1) thêm entry ở đây, (2) thêm entry vào UIRegistrySO asset.
    ///
    /// Quy ước đánh số:
    ///   0xxx: System (Loading, Disconnect, Alert...)
    ///   1xxx: Screen (MainMenu, Lobby, Map, CharacterSelect...)
    ///   2xxx: Popup (Inventory, Shop, Quest, Mail...)
    ///   3xxx: Hud (HealthBar, Minimap, Chat...)
    ///   4xxx: Toast
    ///   5xxx: WorldOverlay
    ///
    /// Nếu cần string ID cho server-driven popup, config ở UIConfig.StringId.
    /// </summary>
    public enum UIId
    {
        None = 0,

        // --- System (0xxx) ---
        Loading = 1,
        Disconnect = 2,
        Alert = 3,
        ForceUpdate = 4,
        Notice = 5,
        Toast = 6,
    }
}
