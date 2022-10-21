#!bin/bash

source_v=(1 2 3)
target_v=(1 2 3)

frame_agg_v=('avgpool' 'trn-m')

adv_v=('Y N N' 'N Y N' 'N N Y' 'Y Y Y')

alpha=0.0003
gamma=0.0003
bs=0.5
bt=0.75
bg=0.75
batch_size=128
loss=hafn

path="/home/fontana/training_testing_results/"
for frame_agg in "${frame_agg_v[@]}"; do
    for source in "${source_v[@]}"; do
        for target in "${target_v[@]}"; do
            if [ $source != $target ]; then
                file="${path}D${source}_D${target}_${frame_agg}.txt"

                echo "creating file ${file}"
                for adv in "${adv_v[@]}"; do
                    echo -e "\nADV: ${adv}\n" >> $file
                    echo -e "****TRAINING****\n\n" >> $file
                    train=true
                    test=false
                    bash script_test_ta3n.sh $train $test $source $target $frame_agg "${adv[@]}" $alpha $bs $bt $bg $gamma $batch_size>> $file
                    echo -e "\n****TESTING****\n\n" >> $file
                    train=false
                    test=true
                    bash script_test_ta3n.sh $train $test $source $target $frame_agg "${adv[@]}" $alpha $bs $bt $bg $gamma $batch_size >> $file
                done
            fi
        done
    done
done

