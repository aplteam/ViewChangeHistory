[parm]:toc            = 3
[parm]:numberHeaders  = 2 3 4
[parm]:collapsibleTOC = 1
[parm]:saveHTML       = 0
[parm]:title          = 'ChangeHistory ReadMe'


# ChangeHistory

**Notes:** 

1. If you do not use [acre](https://github.com/the-carlisle-group/Acre-Desktop "Link acre on GitHub") then this user command is of no interest to you.
2. This user command is Windows-only.

## Overview

As a professional software developer you are using a version control system (VCS) like Git. Fine.

However, while a C programmer might only change a single object during a whole working day (presumably a lengthy class), an APL programmer is more likely to change quite a number of objects, presumably short functions.

A version control system only takes care of what is committed. You may change an object many times during a day, but only when you commit your changes to the VCS can you refer to this version later on.

Any changes in between, including anything created after the last commit but deleted before the next one is lost.

Usually that is fine. But occasionally you might find that having access to the changes in between would actually be useful. Wouldn't it be nice if a system would record all your changes silently in the background, only to be discarded as soon as you commit changes to your VCS only to start from scratch? That is exactly what "ChangeHistory" is designed to do.

## Installing `ChangeHistory`

## How to make it work

The first step is Obviously to run the installer. That copies the user command script and the folder `ChangeHistory/` (which contains a workspace and some HTML and text files) into the `MyUCMDs` folder where it will be found by any version of Dyalog since 16.0 onwards.

In a second step you have to make the function `OnAfterSave` available to acre. This can be done in at least three ways:

1. Copy the code of `ChangeHistory.OnAfterSave` into `⎕SE` and save the DSE file.
2. Call the function `ChangeHistory.CopyOnAfterSaveToQSE`. This way you don't need to save the DSE file but you need to do it whenever you start a new instance of Dyalog.
3. Create a file `Setup.dyalog` with a namespace script in the folder `C:\Users\{⎕AN}\Documents\MyUCMDs` 

   The name of the file must be `Setup.dyalog` while the name of the namespace does not matter. Inside that file a function `Setup` must be defined that accepts a right argument and returns a result.

   ```
    ∇ {r}←Setup arg;⎕IO;⎕ML;path
      [1]  r←⍬
      [2]  ⎕IO←1 ⋄ ⎕ML←1
      [3]  path←##.PATH,##.Folder,'/ChangeHistory/ChangeHistory.dws'
      [4]  'ChangeHistory.CopyOnAfterSaveToQSE' ⎕CY path
    ∇
   ```

   If there is already a file `Setup.dyalog` then add line [3] and [4] to the `Setup` function in that script.
   That way the required function is copied into `⎕SE` whenever a new instance of Dyalog is started. That's why this is the recommended way.

In the third and last step you need to set acre's "AfterSave" property. There are two different ways how to do that:

### Use ChangeHistory no matter what

For that you use the acre user command `]acre.Aftersave`:

```
      ]acre.Aftersave ⎕SE.OnAfterSave
```

That way all projects will obeye the parameter.

To avoid the need to do this every time you fire up a new instance of Dyalog you could add a line to the script file `Startup.dyalog`:

```
   ⎕se.UCMD `acre.Aftersave ⎕SE.OnAfterSave`
```

### Use ChangeHistory only in specific projects

For that you need to mody the file `acre.config` for every project that is supposed to take advantage of `ChangeHistory`.

```
  "AfterSave": "⎕se.aplteam.OnAfterSave"
```

And do not forget the `;` at the end if this is not the last line!
	

In case you need to investigate simply enter the user command `]ChangeHistory` and ...

⍝TODO⍝  ⍝TODO⍝  ⍝TODO⍝  ⍝TODO⍝ 