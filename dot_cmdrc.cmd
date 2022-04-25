@ECHO OFF
REM Source: https://umi-uyura.hatenablog.com/entry/2021/09/30/083419

IF "%WINCMD_INIT%"=="True" (
    EXIT /b
)

SET WINCMD_INIT=True
FOR /f "tokens=*" %%z IN ('fnm env --use-on-cd') DO CALL %%z
