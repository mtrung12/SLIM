#!/bin/bash

for lr in 1e-5 3e-5 5e-5; do
  for bs in 64 128 256; do
    for wd in 0.0 0.01; do
      for slot in 0.5 1.0 2.0; do
        python main.py \
          --task mytask \
          --model_dir model_lr${lr}_bs${bs}_wd${wd}_slot${slot} \
          --do_train --do_eval \
          --learning_rate $lr \
          --train_batch_size $bs \
          --weight_decay $wd \
          --slot_loss_coef $slot
      done
    done
  done
done
