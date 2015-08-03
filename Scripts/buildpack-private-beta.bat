call "D:\Program Files (x86)\Microsoft Visual Studio 12.0\VC\vcvarsall.bat"
SETLOCAL
SET VERSION=%1
SET CNT=%2
SET NUGET=.\..\tools\nuget\nuget.exe

rmdir .\..\obj /s /q
rmdir .\..\release /s /q
msbuild updateversionnumber.proj /p:AsmVersion=%VERSION%
msbuild build-private-beta.proj 
%NUGET% pack Mapsui.nuspec -Version %VERSION%-beta%CNT% -outputdirectory .\..\Release


