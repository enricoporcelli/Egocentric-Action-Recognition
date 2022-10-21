#!/bin/bash
lr=(0.0003, 0.001, 0.003, 0.1)
gamma=(0.0003, 0.03, 0.3)
bs=(0.25, 0.5, 0.75, 1)
bt=(0.25, 0.5, 0.75, 1)
bg=(0.25, 0.5, 0.75, 1)
source=$1
target=$2
aggr=$3
if [ $aggr = "avgpool" ];then
  g=0.003
  b=64
else
  g=0.03
  b=128
fi

path='/home/fontana/Training_results/RGB/D'$source'-D'$target'_'$aggr'_train.txt"'
# for alpha in "${alphas[@]}"; do
#   echo "Alpha: $alpha" >> "$path"
#             for b2 in "${beta2[@]}"; do
#               echo -e "\tBeta2: $b2" >> $path
#                 for g in "${gamma[@]}"; do
#                   echo -e "\t\tGamma: $g" >> $path
#                     for b in "${bs[@]}"; do
#                       echo -e "\t\t\tBatch: $b" >> $path
#                       rm -rf model
#                       ./script_test_ta3n.sh true true $source $target $aggr 'N N Y'\
#                       $alpha -1 -1 $b2 $g $b
#                     done
#                 done
#             done
# done
for alpha in "${alphas[@]}"; do
   for b1 in "${bt[@]}"; do
    for g in "${gamma[@]}"; do
      for b2 in "${bs[@]}"; do
        for b3 in "${bg[@]}"; do
          echo "CONFIGURATION: alpha=$alpha, bs=$b, bt=$b2, gamma=$g, bg=$b1"
          rm -rf model
          ./script_test_ta3n.sh true true $source $target $aggr 'N N Y'\
          $alpha $b1 $b2 $b3 $g
        done
      done
    done
  done
done