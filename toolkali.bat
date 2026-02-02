@echo off
title Auto Extension Changer by Gemini
color 0A
echo ---------------------------------------------------
echo    Windows File Extension Changer Tool
echo ---------------------------------------------------
echo.
echo This tool will change EVERY file in this folder.
echo (It will skip this script file automatically)
echo.

:: 1. ถามนามสกุลที่ต้องการ
set /p new_ext=Enter new extension (e.g. txt, jpg, mp4): 

:: ตรวจสอบว่าใส่ค่ามาไหม
if "%new_ext%"=="" goto Error

echo.
echo Processing... Please wait.
echo.

:: 2. วนลูปเปลี่ยนชื่อไฟล์
for %%f in (*.*) do (
    :: เช็คว่าไม่ใช่ตัวไฟล์สคริปต์เอง (เพื่อกัน error)
    if /I not "%%~nxf"=="%~nx0" (
        ren "%%f" "%%~nf.%new_ext%"
    )
)

echo.
echo [SUCCESS] All files have been changed to .%new_ext%
echo.
pause
exit

:Error
echo.
echo [ERROR] You must type an extension!
pause