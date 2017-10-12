#!/bin/bash
export PGPASSWORD='postgres';
for (( i=5; i<6; i++ ))
do
   policy='{ "instance_min_count":1, "instance_max_count":5, "scaling_rules":[ { "metric_type":"memoryused", "stat_window_secs":60, "breach_duration_secs":120, "threshold":100, "operator":">", "cool_down_secs":60, "adjustment":"-1" }, { "metric_type":"memoryused", "stat_window_secs":60, "breach_duration_secs":120, "threshold":30, "operator":"<", "cool_down_secs":60, "adjustment":"-1" } ] }'
   query="INSERT INTO policy_json VALUES ('732d001d-d7b5-483a-b62a-dc628504eacb', '$policy', '$i')"
   psql -U postgres -h 10.0.2.2 -d autoscaler << EOF
   $query
EOF
done
