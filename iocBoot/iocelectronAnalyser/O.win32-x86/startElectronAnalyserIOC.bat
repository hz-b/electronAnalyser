cd "c:\ElectronAnalyzerIOC"

@rem set the various environment options: path and EPICS stuff
call "bin\win32-x86\profile.bat"

echo
echo "Starting the Electron Analyser IOC"
@rem run up the IOC with the startup script as argument
bin\win32-x86\electronAnalyser.exe bin\win32-x86\stelectronAnalyser.boot

