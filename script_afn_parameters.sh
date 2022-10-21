#!bin/bash

radius_hafn=(0.1 0.5 0.8 1 5 10 25)
radius_safn=(0.05 0.1 0.3 0.5)
weights=(0.01 0.1 0.5 0.8 2)

path_hafn="/home/fontana/resultsAFN/hafn.txt"
path=safn="/home/fontana/resultsAFN/safn.txt"

sources=(1 2 3)
targets=(1 2 3)

frame_agg=trn-m
adv='Y Y Y'
alpha=0.0003
bs=0.5
bt=0.75
bg=0.75
gamma=0.0003
batch_size=128
loss=HAFN

for r in "${radius_hafn[@]}"; do
    for weight in "${weights[@]}"; do
        
        train=true
        test=false
        echo -e "\nD${source}->D${target}\n" >> $path_hafn
        echo -e "CONFIGURATION\nweight:${weight}\nradius:$r\n" >> $path_hafn
        bash script_test_ta3n.sh $train $test 1 2 $frame_agg "${adv[@]}" $alpha $bs $bt $bg $gamma $batch_size $loss $weight $r 0

        train=false
        test=true

        bash script_test_ta3n.sh $train $test 1 2 $frame_agg "${adv[@]}" $alpha $bs $bt $bg $gamma $batch_size $loss $weight $r 0 >> $path_hafn
         
    done
done

loss=SAFN

for r in "${radius_safn[@]}"; do
    for weight in "${weights[@]}"; do
        train=true
        test=false
        echo -e "\nD${source}->D${target}\n" >> $path_safn
        echo -e "CONFIGURATION\nweight:${weight}\nradius:$r\n" >> $path_safn
        bash script_test_ta3n.sh $train $test $source $target $frame_agg "${adv[@]}" $alpha $bs $bt $bg $gamma $batch_size $loss $weight 0 $r

        train=false
        test=true

        bash script_test_ta3n.sh $train $test 1 2 $frame_agg "${adv[@]}" $alpha $bs $bt $bg $gamma $batch_size $loss $weight 0 $r >> $path_safn
    done
done 