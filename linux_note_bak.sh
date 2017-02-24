#!/bin/bash
 
cd linux
git diff --name-only | xargs -I {} cp {} --parents ../linux_note/tmp
find ../linux_note/tmp/ -type f -print | xargs chmod -x
cd ..