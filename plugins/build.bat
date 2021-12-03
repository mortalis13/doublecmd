@echo off

rem Build all plugins

rem Do not execute this script directly.
rem This script is called from ..\build.bat.

rem CD to plugins directory
pushd plugins

rem WCX plugins
lazbuild wcx\deb\src\deb.lpi              --os=%BUILD_OS%    --cpu=%BUILD_CPU%
lazbuild wcx\rpm\src\rpm.lpi              --os=%BUILD_OS%    --cpu=%BUILD_CPU%
lazbuild wcx\sevenzip\src\sevenzipwcx.lpi --os=%BUILD_OS%    --cpu=%BUILD_CPU%
lazbuild wcx\unrar\src\unrar.lpi          --os=%BUILD_OS%    --cpu=%BUILD_CPU%
lazbuild wcx\zip\src\zip.lpi              --os=%BUILD_OS%    --cpu=%BUILD_CPU%

rem WDX plugins
lazbuild wdx\rpm_wdx\src\rpm_wdx.lpi      --os=%BUILD_OS%    --cpu=%BUILD_CPU%
lazbuild wdx\deb_wdx\src\deb_wdx.lpi      --os=%BUILD_OS%    --cpu=%BUILD_CPU%
lazbuild wdx\xpi_wdx\src\xpi_wdx.lpi      --os=%BUILD_OS%    --cpu=%BUILD_CPU%
lazbuild wdx\audioinfo\src\AudioInfo.lpi  --os=%BUILD_OS%    --cpu=%BUILD_CPU%

rem WFX plugins
lazbuild wfx\ftp\src\ftp.lpi              --os=%BUILD_OS%    --cpu=%BUILD_CPU%

rem WLX plugins
lazbuild wlx\wmp\src\wmp.lpi              --os=%BUILD_OS%    --cpu=%BUILD_CPU%
lazbuild wlx\preview\src\preview.lpi      --os=%BUILD_OS%    --cpu=%BUILD_CPU%

rem Return from plugins directory
popd
