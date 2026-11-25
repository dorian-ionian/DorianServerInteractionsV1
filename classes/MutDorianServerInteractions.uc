class MutDorianServerInteractions extends xMutator;

simulated function ClientSideInitialization(PlayerController PC)
{
    AddAnInteraction(PC, "DorianServerInteractionsV1.DorianServerInteractions");
}

function Mutate(string MutateString, PlayerController Sender)
{
    super.Mutate(MutateString, Sender);

    if (MutateString ~= "DualWieldConfig")
        Sender.ClientOpenMenu("DualWieldV1.dw_SettingsPage");
    else if (MutateString ~= "PlayerPreferences")
        Sender.ClientOpenMenu("InvasionProv1_7modV1.InvasionProPlayerPrefsMenu");
}

defaultproperties
{
    bAddToServerPackages=True
    FriendlyName="Dorian Server Interactions"
    Description="Server-side client input: DualWield control keys, custom binds, and the DualWield config command."
}
