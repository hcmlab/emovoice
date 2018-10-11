@echo off

SET ROOT=%~dp0
SET DATA_CHUNKS=%ROOT%data\chunks\
SET DATA_COMBINED=%ROOT%data\combined\
SET LIST=%DATA_CHUNKS%list.txt
SET RATE=%1
SET CLASSES=%2

%ROOT%bin\python.exe python\mklist.py %DATA_CHUNKS%
%ROOT%bin\vadanno.exe -silence 1.0 -nTest 3 %DATA_CHUNKS% %RATE% %DATA_COMBINED% %LIST% %CLASSES%

