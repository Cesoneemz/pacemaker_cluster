#!/bin/bash

service ssh start
sevice pcsd start
service pacemaker start

tail -f /dev/null