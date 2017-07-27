@echo off

SET ROOT=%~dp0
SET DATA_ROOT=%ROOT%data\combined\
SET CHAIN_ROOT=%ROOT%chains\

SET CHAIN=%1
SET N_PARALLEL=8
SET STREAM_EXT=.wav

SET ANNO_LIST=%DATA_ROOT%~anno.txt
SET STREAM_LIST=%DATA_ROOT%~stream.txt
SET SAMPLE_LIST=%DATA_ROOT%~sample.txt

DEL %ANNO_LIST%
DEL %STREAM_LIST%
DEL %SAMPLE_LIST%

for /r %DATA_ROOT% %%i in (%ANNO%*.annotation) do (
	echo %%i >> %ANNO_LIST%
	echo %%~dpni%STREAM_EXT% >> %STREAM_LIST%
	echo %%~dpni.%CHAIN% >> %SAMPLE_LIST%
)

%ROOT%bin\xmlchain.exe -list -anno %ANNO_LIST% -parallel %N_PARALLEL%  %CHAIN_ROOT%%CHAIN% %STREAM_LIST% %SAMPLE_LIST%

DEL %ANNO_LIST%
DEL %STREAM_LIST%
DEL %SAMPLE_LIST%