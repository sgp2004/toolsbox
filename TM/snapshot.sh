time=`/bin/date +%m-%d-%H-%M`;
file="data/JVM_Stat_"$time".html";
/usr/bin/wget -q --timeout=90 'http://localhost:8080/TM/all.jsp' -O $file
/bin/echo "<a href=\"data/JVM_Stat_$time.html\">$time</a><br>" >> info.html
