:Class  ViewChangeHistory
⍝ User Command script for "]ViewChangeHistory"

    MinimumVersionOfDyalogNeeded←'16.0'   ⍝ No need to edit this: it's checked by ]runmake, and changed if necessary

    ∇ r←List;⎕IO;⎕ML ⍝ this function usually returns 1 or more namespaces (here only 1)
      :Access Shared Public
      ⎕IO←⎕ML←1
      r←⎕NS''                               ⍝ create the command
      r.Name←'ViewChangeHistory'            ⍝ the name
      r.Desc←'Saves all changes between commits'
      r.Group←'acre'
     ⍝ Parsing rules:
      r.Parse←' -discard -install'
    ∇

    ∇ r←Run(Cmd Args);⎕IO;⎕ML;thisVersion;discard;n;install;buff
      :Access Shared Public
      ⎕IO←0 ⋄ ⎕ML←3 ⋄ ⎕WX←3
      thisVersion←⊃(//)⎕VFI{⍵/⍨2>+\'.'=⍵}1⊃'#'⎕WG'APLVersion'
      :If (⊃(//)⎕VFI MinimumVersionOfDyalogNeeded)>⊃(//)⎕VFI{⍵/⍨2>+\'.'=⍵}1⊃'#'⎕WG'APLVersion'
          11 ⎕SIGNAL⍨'ViewChangeHistory needs at least version ',MinimumVersionOfDyalogNeeded,' of Dyalog APL'
      :EndIf
      r←0 0⍴''
      discard←0 Args.Switch'discard'              ⍝ default is 0
      install←0 Args.Switch'install'              ⍝ default is 0
      '_ViewChangeHistory'⎕SE.⎕NS''
      EstablishNeededModules ⎕SE._ViewChangeHistory
      CopyCode ⎕SE._ViewChangeHistory
      :If discard
          n←⎕SE._ViewChangeHistory.ViewChangeHistory.Discard 1
      :ElseIf install
          buff←⎕CR'⎕se._ViewChangeHistory.ViewChangeHistory.OnAfterSave'
          :If 0=1↑0⍴buff←⎕SE.⎕FX buff
              11 ⎕SIGNAL⍨'Fixing "OnAfterSave" failed; check line number',((1<≢buff)/'s'),': ',⍕buff-1
          :EndIf
      :Else
          n←((0⊃⎕NPARTS ##.SourceFile),'ViewChangeHistory\')⎕SE._ViewChangeHistory.ViewChangeHistory.Run ⍬
      :EndIf
    ∇

    ∇ EstablishNeededModules ref;neededModules;dne
      neededModules←'APLTreeUtils' 'FilesAndDirs' 'OS' 'WinRegSimple' 'APLGUI' 'DateAndTime' 'WinSys' 'APLGit'
      '_neededModules'⎕SE.⎕NS''
      dne←0=↑∘⎕SE.⎕NC¨neededModules                                             ⍝ do not exist (dne)
      ref CopyThese(dne/neededModules)
      ref CreateRefs(~dne)/neededModules
    ∇

    ∇ {r}←CopyCode ref;wsNamePath
      wsNamePath←GetWorkspacePath
      'ViewChangeHistory'ref.⎕CY wsNamePath
      r←⍬
    ∇

    ∇ r←GetWorkspacePath
      :If 0=##.⎕NC'SourceFile'
          ⍝ We are probably executed as part of a help call, and then ##.SourceFile is not available
          ⍝ ↓↓↓ This is a hack to get around this:
          r←(2 ⎕NQ #'GetEnvironment' 'USERPROFILE'),'/Documents/MyUCMDs/ViewChangeHistory/ViewChangeHistory.dws'
      :Else
          r←(0⊃⎕NPARTS ##.SourceFile),'\ViewChangeHistory\ViewChangeHistory.dws'
      :EndIf
    ∇

    ∇ r←l Help Cmd;⎕IO;⎕ML;ref
      ⎕IO←0 ⋄ ⎕ML←3
      :Access Shared Public
      r←''
      :Select l
      :Case 0
          r,←⊂'Fires up a GUI in order to manage any files in the folder change_history/'
          r,←⊂'You may specify an argument or one of the two accepted flags:'
          r,←⊂'-discard and -install'
          r,←⊂'Without an argument it attempts to deal with one or more open acre projects.'
      :Case 1
          r,←⊂'While the user command:'
          r,←⊂']ViewChangeHistory'
          r,←⊂'fires up a GUI that allows you to manage any files in the folder change_history/,'
          r,←⊂'you can add the -discard flag in order to remove the folder and its content.'
          r,←⊂''
          r,←⊂'However, removing the folder should be done automatically when the Git command'
          r,←⊂'"Commit" is executed.'
          r,←⊂'You may install the required AfterSave handler for acre by specifying -install'
      :Case 2
          ⎕SE.⎕SHADOW'TEMP'
          ref←⍎'TEMP'⎕SE.⎕NS''
          EstablishNeededModules ref
          CopyCode ref
          {}⎕SE.UCMD'ADOC ⎕SE.TEMP.ViewChangeHistory -ref=0 -toc=0'
      :EndSelect
    ∇

    ∇ {r}←ref CopyThese objects;wsNamePath;object;i;msg
      r←⍬
      :If 0<≢objects
          :If 0=##.⎕NC'SourceFile'
              ⍝ We are probably executed as part of a help call, and then ##.SourceFile is not available
              ⍝ ↓↓↓ This is a hack to get around this:
              wsNamePath←(2 ⎕NQ #'GetEnvironment' 'USERPROFILE'),'/Documents/MyUCMDs/ViewChangeHistory/ViewChangeHistory.dws'
          :Else
              wsNamePath←(0⊃⎕NPARTS ##.SourceFile),'\ViewChangeHistory\ViewChangeHistory.dws'
          :EndIf
          :If ⎕NEXISTS wsNamePath
              :Trap 11
                  (⊃objects)ref.⎕CY wsNamePath
              :Else
                  ⍝ Strictly speaking the following is not a necessary measure, but it's a fallback against stupidity:
                  msg←''
                  :For i :In ⍳≢objects
                      object←i⊃objects
                      :Trap 11
                          object ref.⎕CY wsNamePath
                      :Else
                          msg,←⊂'Module <',object,'> not found in ',wsNamePath
                      :EndTrap
                  :EndFor
                  (1↓↑,/(⎕UCS 13),¨(⊂'*** Problem collecting modules required by ViewChangeHistory:'),'  '∘,¨msg)⎕SIGNAL 6/⍨0≠≢msg
              :EndTrap
          :Else
              6 ⎕SIGNAL⍨'Could not find ',wsNamePath
          :EndIf
      :EndIf
    ∇

      CreateRefs←{
          ref←⍺
          list←⍵
          0=≢list:shy←⍬
          _←{ref⍎⍵,'←','⎕SE.',⍵}¨list
          1:shy←⍬
      }

:EndClass