cf push autoscaler-test-app-1  --hostname autoscaler-test-app-1  -b nodejs_buildpack -m 50M -k 50M -i 1 -p /home/devd/performance/dummy --no-manifest &
cf push autoscaler-test-app-2  --hostname autoscaler-test-app-2  -b nodejs_buildpack -m 50M -k 50M -i 1 -p /home/devd/performance/dummy --no-manifest &
cf push autoscaler-test-app-3  --hostname autoscaler-test-app-3  -b nodejs_buildpack -m 50M -k 50M -i 1 -p /home/devd/performance/dummy --no-manifest &
cf push autoscaler-test-app-4  --hostname autoscaler-test-app-4  -b nodejs_buildpack -m 50M -k 50M -i 1 -p /home/devd/performance/dummy --no-manifest &
cf push autoscaler-test-app-5  --hostname autoscaler-test-app-5  -b nodejs_buildpack -m 50M -k 50M -i 1 -p /home/devd/performance/dummy --no-manifest &
cf push autoscaler-test-app-6  --hostname autoscaler-test-app-6  -b nodejs_buildpack -m 50M -k 50M -i 1 -p /home/devd/performance/dummy --no-manifest &
cf push autoscaler-test-app-7  --hostname autoscaler-test-app-7  -b nodejs_buildpack -m 50M -k 50M -i 1 -p /home/devd/performance/dummy --no-manifest &
cf push autoscaler-test-app-8  --hostname autoscaler-test-app-8  -b nodejs_buildpack -m 50M -k 50M -i 1 -p /home/devd/performance/dummy --no-manifest &
cf push autoscaler-test-app-9  --hostname autoscaler-test-app-9  -b nodejs_buildpack -m 50M -k 50M -i 1 -p /home/devd/performance/dummy --no-manifest &
cf push autoscaler-test-app-10  --hostname autoscaler-test-app-10  -b nodejs_buildpack -m 50M -k 50M -i 1 -p /home/devd/performance/dummy --no-manifest &
wait
