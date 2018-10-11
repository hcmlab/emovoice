@echo off

cd /D bin
del /F /Q *.dll
cd ..

set PYTHON_VER_FULL=3.6.4
set PYTHON_VER=36

set SRC=https://github.com/hcmlab/ssi/raw/master/bin/x64/vc140/
set DST=bin\

%DST%wget.exe https://www.python.org/ftp/python/%PYTHON_VER_FULL%/python-%PYTHON_VER_FULL%-embed-amd64.zip -O %DST%python-%PYTHON_VER_FULL%-embed-amd64.zip
%DST%7za.exe x %DST%python-%PYTHON_VER_FULL%-embed-amd64.zip -aoa -o%DST%
%DST%7za.exe x %DST%python%PYTHON_VER%.zip -aoa -o%DST%python%PYTHON_VER%
%DST%wget.exe -q %SRC%python%PYTHON_VER%._pth -O %DST%python%PYTHON_VER%._pth
%DST%wget.exe -q https://bootstrap.pypa.io/get-pip.py -O %DST%get-pip.py
%DST%python %DST%get-pip.py
%DST%Scripts\pip.exe install numpy
%DST%Scripts\pip.exe install scipy
%DST%wget.exe %SRC%xmlpipe.exe -O %DST%xmlpipe.exe 
%DST%wget.exe %SRC%xmlchain.exe -O %DST%xmlchain.exe 
%DST%wget.exe %SRC%xmltrain.exe -O %DST%xmltrain.exe 
