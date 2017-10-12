#!/bin/bash

for i in {1..20}
do
    for j in {1..500}
    do
        k="$(( (($i - 1) * 500) + ($j ) ))"
        curl -H "content-Type: application/json" -X PUT -d '{"instance_min_count":1,"instance_max_count":5,"scaling_rules":[{"metric_type":"memoryused","stat_window_secs":60,"breach_duration_secs":120,"threshold":100,"operator":">","cool_down_secs":60,"adjustment":"-1"},{"metric_type":"memoryused","stat_window_secs":60,"breach_duration_secs":120,"threshold":30,"operator":"<","cool_down_secs":60,"adjustment":"-1"}]}' http://10.0.2.2:8080/v1/policies/test_app_$k
    done
    sleep 10m
    mem_per="$(ps aux | grep metricscollector | grep -v grep | awk '{print $4}')"
    echo $mem_per >> mem_mc.txt
done
