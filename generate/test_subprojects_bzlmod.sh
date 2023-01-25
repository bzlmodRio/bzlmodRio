#!/bin/bash

source ./project_list.sh


for project in "${LIBRARY_PROJECTS[@]}"; do    
    cd /home/pjreiniger/git/bzlmodRio/$project
    bazel build //... -k --config=linux --config=remote --enable_bzlmod

    cd /home/pjreiniger/git/bzlmodRio/$project/tests
    bazel test //... -k --config=linux --config=remote --enable_bzlmod
done