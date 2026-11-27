class DorianServerBindPanel extends MidGamePanel
   dependsOn(Interactions);

var automated DorianKeyBindEdit e_Key0;
var automated DorianKeyBindEdit e_Key1;
var automated DorianKeyBindEdit e_Key2;
var automated DorianKeyBindEdit e_Key3;
var automated DorianKeyBindEdit e_Key4;
var automated DorianKeyBindEdit e_Key5;
var automated DorianKeyBindEdit e_Key6;
var automated DorianKeyBindEdit e_Key7;
var automated DorianKeyBindEdit e_Key8;
var automated DorianKeyBindEdit e_Key9;

var automated GUILabel l_Key0;
var automated GUILabel l_Key1;
var automated GUILabel l_Key2;
var automated GUILabel l_Key3;
var automated GUILabel l_Key4;
var automated GUILabel l_Key5;
var automated GUILabel l_Key6;
var automated GUILabel l_Key7;
var automated GUILabel l_Key8;
var automated GUILabel l_Key9;

var automated GUIButton b_Clear;
var string ClearText;
var string TitanText, DWMenuText, AmmoText, ReloadText, RandomText, GibPrefText, NextArtText, PrevArtText, ActArtText, GrappleText;
var bool bReady;

function InitComponent(GUIController InController, GUIComponent InOwner)
{
   bReady = false;

   e_Key0.KeyCode = class'DorianServerInteractions'.default.CustomKey[0];
   e_Key1.KeyCode = class'DorianServerInteractions'.default.CustomKey[1];
   e_Key2.KeyCode = class'DorianServerInteractions'.default.CustomKey[2];
   e_Key3.KeyCode = class'DorianServerInteractions'.default.CustomKey[3];
   e_Key4.KeyCode = class'DorianServerInteractions'.default.CustomKey[4];
   e_Key5.KeyCode = class'DorianServerInteractions'.default.CustomKey[5];
   e_Key6.KeyCode = class'DorianServerInteractions'.default.CustomKey[6];
   e_Key7.KeyCode = class'DorianServerInteractions'.default.CustomKey[7];
   e_Key8.KeyCode = class'DorianServerInteractions'.default.CustomKey[8];
   e_Key9.KeyCode = class'DorianServerInteractions'.default.CustomKey[9];

   l_Key0.Caption = TitanText;
   l_Key1.Caption = DWMenuText;
   l_Key2.Caption = AmmoText;
   l_Key3.Caption = ReloadText;
   l_Key4.Caption = RandomText;
   l_Key5.Caption = GibPrefText;
   l_Key6.Caption = NextArtText;
   l_Key7.Caption = PrevArtText;
   l_Key8.Caption = ActArtText;
   l_Key9.Caption = GrappleText;
   b_Clear.Caption = ClearText;

   Super.InitComponent(InController, InOwner);
   bReady = true;
}

function AnyKeyChanged(byte keyCode)
{
   SaveAll();
}

function bool ClearClicked(GUIComponent Sender)
{
   e_Key0.ResetKey();
   e_Key1.ResetKey();
   e_Key2.ResetKey();
   e_Key3.ResetKey();
   e_Key4.ResetKey();
   e_Key5.ResetKey();
   e_Key6.ResetKey();
   e_Key7.ResetKey();
   e_Key8.ResetKey();
   e_Key9.ResetKey();
   SaveAll();
   return true;
}

final private function SaveAll()
{
   if (!bReady)
      return;

   class'DorianServerInteractions'.default.CustomKey[0] = EInputKey(e_Key0.KeyCode);
   class'DorianServerInteractions'.default.CustomKey[1] = EInputKey(e_Key1.KeyCode);
   class'DorianServerInteractions'.default.CustomKey[2] = EInputKey(e_Key2.KeyCode);
   class'DorianServerInteractions'.default.CustomKey[3] = EInputKey(e_Key3.KeyCode);
   class'DorianServerInteractions'.default.CustomKey[4] = EInputKey(e_Key4.KeyCode);
   class'DorianServerInteractions'.default.CustomKey[5] = EInputKey(e_Key5.KeyCode);
   class'DorianServerInteractions'.default.CustomKey[6] = EInputKey(e_Key6.KeyCode);
   class'DorianServerInteractions'.default.CustomKey[7] = EInputKey(e_Key7.KeyCode);
   class'DorianServerInteractions'.default.CustomKey[8] = EInputKey(e_Key8.KeyCode);
   class'DorianServerInteractions'.default.CustomKey[9] = EInputKey(e_Key9.KeyCode);

   class'DorianServerInteractions'.static.StaticSaveConfig();
}

