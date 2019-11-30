#!/bin/bash
#1
echo "Топ-10 клиентских URL запрашиваемых с этого сервера"
grep -wo "http://.*" access.log | awk '{print $1}' | uniq -d -c | sort -u | uniq > 1.1.txt && grep -wo "https://.*" access.log | awk '{print $1}' | uniq -d -c | sort -u | uniq >> 1.1.txt && tail -n 10 1.1.txt | uniq | sort -n -k1 &&
echo "------------------------------------------------------" 
#2
echo "Топ-10 клиентских IP"
cat access.log | awk '{print $1}' | uniq -c -d | sort -n > 2.2.txt && tail -n 10 2.2.txt &&
echo "------------------------------------------------------"
#3
echo "Все коды состояния HTTP и их количество"
cat access.log | awk '{print $9}' | uniq -c | sort -n > 3.3.txt && cat 3.3.txt && 
echo "------------------------------------------------------" 
#4
echo "Все коды состояния  4xx и 5xx"
cat access.log | awk '{print $9}' | grep ^4 > 4.4.txt && cat access.log | awk '{print $9}'  | grep ^5 >> 4.4.txt && cat 4.4.txt | uniq -d -c | sort -n > 4.5.txt && cat 4.5.txt &&
echo "------------------------------------------------------"
echo "all"
rm -f 1.1.txt 2.2.txt 3.3.txt 4.4.txt 4.5.txt
