@echo off
cls
echo.
echo.
echo  Android apk toolkit for hack.
echo.  

set apktool_version=2.3.4
set dex2jar_version=0.0.9.15
set apktool=apktool-%apktool_version%
set dex2jar=dex2jar-%dex2jar_version%
set spaces=   
echo %spaces%Tools version:
echo %spaces%-----------------
echo %spaces%%apktool%
echo %spaces%%dex2jar%
echo %spaces%-----------------

if [%1] == [] goto :nofile

set choice_spaces=  
echo.
echo.%choice_spaces%make a choice:
echo %choice_spaces%- - - - - - - - - - - 
echo %choice_spaces%1. dex2jar
echo %choice_spaces%2. decode apk resource
echo %choice_spaces%3. package to apk
echo %choice_spaces%4. sign your apk
echo %choice_spaces%5. exit
echo.

set /p choice=apker#%^>
goto:do%choice% 2> nul
if %errorlevel%==1 goto :do5

:do1
echo use d2j-dex2jar decode your apk...
call %dex2jar%/d2j-dex2jar.bat %1
goto :do5

:do2
echo use apktool decode resources now...
call %apktool%/apktool.bat d %1
goto :do5

:do3
echo use use apktool generate new apk...
call %apktool%/apktool.bat b -o %~n1_new.apk %~n1
goto :do5

:do4
echo use d2j-apk-sign sign your apk...
call %cd%\%dex2jar%\d2j-apk-sign.bat %1
goto :do5

:nofile:
echo.
echo. Where is your apk?

:do5
exit /b


