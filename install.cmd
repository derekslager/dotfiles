@echo off
setlocal enabledelayedexpansion

for /D %%d in (*) do (
  mklink /D "%USERPROFILE%\.%%d" "%~dp0\%%d"
)

for %%f in (*) do (
  set dotfile=%%f
  set dotfile1=!dotfile:~0,1!
  set dotfile6=!dotfile:~0,6!
  set dotfile7=!dotfile:~0,7!
  if not !dotfile1! == . (
  if not !dotfile6! == README (
  if not !dotfile7! == install (
    mklink "%USERPROFILE%\.%%f" "%~dp0\%%f"
  )
  )
  )
)
