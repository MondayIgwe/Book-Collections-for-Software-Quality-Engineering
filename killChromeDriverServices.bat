echo Kill all Chromedriver services/processes
tasklist
pause
taskkill /f /t /im chromedriver.*
pause
exit