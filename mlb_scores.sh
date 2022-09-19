#!/bin/bash 
#cerner_2tothe5th_2022
echo "-------------------------------------------"
curl -s 'http://statsapi.mlb.com/api/v1/schedule/games/?sportId=1' | jq -r '.dates | .[] | .games | .[] | .teams' | egrep 'home|away|name|score|detailedState' | sed  's/\"away\":\ {/\n-------------------------------------------\n/g' | sed 's/\"home\":\ {//g' | awk '{a[i++]=$0} END {for (j=i-1; j>=0;) print a[j--] }' | awk 'NR%2{printf "%s ",$0;next;}1' | sed 's/\"//g'  | sed 's/\ //g' | sed 's/name://g' | sed 's/score:/:\ /g' | sed 's/.$//g' | sed 's/,/:\ /g' 


#update every 2 seconds 
sleep 2
watch -d sh mlb_scores.sh
