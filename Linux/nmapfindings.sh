#!/bin/bash
HW8dir=$HOME/Documents/HW8;
fpresults=$HW8dir/results;

if [ ! -f $HW8dir/nmapresults ]
then
	touch $HW8dir/nmapresults;
#	nmapr=$HW8dir/nmapresults
else
	nmapr=$HW8dir/nmapresults;
fi

nmapr=$HW8dir/nmapresults;

#alive={cat $HW8dir/aliveips};

if [ ! -f $HW8dir/aliveips ];
then
        touch $HW8dir/aliveips
        alive=$HW8dir/aliveips
else
        alive=$HW8dir/aliveips
fi

grep "alive" $HW8dir/results | awk -F" " '{print $1 }' > $HW8dir/aliveips; 

#alive={cat $HW8dir/aliveips};
 
alive2=$(cat $HW8dir/aliveips)

for line in ${alive2[@]}
do
	echo "Starting nmap" > $nmapr
	nmap -sS $alive2 >> $nmapr 
	echo "Done" >> $nmapr
done