defaultproperties
{
   Begin Object Class=GUILabel Name=Key0Label
      TextColor=(B=255,G=255,R=255)
      WinTop=0.100000
      WinLeft=0.030000
      WinWidth=0.250000
      WinHeight=0.040000
   End Object
   l_Key0=GUILabel'DorianServerInteractionsV1.DorianServerBindPanel.Key0Label'

   Begin Object Class=GUILabel Name=Key1Label
      TextColor=(B=255,G=255,R=255)
      WinTop=0.190000
      WinLeft=0.030000
      WinWidth=0.250000
      WinHeight=0.040000
   End Object
   l_Key1=GUILabel'DorianServerInteractionsV1.DorianServerBindPanel.Key1Label'

   Begin Object Class=GUILabel Name=Key2Label
      TextColor=(B=255,G=255,R=255)
      WinTop=0.460000
      WinLeft=0.030000
      WinWidth=0.250000
      WinHeight=0.040000
   End Object
   l_Key2=GUILabel'DorianServerInteractionsV1.DorianServerBindPanel.Key2Label'

   Begin Object Class=GUILabel Name=Key3Label
      TextColor=(B=255,G=255,R=255)
      WinTop=0.550000
      WinLeft=0.030000
      WinWidth=0.250000
      WinHeight=0.040000
   End Object
   l_Key3=GUILabel'DorianServerInteractionsV1.DorianServerBindPanel.Key3Label'

   Begin Object Class=DorianKeyBindEdit Name=Key0Edit
      OnKeyChanged=DorianServerBindPanel.AnyKeyChanged
      WinTop=0.100000
      WinLeft=0.300000
      WinWidth=0.180000
      WinHeight=0.040000
      OnActivate=Key0Edit.InternalActivate
      OnDeActivate=Key0Edit.InternalDeactivate
      OnClick=Key0Edit.MouseClick
      OnKeyType=Key0Edit.InternalOnKeyType
      OnKeyEvent=Key0Edit.InternalOnKeyEvent
   End Object
   e_Key0=DorianKeyBindEdit'DorianServerInteractionsV1.DorianServerBindPanel.Key0Edit'

   Begin Object Class=DorianKeyBindEdit Name=Key1Edit
      OnKeyChanged=DorianServerBindPanel.AnyKeyChanged
      WinTop=0.190000
      WinLeft=0.300000
      WinWidth=0.180000
      WinHeight=0.040000
      OnActivate=Key1Edit.InternalActivate
      OnDeActivate=Key1Edit.InternalDeactivate
      OnClick=Key1Edit.MouseClick
      OnKeyType=Key1Edit.InternalOnKeyType
      OnKeyEvent=Key1Edit.InternalOnKeyEvent
   End Object
   e_Key1=DorianKeyBindEdit'DorianServerInteractionsV1.DorianServerBindPanel.Key1Edit'

   Begin Object Class=DorianKeyBindEdit Name=Key2Edit
      OnKeyChanged=DorianServerBindPanel.AnyKeyChanged
      WinTop=0.460000
      WinLeft=0.300000
      WinWidth=0.180000
      WinHeight=0.040000
      OnActivate=Key2Edit.InternalActivate
      OnDeActivate=Key2Edit.InternalDeactivate
      OnClick=Key2Edit.MouseClick
      OnKeyType=Key2Edit.InternalOnKeyType
      OnKeyEvent=Key2Edit.InternalOnKeyEvent
   End Object
   e_Key2=DorianKeyBindEdit'DorianServerInteractionsV1.DorianServerBindPanel.Key2Edit'

   Begin Object Class=DorianKeyBindEdit Name=Key3Edit
      OnKeyChanged=DorianServerBindPanel.AnyKeyChanged
      WinTop=0.550000
      WinLeft=0.300000
      WinWidth=0.180000
      WinHeight=0.040000
      OnActivate=Key3Edit.InternalActivate
      OnDeActivate=Key3Edit.InternalDeactivate
      OnClick=Key3Edit.MouseClick
      OnKeyType=Key3Edit.InternalOnKeyType
      OnKeyEvent=Key3Edit.InternalOnKeyEvent
   End Object
   e_Key3=DorianKeyBindEdit'DorianServerInteractionsV1.DorianServerBindPanel.Key3Edit'

   Begin Object Class=GUILabel Name=Key4Label
      TextColor=(B=255,G=255,R=255)
      WinTop=0.640000
      WinLeft=0.030000
      WinWidth=0.250000
      WinHeight=0.040000
   End Object
   l_Key4=GUILabel'DorianServerInteractionsV1.DorianServerBindPanel.Key4Label'

   Begin Object Class=DorianKeyBindEdit Name=Key4Edit
      OnKeyChanged=DorianServerBindPanel.AnyKeyChanged
      WinTop=0.640000
      WinLeft=0.300000
      WinWidth=0.180000
      WinHeight=0.040000
      OnActivate=Key4Edit.InternalActivate
      OnDeActivate=Key4Edit.InternalDeactivate
      OnClick=Key4Edit.MouseClick
      OnKeyType=Key4Edit.InternalOnKeyType
      OnKeyEvent=Key4Edit.InternalOnKeyEvent
   End Object
   e_Key4=DorianKeyBindEdit'DorianServerInteractionsV1.DorianServerBindPanel.Key4Edit'

   Begin Object Class=GUILabel Name=Key5Label
      TextColor=(B=255,G=255,R=255)
      WinTop=0.730000
      WinLeft=0.030000
      WinWidth=0.250000
      WinHeight=0.040000
   End Object
   l_Key5=GUILabel'DorianServerInteractionsV1.DorianServerBindPanel.Key5Label'

   Begin Object Class=GUILabel Name=Key6Label
      TextColor=(B=255,G=255,R=255)
      WinTop=0.100000
      WinLeft=0.520000
      WinWidth=0.250000
      WinHeight=0.040000
   End Object
   l_Key6=GUILabel'DorianServerInteractionsV1.DorianServerBindPanel.Key6Label'

   Begin Object Class=GUILabel Name=Key7Label
      TextColor=(B=255,G=255,R=255)
      WinTop=0.190000
      WinLeft=0.520000
      WinWidth=0.250000
      WinHeight=0.040000
   End Object
   l_Key7=GUILabel'DorianServerInteractionsV1.DorianServerBindPanel.Key7Label'

   Begin Object Class=DorianKeyBindEdit Name=Key5Edit
      OnKeyChanged=DorianServerBindPanel.AnyKeyChanged
      WinTop=0.730000
      WinLeft=0.300000
      WinWidth=0.180000
      WinHeight=0.040000
      OnActivate=Key5Edit.InternalActivate
      OnDeActivate=Key5Edit.InternalDeactivate
      OnClick=Key5Edit.MouseClick
      OnKeyType=Key5Edit.InternalOnKeyType
      OnKeyEvent=Key5Edit.InternalOnKeyEvent
   End Object
   e_Key5=DorianKeyBindEdit'DorianServerInteractionsV1.DorianServerBindPanel.Key5Edit'

   Begin Object Class=DorianKeyBindEdit Name=Key6Edit
      OnKeyChanged=DorianServerBindPanel.AnyKeyChanged
      WinTop=0.100000
      WinLeft=0.780000
      WinWidth=0.180000
      WinHeight=0.040000
      OnActivate=Key6Edit.InternalActivate
      OnDeActivate=Key6Edit.InternalDeactivate
      OnClick=Key6Edit.MouseClick
      OnKeyType=Key6Edit.InternalOnKeyType
      OnKeyEvent=Key6Edit.InternalOnKeyEvent
   End Object
   e_Key6=DorianKeyBindEdit'DorianServerInteractionsV1.DorianServerBindPanel.Key6Edit'

   Begin Object Class=DorianKeyBindEdit Name=Key7Edit
      OnKeyChanged=DorianServerBindPanel.AnyKeyChanged
      WinTop=0.190000
      WinLeft=0.780000
      WinWidth=0.180000
      WinHeight=0.040000
      OnActivate=Key7Edit.InternalActivate
      OnDeActivate=Key7Edit.InternalDeactivate
      OnClick=Key7Edit.MouseClick
      OnKeyType=Key7Edit.InternalOnKeyType
      OnKeyEvent=Key7Edit.InternalOnKeyEvent
   End Object
   e_Key7=DorianKeyBindEdit'DorianServerInteractionsV1.DorianServerBindPanel.Key7Edit'

   Begin Object Class=GUILabel Name=Key8Label
     TextColor=(B=255,G=255,R=255)
     WinTop=0.280000
     WinLeft=0.520000
     WinWidth=0.250000
     WinHeight=0.040000
   End Object
   l_Key8=GUILabel'DorianServerInteractionsV1.DorianServerBindPanel.Key8Label'

   Begin Object Class=DorianKeyBindEdit Name=Key8Edit
     OnKeyChanged=DorianServerBindPanel.AnyKeyChanged
     WinTop=0.280000
     WinLeft=0.780000
     WinWidth=0.180000
     WinHeight=0.040000
     OnActivate=Key8Edit.InternalActivate
     OnDeActivate=Key8Edit.InternalDeactivate
     OnClick=Key8Edit.MouseClick
     OnKeyType=Key8Edit.InternalOnKeyType
     OnKeyEvent=Key8Edit.InternalOnKeyEvent
   End Object
   e_Key8=DorianKeyBindEdit'DorianServerInteractionsV1.DorianServerBindPanel.Key8Edit'

   Begin Object Class=GUILabel Name=Key9Label
     TextColor=(B=255,G=255,R=255)
     WinTop=0.370000
     WinLeft=0.520000
     WinWidth=0.250000
     WinHeight=0.040000
   End Object
   l_Key9=GUILabel'DorianServerInteractionsV1.DorianServerBindPanel.Key9Label'

   Begin Object Class=DorianKeyBindEdit Name=Key9Edit
     OnKeyChanged=DorianServerBindPanel.AnyKeyChanged
     WinTop=0.370000
     WinLeft=0.780000
     WinWidth=0.180000
     WinHeight=0.040000
     OnActivate=Key9Edit.InternalActivate
     OnDeActivate=Key9Edit.InternalDeactivate
     OnClick=Key9Edit.MouseClick
     OnKeyType=Key9Edit.InternalOnKeyType
     OnKeyEvent=Key9Edit.InternalOnKeyEvent
   End Object
   e_Key9=DorianKeyBindEdit'DorianServerInteractionsV1.DorianServerBindPanel.Key9Edit'

   DWMenuText="Dual Wield Menu"   TitanText="TitanRPG Menu"
   AmmoText="Change Ammo"
   ReloadText="Reload"
   RandomText="Select Random Weapon"
   GibPrefText="Player Preferences Menu"
   NextArtText="Next Artifact"
   PrevArtText="Previous Artifact"
   ActArtText="Activate Artifact"
   GrappleText="Grappling Hook Ability"
   ClearText="Clear Binds"

   Begin Object Class=GUIButton Name=ClearBindsButton
      StyleName="SquareButton"
      WinTop=0.880000
      WinLeft=0.760000
      WinWidth=0.200000
      WinHeight=0.050000
      OnClick=DorianServerBindPanel.ClearClicked
   End Object
   b_Clear=GUIButton'DorianServerInteractionsV1.DorianServerBindPanel.ClearBindsButton'
}
