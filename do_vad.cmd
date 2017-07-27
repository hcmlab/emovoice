@echo off

SET ROOT=%~dp0
SET CHUNKS_ROOT=%1
SET COMBINED_ROOT=%2
SET LIST=%CHUNKS_ROOT%list.txt
SET RATE=%3
SET CLASSES=%4

python.exe python\mklist.py %CHUNKS_ROOT%

%ROOT%bin\vadanno.exe %CHUNKS_ROOT% %RATE% %COMBINED_ROOT% %LIST% %CLASSES%

