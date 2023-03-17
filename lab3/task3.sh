#!/bin/bash
crontab -r
echo "*/5 * * * 1 bash $HOME/first_laba/lab3/task1.sh" | crontab
