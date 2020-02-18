; This script is best executed by ChangeHistory's "Make" utility.

#define MyAppVersion "1.0.1.46"
#define MyAppName "ChangeHistory"
#define MyAppExeName "ChangeHistory.dws"
#define MyAppPublisher "APL Team Ltd"
#define MyAppURL "https://github.com/aplteam/ChangeHistory"
#define MyAppIcoName "ChangeHistory.ico"
#define MyBlank " "
#define TargetDir "Dist\"

[Setup]
; NOTE: The value of AppId uniquely identifies this application.
AppId={{36C5A8C9-DC2D-4683-AE82-93FE5162D65D}

AppName="{#MyAppName}"
AppVersion={#MyAppVersion}
AppVerName={#MyAppName}{#MyBlank}{#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
DefaultDirName={userdocs}\\MyUCMDs\\{#MyAppName}
DefaultGroupName={#MyAppPublisher}\{#MyAppName}
AllowNoIcons=yes
OutputDir={#TargetDir}
OutputBaseFilename="SetUp_{#MyAppName}_{#MyAppVersion}"
Compression=lzma
SolidCompression=yes
SetupIconFile={#MyAppIcoName}
PrivilegesRequired=Lowest
AlwaysShowDirOnReadyPage=yes
DisableWelcomePage=no
DisableDirPage=no

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"; LicenseFile: "License";

[Registry]

[Dirs]

[Files]
Source: "{#TargetDir}\ChangeHistory_uc.dyalog"; DestDir: "{app}\..\";
Source: "{#TargetDir}\ChangeHistory\ReleaseNotes.html"; DestDir: "{app}";
Source: "{#TargetDir}\ChangeHistory\ReadMe.html"; DestDir: "{app}";
Source: "{#TargetDir}\ChangeHistory\{#MyAppExeName}"; DestDir: "{app}";
Source: "{#TargetDir}\ChangeHistory\MainGUI.png"; DestDir: "{app}";
Source: "{#TargetDir}\ChangeHistory\ProcessGUI.png"; DestDir: "{app}";
Source: {#MyAppIcoName}; DestDir: "{app}";

Source: "LICENSE"; DestDir: "{app}"
; NOTE: Don't use "Flags: ignoreversion" on any shared system files

[Icons]

[Run]
Filename: "{app}\ReleaseNotes.html"; Description: "View the Release Notes"; Flags: postinstall shellexec skipifsilent

[Tasks]

[Code]