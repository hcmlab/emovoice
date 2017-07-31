@echo off

SET ROOT=%~dp0

SET RATE=16000
SET CLASSES="anger;boredom;disgust;fear;happiness;neutral;sadness"
SET CHAIN=compare
SET MODEL=linsvm
SET PIPELINE=emovoice

call do_bin
call do_data
call do_vad %RATE% %CLASSES%
call do_samples %CHAIN%
call do_eval %MODEL% %CHAIN%
call do_train %MODEL% %CHAIN%

do_run %MODEL% %CHAIN%