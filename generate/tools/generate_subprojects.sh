#!/bin/bash

source ./project_list.sh


for project in "${LIBRARY_PROJECTS[@]}"; do    
    cd /home/pjreiniger/git/bzlmodRio/$project/generate
    bazel run //:generate && buildifier --lint=fix -r .. 
done