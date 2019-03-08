@echo off

rem set ASMRPROC=call asmproc
set ASMPROC=node ..\asmproc\asmproc

%ASMPROC% -i gomoku.lm -o gomoku_vic20.asm -t dasm -d VIC20
if %errorlevel% == -1 goto fine

%ASMPROC% -i gomoku.lm -o gomoku_c64.asm   -t dasm -d C64
if %errorlevel% == -1 goto fine

%ASMPROC% -i gomoku.lm -o gomoku_c16.asm   -t dasm -d C16
if %errorlevel% == -1 goto fine

dasm gomoku_vic20.asm -f1 -lgomoku_vic20.lst -ogomoku_vic20.prg
if %errorlevel% == -1 goto fine

dasm gomoku_c64.asm -f1 -lgomoku_c64.lst -ogomoku_c64.prg
if %errorlevel% == -1 goto fine

dasm gomoku_c16.asm -f1 -lgomoku_c16.lst -ogomoku_c16.prg
if %errorlevel% == -1 goto fine

echo "ALL OK!"

:fine



