@echo Clean up output directory
@del /Q /S units\i386-win32-win32\*.*
@del /Q /S units\x86_64-win64-win32\*.*
@del /Q src\*.*~
@del /Q src\*.~*
@del /Q doublecmd.dbg
@del /Q doublecmd.zdli
@del /Q doublecmd*.exe
@del /Q doublecmd*.old

@echo Remove generated help files
@del /Q doc\en\dev-help\*.*

@echo Clean up tools output directories
@del /Q /S tools\lib\*.*
@del /Q tools\extractdwrflnfo.exe

@echo Done.