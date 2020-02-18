[parm]:saveHTML = 0
[parm]:title    = 'ChangeHistory Release Notes'


# Release Notes 

* 1.0.1
  * Bug fixes:
    * In case an object was changed just once the user was prevented from comparing that changed version with the Git version.
    * `+/List.SelItems` is occasionally 0 even when a row is selected. Now a function checks and returns a 1 in such cases.
    
* 1.0.0
  * Very first version of ChangeHistory.