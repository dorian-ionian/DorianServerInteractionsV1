//-----------------------------------------------------------
// Client-side server binds. Stored in DorianServerInteractions.ini
// on this client, never in user.ini, so they only apply on servers
// running DorianServerInteractionsV1.
//-----------------------------------------------------------
class DorianServerInteractions extends DualWieldV1.dw_DualWieldInteraction
    config(DorianServerInteractions);

var config EInputKey DWLeftKey, DWRightKey;
var config EInputKey CustomKey[10];
var string CustomCmd[10];

var localized string MenuName;
var localized string MenuHelp;

var bool bMenuModified;

event Initialized()
{
    // Skips the DualWield key prompt: the bind tab replaces it.
    bDefaultKeys = true;
}

final private function ModifyMenu()
{
    local UT2K4PlayerLoginMenu Menu;

    Menu = UT2K4PlayerLoginMenu(GUIController(ViewportOwner.Actor.Player.GUIController).FindPersistentMenuByName(UnrealPlayer(ViewportOwner.Actor).LoginMenuClass));
    if (Menu != none)
    {
        Menu.c_Main.AddTab(MenuName, string(class'DorianServerBindPanel'),, MenuHelp);
        bMenuModified = true;
    }
}

function Tick(float DeltaTime)
{
    if (!bMenuModified)
        ModifyMenu();
    Super.Tick(DeltaTime);
}

function bool KeyEvent(out EInputKey Key, out EInputAction Action, float Delta)
{
    local int i;

    // Live values from the saved config, so the bind tab takes effect right away.
    LeftControlKey = class'DorianServerInteractions'.default.DWLeftKey;
    RightControlKey = class'DorianServerInteractions'.default.DWRightKey;

    if (Action == IST_Press && (ViewportOwner.Console == none || !ViewportOwner.Console.bTyping))
    {
        for (i = 0; i < 10; i++)
        {
            if (class'DorianServerInteractions'.default.CustomKey[i] != IK_None
                && Key == class'DorianServerInteractions'.default.CustomKey[i]
                && class'DorianServerInteractions'.default.CustomCmd[i] != "")
            {
                // Next/Previous Artifact pass their key so the hold can be released by that key
                if (i == 6 || i == 7)
                    ViewportOwner.Actor.ConsoleCommand(class'DorianServerInteractions'.default.CustomCmd[i] @ int(Key));
                else
                    ViewportOwner.Actor.ConsoleCommand(class'DorianServerInteractions'.default.CustomCmd[i]);
                return true;
            }
        }
    }
    else if (Action == IST_Release)
    {
        // Next/Previous Artifact keys repeat while held, so tell RPGInteraction when they come up
        for (i = 6; i < 8; i++)
        {
            if (class'DorianServerInteractions'.default.CustomKey[i] != IK_None
                && Key == class'DorianServerInteractions'.default.CustomKey[i])
            {
                ViewportOwner.Actor.ConsoleCommand("RPGArtifactHoldStop");
                break;
            }
        }
    }
    return Super.KeyEvent(Key, Action, Delta);
}

event NotifyLevelChange()
{
    local UT2K4PlayerLoginMenu LoginMenu;

    foreach AllObjects(class'UT2K4PlayerLoginMenu', LoginMenu)
        LoginMenu.c_Main.RemoveTab(MenuName);

    Master.RemoveInteraction(self);
}

defaultproperties
{
    DWLeftKey=IK_None
    DWRightKey=IK_None
    CustomCmd(0)="RPGStatsMenu"
    CustomCmd(1)="mutate dualwieldconfig"
    CustomCmd(2)="changeammo"
    CustomCmd(3)="reloadmenow"
    CustomCmd(4)="mutate randomswitch"
    CustomCmd(5)="mutate playerpreferences"
    CustomCmd(6)="RPGArtifactHoldStart 1"
    CustomCmd(7)="RPGArtifactHoldStart -1"
    CustomCmd(8)="ActivateItem"
    CustomCmd(9)="mutate hook"
    MenuName="Server Binds"
    MenuHelp="Keys and commands that only apply on this server"
    bRequiresTick=True
}
