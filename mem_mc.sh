#!/bin/bash
#sleep 420s
for i in {1..5}
do
    sleep 60s
    mem_per="$(ps aux | grep metricscollector | grep -v grep | awk '{print $4}')"
    echo $mem_per >> mem_mc_3.txt
    cpu_per="$(ps aux | grep metricscollector | grep -v grep | awk '{print $3}')"
    echo $cpu_per >> cpu_mc_3.txt
done
