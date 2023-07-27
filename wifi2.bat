@echo off
echo Refreshing Wi-Fi and DNS settings...
echo.

rem Disable and enable Wi-Fi adapter
echo Disabling Wi-Fi adapter...
netsh interface set interface "Wi-Fi" admin=disable > nul
timeout 2 > nul
echo Enabling Wi-Fi adapter...
netsh interface set interface "Wi-Fi" admin=enable > nul
timeout 2 > nul

rem Flush DNS cache
echo Flushing DNS cache...
ipconfig /flushdns > nul
timeout 2 > nul

rem Reset TCP/IP stack
echo Resetting TCP/IP stack...
netsh int ip reset > nul
timeout 2 > nul

rem Clear ARP cache
echo Clearing ARP cache...
arp -d > nul
timeout 2 > nul

rem Disable autotuning
echo Disabling TCP autotuning...
netsh int tcp set global autotuninglevel=disabled > nul
timeout 2 > nul

rem Disable bandwidth reservation
echo Disabling bandwidth reservation...
netsh int tcp set global congestionprovider=none > nul
timeout 2 > nul

echo.
echo Wi-Fi and DNS settings have been refreshed successfully.
echo Wi-Fi performance and speed optimizations have been applied.
pause
