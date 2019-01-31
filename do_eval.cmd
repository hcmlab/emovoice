@echo off

SET ROOT=%~dp0
SET MODEL=%1
SET CHAIN=%2
SET CORPUS=combined
if not "%3"== "" SET CORPUS=%3

SET ROOT_SAMPLES=%ROOT%data\%CORPUS%\

SET PATH_TRAINER=%ROOT%models/%MODEL%.trainer
SET PATH_TRAINER_TMP=%ROOT%models/~.trainer
SET PATH_EVAL=%ROOT%models/%MODEL%.%CHAIN%.txt

%ROOT%bin\python.exe python\mktrainer.py %PATH_TRAINER% %ROOT_SAMPLES% %CHAIN% %PATH_TRAINER_TMP% 

%ROOT%bin\xmltrain.exe -eval 0 -kfolds 2 -out %PATH_EVAL% %PATH_TRAINER_TMP%