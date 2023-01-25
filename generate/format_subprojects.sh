#!/bin/bash

source ./project_list.sh


for project in "${LIBRARY_PROJECTS[@]}"; do    
    cd /home/pjreiniger/git/bzlmodRio/$project/generate
    python3 -m black *.py
done