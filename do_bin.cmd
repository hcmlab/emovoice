@echo off

cd /D bin
del /F /Q *.dll
cd ..

python python\download.py xmlpipe.exe
python python\download.py xmlchain.exe
python python\download.py xmltrain.exe
