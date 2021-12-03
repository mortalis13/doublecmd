@echo off

rem Compiling components

rem Do not execute this script directly.
rem This script is called from ..\build.bat.

pushd components
lazbuild chsdet\chsdet.lpk --os=%BUILD_OS%    --cpu=%BUILD_CPU%
lazbuild multithreadprocs\multithreadprocslaz.lpk --os=%BUILD_OS%    --cpu=%BUILD_CPU%
lazbuild dcpcrypt\dcpcrypt.lpk --os=%BUILD_OS%    --cpu=%BUILD_CPU%
lazbuild doublecmd\doublecmd_common.lpk --os=%BUILD_OS%    --cpu=%BUILD_CPU%
lazbuild KASToolBar\kascomp.lpk --os=%BUILD_OS%    --cpu=%BUILD_CPU%
lazbuild viewer\viewerpackage.lpk --os=%BUILD_OS%    --cpu=%BUILD_CPU%
lazbuild gifanim\pkg_gifanim.lpk --os=%BUILD_OS%    --cpu=%BUILD_CPU%
lazbuild synunihighlighter\synuni.lpk --os=%BUILD_OS%    --cpu=%BUILD_CPU%
lazbuild virtualterminal\virtualterminal.lpk --os=%BUILD_OS%    --cpu=%BUILD_CPU%
popd
