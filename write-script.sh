#!/bin/bash
#cf target -o "SAP_autoscaler_performance" -s "test-1"
for j in {1..10}
    do
        echo 'cf push autoscaler-test-app-'$j ' --hostname autoscaler-test-app-'$j ' -b nodejs_buildpack -m 50M -k 50M -i 1 -p /home/devd/performance/dummy --no-manifest &' >> push_parallel.sh
        echo 'cf bs autoscaler-test-app-'$j ' autoscaler-instance -c policy.json &' >> bind_parallel.sh
        #echo 'cf us  autoscaler-test-app-'$j ' autoscaler-instance &' >>unbind_parallel.sh
        #echo 'cf delete autoscaler-test-app-'$j ' -f &' >> del_parallel.sh
    done

echo 'wait' >> push_parallel.sh
echo 'wait' >> bind_parallel.sh
#echo 'wait' >> unbind_parallel.sh
#echo 'wait' >> del_parallel.sh

