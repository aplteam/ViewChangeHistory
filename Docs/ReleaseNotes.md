[parm]:saveHTML = 0
[parm]:title    = 'ChangeHistory Release Notes'


# Release Notes 

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