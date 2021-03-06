title ThinkSQL ODBC Driver

"c:\program files\borland\delphi5\bin\brcc32" version.rc >build.log

if exist thinkSQLodbc.cfg (
	findstr /R /I /V "^-D" thinkSQLodbc.cfg >dcc32.cfg

	del thinkSQLodbc.cfg  
)

echo %date% %time% >>build.log

if /I "%1"=="TEST" (
	echo TEST >>build.log
	"c:\program files\borland\delphi5\bin\dcc32" -B -DDEBUG_LOG thinkSQLodbc.dpr >>build.log
) else (
	echo LIVE >>build.log
	"c:\program files\borland\delphi5\bin\dcc32" -B -$O+ -$R- -$Q- thinkSQLodbc.dpr >>build.log

       copy thinkSQLodbc.exe c:\ThinkSQLSource >>build.log
       copy thinkSQLodbc.dll c:\ThinkSQLSource >>build.log

	echo thinkSQLodbc: >>c:\ThinkSQLSource\success.log
	findstr /R "^[0-9] lines, " build.log >>c:\ThinkSQLSource\success.log
) 