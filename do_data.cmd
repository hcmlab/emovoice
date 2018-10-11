@echo off

SET ROOT=%~dp0

SET SRC=http://emodb.bilderbar.info/download/download.zip
SET DST=data\chunks\download.zip 

%ROOT%bin\python.exe python\download.py %SRC% %DST%
%ROOT%bin\python.exe python\mkdata.py %DST%

DEL %DST%
