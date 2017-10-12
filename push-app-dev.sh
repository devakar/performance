#!/bin/bash
cf target -o "SAP_Autoscaler_PFtest" -s "PFTest"
#cf cs autoscaler dev autoscaler-instance
for j in {1..1500}
do
    #cf push autoscaler-test-app-$j --hostname auto-test-app-$j -b nodejs_buildpack -m 100M -k 100M -i 1 -p /home/devd/performance/memory-hogger --no-manifest
    #sleep 1
    cf bs autoscaler-test-app-$j autoscaler-instance -c policy.json
    #sleep 10
done