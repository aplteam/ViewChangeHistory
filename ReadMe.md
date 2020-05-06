# ChangeHistory

## Overview

As a professional software developer you are using Git for managing your source code. Fine.

An SCM takes care of what is committed. You may change an object many times during a day, but only when you commit your changes can you refer to this version later on.

Any changes in between, including anything created after the last commit but deleted before the next one is lost.

Usually that is fine. But occasionally you might find that having access to the changes in between would actually be useful. Wouldn't it be nice if a system would record all your changes silently in the background, only to be discarded as soon as you commit changes to your VCS only to start from scratch? 

That is exactly what the `]ChangeHistory` user command is designed to do.

## The GUI

The main GUI:

![](MainGUI.png?raw=true "ChangeHistory's main GUI")



The sub-GUI for processing a single APL object:



![](ProcessGUI.png?raw=true "The ''Process'' GUI")


## Installing `]ChangeHistory`

Installing the user command is simple: just double-click the installer and answer the questions. This will copy:

* the user command script `ChangeHistory_UC.dyalog` 
* the folder `ChangeHistory/` 

into `%USERPROFILE%/Documents/MyUCMDs` where **all** versions of Dyalog APL will find it.

To make it really work there are more steps to be carried out. For further instructions execute within Dyalog:

```
      ]ChangeHistory -???
```

In earlier versions than 17.0:

```
      ]???ChangeHistory       
```

## Requirements

1. You work under MS Windows.
1. You use [acre](https://github.com/the-carlisle-group/Acre-Desktop "Link acre on GitHub"), a project management tool written by Phil Last and made available to the APL community by the [Carlisle Group](https://www.carlislegroup.com/).
1. You use [Git](https://git-scm.com/) as your source code management system (SCM).