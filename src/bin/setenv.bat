@echo off
REM
REM setenv.sh: Sets the Mibble environment variables
REM

REM Set MIBBLE_HOME variable
if not "%MIBBLE_HOME%" == "" goto doneHome
set MIBBLE_HOME=.
if exist "%MIBBLE_HOME%\lib\*.jar" goto doneHome
set MIBBLE_HOME=..
:doneHome

REM Check JAVA_HOME variable
if not "%JAVA_HOME%" == "" goto doneJava
echo Error: JAVA_HOME environment variable not set
pause
goto end
:doneJava

REM Adjust CLASSPATH variable
if exist "%MIBBLE_HOME%\lib\*.jar" goto doneLib
echo Error: %MIBBLE_HOME%\lib does not exist
pause
goto end
:doneLib
if not "%CLASSPATH%" == "" goto addCls
set CLASSPATH=%MIBBLE_HOME%\lib\mibble-@VERSION@.jar;%MIBBLE_HOME%\lib\grammatica-1.4.jar;%MIBBLE_HOME%\lib\snmp4_13.jar
goto doneCls
:addCls
set CLASSPATH=%CLASSPATH%;%MIBBLE_HOME%\lib\mibble-@VERSION@.jar;%MIBBLE_HOME%\lib\grammatica-1.4.jar;%MIBBLE_HOME%\lib\snmp4_13.jar
:doneCls

REM Display variables
echo Using environment variables:
echo   MIBBLE_HOME = %MIBBLE_HOME%
echo   JAVA_HOME   = %JAVA_HOME%
echo   CLASSPATH   = %CLASSPATH%
echo.
echo If an "out of environment space" message is listed above,
echo please consult Microsoft KB article 230205 to correct that.
echo.

:end
