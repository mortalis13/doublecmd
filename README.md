# Double Commander [Rebuild]

A custom build of the file manager [**Double Commander**](http://doublecmd.sourceforge.net).

---

## Download

### Original Releases
[Download](https://github.com/doublecmd/doublecmd/releases)

### v1.1.0
- [Windows 32 bit](https://github.com/mortalis13/DoubleCommander-Rebuild/releases/download/1.1.0/doublecmd-1.1.0-rebuild-x32.zip) **(10.2 MB)**
- [Windows 64 bit](https://github.com/mortalis13/DoubleCommander-Rebuild/releases/download/1.1.0/doublecmd-1.1.0-rebuild-x64.zip) **(11.0 MB)**

*Versions built from the older SVN repository*

### v0.9.8 - r9293
- [Windows 32 bit](https://github.com/mortalis13/DoubleCommander-Rebuild/releases/download/0.9.8-r9293/doublecmd-0.9.8-9293-rebuild-x32.zip) **(9.99 MB)**
- [Windows 64 bit](https://github.com/mortalis13/DoubleCommander-Rebuild/releases/download/0.9.8-r9293/doublecmd-0.9.8-9293-rebuild-x64.zip) **(10.7 MB)**

### v0.8.0 - r7623
- [Windows 32 bit](https://github.com/mortalis13/DoubleCommander-Rebuild/releases/download/0.8.0-r7623/doublecmd-0.8.0-7623-rebuild-x32.zip) **(23.2 MB)**
- [Windows 64 bit](https://github.com/mortalis13/DoubleCommander-Rebuild/releases/download/0.8.0-r7623/doublecmd-0.8.0-7623-rebuild-x64.zip) **(24.2 MB)**


## Modifications

### New Commands
- cm_JumpToPrevTabInStack - switch to the previous tab in history
- cm_MaximizePanel - maximize active panel
- cm_OpenParentFolderExternal - open parent folder in explorer
- cm_ChangeDirToNextSibling, cm_ChangeDirToPrevSibling - navigate to the next/previous sibling folder
- cm_ToggleFreeSorting - free sorting mode (the files are not sorted automatically after renaming)
- cm_ToggleAliasMode - alias mode (the command line text field can be used to execute saved aliases)
- cm_RenameFilesWithEditor - rename multiple files using an external editor

### Modified Commands
- cm_CopyFullNamesToClip, cm_CopyPathOfFilesToClip - param UnixSeparator to use '/' as folders separator for the copied paths
- cm_Edit - param UseInternal to force open a file in the internal editor
- cm_Copy - params CopyFoldersOnly and CopyTopFoldersOnly to copy only folders without files
- cm_Delete - param SkipErrors to prevent error dialog when deleting files
- cm_EditNew - param OpenEditor to control if the editor should open a created file
- cm_MarkCurrentExtension - works with folders

### Other
- added info to the operations dialogs, with the format "Current: [processed_file_size/total_file_size] :: Total: [all_processed_size/all_total_size]"
- fast scroll lists with Ctrl+PageUp/PageDown
- the '..' item does not appear in the grid (except for the empty folders)
- new column in the file grid to show the stats for each folder (number of folders and files)
- independent stats dialog with the Copy button
- draw numbers for drive buttons
- delete read-only files without asking
- the no-splash start parameter is always true
- tab height increased
- when copying folders with the same name between panels, always merge without asking
- option for the cursor color of a selected/highlighted item
- quick view works for folders
- in the create folder dialog, multiple folders can be created, using the new text field and Ctrl+Enter
- when duplicating files in the same folder, always use the pattern 'file-counter'


## Notes

### Aliases
*Borrowed from the MultiCommander manager*

To use command aliases, create a file **aliases.txt** in the Double Commander profile folder and add text with the format **"[alias] [command]"**.  
For example, `"dd cd C:\Users\Me\Documents"`.  
Then enter the alias in the **command line** within Double Commander and press Enter to execute the command.


## Build

1. Install [Lazarus 2.0.12](https://www.lazarus-ide.org/index.php?page=downloads).
2. Install **Cross Compilation Addon**. Go to the `Windows (64 Bits) Add ons` link on the **Downloads** page and get the installer named **...cross-i386-win32...**.
3. In the **r.bat** modify *OS_TARGET* and *lazpath* variables.
4. Run from the console `ra`.

- To rebuild the code if build errors occur run `rr`
- To build the final ready to use executable run `rp`
