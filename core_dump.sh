#!/usr/bin/env bash

## run the following two commands once for a system
## then copy this file to /etc/profile.d/

#echo '/tmp/core_%e.%p' | sudo tee /proc/sys/kernel/core_pattern
#sudo sysctl -w kernel.core_pattern='/tmp/core_%e.%p'

ulimit -a >& /dev/null
ulimit -c unlimited >& /dev/null
