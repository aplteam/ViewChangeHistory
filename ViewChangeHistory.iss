; This script is best executed by ViewChangeHistory's "Make" utility.

#define MyAppVersion "1.1.1.77"
#define MyAppName "ViewChangeHistory"
#define MyAppExeName "ViewChangeHistory.dws"
#define MyAppPublisher "APL Team Ltd"
#define MyAppURL "https://github.com/aplteam/ViewChangeHistory"
#define MyAppIcoName "ViewChangeHistory.ico"
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
OutputDir=C:/Users/kai/AppData/Local/Temp/InnoTempDir
OutputBaseFilename="SetUp_{#MyAppName}_{#MyAppVersion}"
Compression=lzma
SolidCompression=yes
SetupIconFile={#MyAppIcoName}
PrivilegesRequired=Lowest
AlwaysShowDirOnReadyPage=yes
DisableWelcomePage=no
DisableDirPage=no
CreateUninstallRegKey=no

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"; LicenseFile: "License";

[Registry]

[Dirs]

[Files]
Source: "{#TargetDir}\ViewChangeHistory_uc.dyalog"; DestDir: "{app}\..\";
Source: "{#TargetDir}\ViewChangeHistory\ReleaseNotes.html"; DestDir: "{app}";
Source: "{#TargetDir}\ViewChangeHistory\ReadMe.html"; DestDir: "{app}";
Source: "{#TargetDir}\ViewChangeHistory\{#MyAppExeName}"; DestDir: "{app}";
Source: "{#TargetDir}\ViewChangeHistory\MainGUI.png"; DestDir: "{app}";
Source: "{#TargetDir}\ViewChangeHistory\ProcessGUI.png"; DestDir: "{app}";
Source: {#MyAppIcoName}; DestDir: "{app}";

Source: "LICENSE"; DestDir: "{app}"
; NOTE: Don't use "Flags: ignoreversion" on any shared system files

[Icons]

[Run]
Filename: "{app}\ReleaseNotes.html"; Description: "View the Release Notes"; Flags: postinstall shellexec skipifsilent

[Tasks]

[Code]
