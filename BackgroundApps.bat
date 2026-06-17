@echo off
title Background Apps Manager - Gestor de aplicaciones en segundo plano

powershell -ExecutionPolicy Bypass -NoProfile -File "%~dpn0.ps1"

pause