@echo off

cd %USERPROFILE%\dotfiles

for %%I in (.\.*) do (
    mklink %USERPROFILE%\"%%~nxI" "%%~fI"
)


for /d %%I in (.\.*) do (
  mklink /d %USERPROFILE%\"%%~nxI" "%%~fI"
)
