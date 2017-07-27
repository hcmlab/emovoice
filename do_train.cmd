@echo off

SET ROOT=%~dp0

SET MODEL=%1
SET CHAIN=%2
SET ROOT_SAMPLES=%3%

SET PATH_TRAINER=%ROOT%models/%MODEL%.trainer
SET PATH_TRAINER_TMP=%ROOT%models/~.trainer
SET PATH_TRAINER_OUT=%ROOT%models/%MODEL%.%CHAIN%.trainer

python.exe python\mktrainer.py %PATH_TRAINER% %ROOT_SAMPLES% %CHAIN% %PATH_TRAINER_TMP% 

%ROOT%\bin\xmltrain.exe -out %PATH_TRAINER_OUT% %PATH_TRAINER_TMP%

