@echo off

SET SRC=http://emodb.bilderbar.info/download/download.zip
SET DST=data\chunks\download.zip 

python python\download.py %SRC% %DST%
python python\mkdata.py %DST%

DEL %DST%
