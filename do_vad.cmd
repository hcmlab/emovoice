@echo off

SET ROOT=%~dp0
SET RATE=%1
SET CLASSES=%2
SET CORPUS=combined
if not "%3"== "" SET CORPUS=%3

SET DATA_CHUNKS=%ROOT%data\chunks\
SET DATA_COMBINED=%ROOT%data\%CORPUS%\
SET LIST=%DATA_CHUNKS%list.txt

%ROOT%bin\python.exe python\mklist.py %DATA_CHUNKS%
%ROOT%bin\vadanno.exe -silence 1.0 -nTest 3 %DATA_CHUNKS% %RATE% %DATA_COMBINED% %LIST% %CLASSES%

