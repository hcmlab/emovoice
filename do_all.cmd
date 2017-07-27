@echo off

SET ROOT=%~dp0

SET DATA_CHUNKS=%ROOT%data\chunks\
SET DATA_COMBINED=%ROOT%data\combined\
SET RATE=44100
SET CLASSES="IR;NE;RA;SM;ST;ZD;ZL"
SET CHAIN=IS13
SET MODEL=linsvm
SET PIPELINE=emovoice

call do_bin
rem call do_vad %DATA_CHUNKS% %DATA_COMBINED% %RATE% %CLASSES%
rem call do_samples %CHAIN%
call do_eval %MODEL% %CHAIN% %DATA_COMBINED%
call do_train %MODEL% %CHAIN% %DATA_COMBINED%
call do_run %MODEL% %CHAIN%