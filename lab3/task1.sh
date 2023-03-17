#!/bin/bash
cur_date=$(date)
mkdir $HOME/test && echo "catalog test was created successfully" >> $HOME/report && touch $HOME/test/${cur_date// /_}
ping -c1 www.net_nikogo.ru || { echo "$(date) - error service is not available" >> $HOME/report; }
