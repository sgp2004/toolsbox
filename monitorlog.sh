#!/bin/bash
#
#	Log monitoring
#
#Please in '#' place accordingly

while :
do
	today=`date "+%Y%m%d"`

#Fill in the log file absolute path
	log_file=/tmp/test.log

#Fill in the script execution record log files 
	out_log=/tmp/${today}.log

#Fill in monitoring project name 
	monitor_project=test

#Fill in time interval
	with_time=5m

#Fill in the restart script path 
	sh_file=/tmp/restart_test.sh

	m_line_begin=`wc -l ${log_file} | awk '{print $1}'`
	sleep ${with_time}
	m_line_now=`wc -l ${log_file} | awk '{print $1}'`

	date_now=`date "+%Y%m%d %T"`
	if [ ${m_line_now} -gt ${m_line_begin} ]
	then
		echo "Time: ${date_now} ${monitor_project} Log check, the rolling to normal!" >> ${out_log}
	elif [ ${m_line_now} -lt ${m_line_begin} ]
	then
		echo "Time: ${date_now} ${monitor_project} Log check, the rolling to normal!" >> ${out_log}
	else
		echo "Time: ${date_now} ${monitor_project} Log check, not rolling!!! Execute the restart scripts!!!" >> ${out_log}
		sh ${sh_file} >>${out_log} 2>&1
	fi
done
