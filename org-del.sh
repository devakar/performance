#!/bin/bash

for i in {1..800}
do
    cf delete autoscaler-test-app-$i -f
done