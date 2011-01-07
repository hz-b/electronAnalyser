@echo OFF
@echo.
@echo ****************************************************
@echo * *
@echo * Configuring EPICS environment *
@echo * *
@echo * Remember to set your EPICS_CA_SERVER_PORT and *
@echo * EPICS_CA_REPEATER_PORT (usually 5064 and 5065) *
@echo * AND open up those two ports on the Windows *
@echo * firewall for *both* UDP and TCP!!! *
@echo * *
@echo * If DLS_EPICS_RELEASE have not already been set *
@echo * the script will set it to the default: R3.14.10 *
@echo * *
@echo ****************************************************
@echo. 

echo Setup IOC depolyment environment

if [%DLS_EPICS_RELEASE%]==[] (
set DLS_EPICS_RELEASE=R3.14.10
)
set EPICS_INSTALLATION=W:
echo EPICS_INSTALLATION=%EPICS_INSTALLATION%

set EPICS_BASE=%EPICS_INSTALLATION%\epics\%DLS_EPICS_RELEASE%\base
echo EPICS_BASE=%EPICS_BASE%
set EPICS_EXTENSIONS=%EPICS_INSTALLATION%\epics\%DLS_EPICS_RELEASE%\extensions
echo EPICS_EXTENSIONS=%EPICS_EXTENSIONS%
set EPICS_HOST=WIN32
set EPICS_HOST_ARCH=win32-x86
echo EPICS_HOST_ARCH=%EPICS_HOST_ARCH%
set EPICS_SUPPORT=%EPICS_INSTALLATION%\epics\%DLS_EPICS_RELEASE%\support
echo EPICS_SUPPORT=%EPICS_SUPPORT%
set EPICS_MBA_TEMPLATE_TOP=%EPICS_BASE%\Templates\makeBaseApp\top
echo EPICS_MBA_TEMPLATE_TOP=%EPICS_MBA_TEMPLATE_TOP%
set AREA_DETECTOR=%EPICS_INSTALLATION%\prod\%DLS_EPICS_RELEASE%\support\areaDetector\1-5
echo AREA_DETECTOR=%AREA_DETECTOR%

echo Setting default EPICS ports...
set EPICS_CA_SERVER_PORT=5064
echo EPICS_CA_SERVER_PORT=%EPICS_CA_SERVER_PORT%
set EPICS_CA_REPEATER_PORT=5065
echo EPICS_CA_REPEATER_PORT=%EPICS_CA_REPEATER_PORT% 
set EPICS_CA_MAX_ARRAY_BYTES=100000000
echo EPICS_CA_MAX_ARRAY_BYTES=%EPICS_CA_MAX_ARRAY_BYTES%

echo Setting medm Client runnng on IOC PC
set EPICS_CA_AUTO_ADDR_LIST=NO
echo EPICS_CA_AUTO_ADDR_LIST=%EPICS_CA_AUTO_ADDR_LIST%
set EPICS_CA_ADDR_LIST=172.23.112.255
echo EPICS_CA_ADDR_LIST=%EPICS_CA_ADDR_LIST%

echo add EPICS_BASE and AEA_DETECTOR Support to PATH.
set PATH=%AREA_DETECTOR%\bin\%EPICS_HOST_ARCH%;%EPICS_BASE%\bin\%EPICS_HOST_ARCH%;%EPICS_EXTENSIONS%\bin\%EPICS_HOST_ARCH%;%PATH%
echo PATH=%PATH%

set ELECTRON_ANALYSER_INSTALLATION=c:\ElectronAnalyzerIOC
echo ELECTRON_ANALYSER_INSTALLATION=%ELECTRON_ANALYSER_INSTALLATION%
set EPICS_IOC_LOG_FILE_NAME=c:\ElectronAnalyzerIOC\logs\electronanalyserioc.log
echo EPICS_IOC_LOG_FILE_NAME=%EPICS_IOC_LOG_FILE_NAME%
set EPICS_IOC_LOG_FILE_LIMIT=1000000
echo EPICS_IOC_LOG_FILE_LIMIT=%EPICS_IOC_LOG_FILE_LIMIT%
set EPICS_IOC_LOG_INET=172.23.112.131
echo EPICS_IOC_LOG_INET=%EPICS_IOC_LOG_INET%
