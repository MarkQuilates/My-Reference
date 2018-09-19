#!/bin/bash

exec &> domain.txt

operator=$(cat /root/Task/task-top10-domain-07242018/ops-list)

for ops in $operator;do

                echo
                echo "TOP_10_BEST_performing_domain_of_$ops"
                echo ""
                echo "DOMAIN RESPONSE_TIME_(ms)"
                echo ""

	cat $ops | awk '{print$3,$9}' | sort -k2 -n | sed 's/,//g' | head -n 10 | awk '{print$1,$2}' |  cut -d$'.' -f2,3 #> best
		
		echo
                echo "TOP_10_WORST_performing_domain_of_$ops"
                echo ""
                echo "DOMAIN RESPONSE_TIME_(ms)"
                echo ""

	cat $ops | awk '{print$3,$9}' | sort -k2 -n | sed 's/,//g' | tail -n 10 | awk '{print$1,$2}' |  cut -d$'.' -f2,3 #> worst
done

sed 's/ \+/,/g' domain.txt > Domain-Status.csv

rm domain.txt

#END

