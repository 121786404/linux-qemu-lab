#!/bin/bash

cd linux
git diff --name-only | xargs -I {} cp {} --parents ../linux_note
cd ..