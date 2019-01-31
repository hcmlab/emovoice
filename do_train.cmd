@echo off
SET MODEL=%1
SET CHAIN=%2
SET CORPUS=combined
if not "%3"== "" SET CORPUS=%3

SET ROOT=%~dp0
SET ROOT_SAMPLES=%ROOT%data\%CORPUS%\

SET PATH_TRAINER=%ROOT%models/%MODEL%.trainer
SET PATH_TRAINER_TMP=%ROOT%models/~.trainer
SET PATH_TRAINER_OUT=%ROOT%models/%MODEL%.%CHAIN%.trainer

%ROOT%bin\python.exe python\mktrainer.py %PATH_TRAINER% %ROOT_SAMPLES% %CHAIN% %PATH_TRAINER_TMP% 

%ROOT%bin\xmltrain.exe -out %PATH_TRAINER_OUT% %PATH_TRAINER_TMP%

