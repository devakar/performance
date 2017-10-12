#!/bin/bash
export PGPASSWORD='postgres';
for (( i=0; i<20; i++ ))
do
for (( j=1; j<501; j++ ))
do
policy='{ "instance_min_count":1, "instance_max_count":5, "scaling_rules":[ { "metric_type":"memoryused", "stat_window_secs":60, "breach_duration_secs":120, "threshold":100, "operator":">", "cool_down_secs":60, "adjustment":"-1" }, { "metric_type":"memoryused", "stat_window_secs":60, "breach_duration_secs":120, "threshold":30, "operator":"<", "cool_down_secs":60, "adjustment":"-1" } ] }'
k=$i*500+$j
query="INSERT INTO policy_json VALUES ('test-app-$k', '$policy', '$k')"
psql -U postgres -h 10.0.2.2 -d autoscaler << EOF
$query
EOF
done
sleep 300s
for l in {1..5}
do
mem_per="$(ps aux | grep metricscollector | grep -v grep | awk '{print $4}')"
echo $mem_per >> mem_mc_final.txt
cpu_per="$(ps aux | grep metricscollector | grep -v grep | awk '{print $3}')"
echo $cpu_per >> cpu_mc_final.txt
sleep 60s
done
done
