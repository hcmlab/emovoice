@echo off

set SRC=https://github.com/hcmlab/ssi/raw/master/bin/x64/vc140/
set DST=bin\

%DST%python %DST%has_gpu.py > %DST%has_gpu.txt
set /p GPU=<%DST%has_gpu.txt
%DST%Scripts\pip.exe install tensorflow%GPU%==1.8.0
%DST%Scripts\easy_install.exe termcolor
%DST%Scripts\pip.exe install tensorflow%GPU%==1.8.0
%DST%Scripts\pip.exe install librosa

%DST%wget.exe https://drive.google.com/uc?export=download&id=0B9wE6h4m--wjR015M1RLZW45OEU -O %DST%chains\sound8.py