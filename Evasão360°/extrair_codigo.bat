@echo off
setlocal enabledelayedexpansion

REM Caminho até a pasta 'main' onde estão os arquivos .java e .jsp
cd /d "C:\Users\Cliente\nicolegg13\trab-final-spi-meninasmalvadas\Evasão360°"

set "PASTA=."
set "ARQUIVO_SAIDA=e360-codes.txt"

REM Apagar arquivo anterior, se existir
if exist "%ARQUIVO_SAIDA%" del "%ARQUIVO_SAIDA%"

REM Percorrer todos os arquivos .java e .jsp na pasta e subpastas
for /R "%PASTA%" %%F in (*.java *.jsp *.css *.xml) do (
    echo - Endereço: %%F:>>"%ARQUIVO_SAIDA%"
    type "%%F" >>"%ARQUIVO_SAIDA%"
    echo.>>"%ARQUIVO_SAIDA%"
    echo.>>"%ARQUIVO_SAIDA%"
)

echo Finalizado. Arquivo gerado: %CD%\%ARQUIVO_SAIDA%
pause
