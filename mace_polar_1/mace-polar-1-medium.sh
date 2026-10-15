# MACE-Polar-1-M (medium): 2-layer PolarMACE.
# The release was trained on 128 GPUs at --batch_size=4. --batch_size=64 on 8 GPU processes keeps the
# total batch of 512 and fits an 80 GB GPU: peak 53 GiB on the largest 64-structure batch
# expected in an epoch of OMol train (5.5k atoms); fits at 7.0k atoms, out of memory at 8.5k.
python ./mace/mace/cli/run_train.py \
    --name="polar-1-m" \
    --config=config-mace-polar-1.yaml \
    --train_file="omol/train/" \
    --valid_file="omol/neutral_val/" \
    --test_dir="omol/neutral_val/" \
    --statistics_file="omol-statistics-linear.json" \
    --model="PolarMACE" \
    --num_interactions=2 \
    --hidden_irreps="512x0e + 512x1o" \
    --edge_irreps="128x0e + 128x1o" \
    --loss='l1l2energyforces' \
    --energy_weight=10.0 \
    --forces_weight=10.0 \
    --energy_key='REF_energy' \
    --forces_key='REF_forces' \
    --total_charge_key='charge' \
    --total_spin_key='spin' \
    --error_table='PerAtomRMSE' \
    --eval_interval=1 \
    --batch_size=64 \
    --valid_batch_size=2 \
    --optimizer="schedulefree" \
    --beta1_schedulefree=0.9 \
    --beta2_schedulefree=0.98 \
    --warmup_steps_schedulefree=2000 \
    --ema \
    --ema_decay=0.99999 \
    --weight_decay=1e-8 \
    --clip_grad=1.0 \
    --default_dtype="float32" \
    --device=cuda \
    --enable_cueq=True \
    --cueq_conv_fusion=False \
    --seed=1 \
    --save_cpu \
    --restart_latest \
    --distributed \
    --launcher="slurm" \
    --num_workers=4
