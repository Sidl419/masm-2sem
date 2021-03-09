@echo off
  set Name=%1
  set masmPath=c:\masm32\
rem    set masmPath=c:\App\masm_6_14\
rem  set path=..\bin;..\..\bin;c:\masm 6.14\bin
  set include=%masmPath%include
  set lib=%masmPath%lib

  %masmPath%bin\ml /nologo /c /coff /Fl %Name%.asm
  
if errorlevel 1 goto errasm

  %masmPath%bin\Link /nologo /subsystem:console %Name%.obj 
  if errorlevel 1 goto errlink
  %Name%.exe
rem       %Name%.exe
  goto TheEnd

:errlink
  echo Link Error !!!!!!!!!!!!!!!!!
  goto TheEnd

:errasm
  echo Assembler Error !!!!!!!!!!!!
  goto TheEnd

:TheEnd

rem  pause
