#!/bin/bash

source ./project_list.sh


for project in "${PROJECTS[@]}"; do
    cd /home/pjreiniger/git/bzlmodRio/$project
    bazel clean --expunge
    
    cd /home/pjreiniger/git/bzlmodRio/$project/tests
    bazel clean --expunge
    
    cd /home/pjreiniger/git/bzlmodRio/$project/generate
    bazel clean --expunge
done