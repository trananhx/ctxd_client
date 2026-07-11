namespace Ctxd.Battle.Sim
{
    /// <summary>Mutable in-progress battle snapshot, owned by the runner.</summary>
    public sealed class BattleState
    {
        public SideState Offense, Defense;
        public Terrain Terrain;
        public int Round;
        public BattleOutcome Outcome = BattleOutcome.Ongoing;

        public SideState Side(Faction f) => f == Faction.Offense ? Offense : Defense;
        public SideState Enemy(Faction f) => f == Faction.Offense ? Defense : Offense;
        public Combatant Active(Faction f) => Side(f).Active;
    }
}
