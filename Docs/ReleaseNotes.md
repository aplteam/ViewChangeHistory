[parm]:saveHTML = 0
[parm]:title    = 'ChangeHistory Release Notes'


# Release Notes 

* 1.1.0 ⋄ 2020-05-06
  * Renamed from `ChangeHistory` to `ViewChangeHistory`.
  * Bug fixes:
    * The main window can now be closed by pressing the <escape> key.
    * There was a problem with sorting by column in the main window.
    * Documentation improved.

* 1.0.4 ⋄ 2020-03-03
  * Under some circumstances the "Edit" command on the context menu was inactive when it should not have been.

* 1.0.3 ⋄ 2020-02-29
  * The window that showed code retrieved from Git rather than from the WS had an "OK" and a "Cancel" button.

* 1.0.2
  * When only a single version of an object is saved but it's not in the WS anymore then there was no way to put it on display.
  * Bug in `GetBodyFromGit` fixed: CaseCode infor needed to be removed from filenames
  * Problem caused by a buggy version of APLGit fixed
  * Bug fix in `ProcessObjects_`: number of changes was calculated wrongly

* 1.0.1
  * Bug fixes:
    * In case an object was changed just once the user was prevented from comparing that changed version with the Git version.
    * `+/List.SelItems` is occasionally 0 even when a row is selected. Now a function checks and returns a 1 in such cases.
    
* 1.0.0
  * Very first version of ChangeHistory.