#!/bin/bash

#cf login -a https://api.cf.stagingaws.hanavlab.ondemand.com -u devakar.kumar.verma@sap.com -p DTO@06562 -o SAP_autoscaler_performance
for i in {1..1}
do
    
    # cf target -o "SAP_autoscaler_performance"
    #cf create-space "test-"$i
    cf target -o "SAP_autoscaler_performance" -s "test-"$i
    cf cs autoscaler dev autoscaler-instance
    for j in {1..10}
    do
        cf push autoscaler-test-app$j --hostname autoscaler-test-app-$j -m 50M -k 50M -i 1 -p /home/devd/performance/dummy --no-manifest
        cf bs autoscaler-test-app$j autoscaler-instance -c policy_scaling.json
    done
done