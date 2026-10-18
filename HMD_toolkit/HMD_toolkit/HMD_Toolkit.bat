@echo off
rem Launcher for the HMD Toolkit GUI (in case .pyw isn't associated with pythonw)
start "" pythonw "%~dp0HMD_Toolkit.pyw" 2>nul || python "%~dp0HMD_Toolkit.pyw"
