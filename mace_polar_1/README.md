# MACE-Polar (polar-1-m / polar-1-l)

Reproduction files for the MACE-Polar foundation models (`PolarMACE`), trained
on OMol at the wB97M-V level.

| Model | Layers | hidden_irreps | edge_irreps | Script |
|-------|--------|---------------|-------------|--------|
| polar-1-m | 2 | `512x0e + 512x1o` | `128x0e + 128x1o` | `mace-polar-1-medium.sh` |
| polar-1-l | 3 | `512x0e + 512x1o + 512x2e` | `128x0e + 128x1o + 128x2e` | `mace-polar-1-large.sh` |

- `config-mace-polar-1.yaml` — all hyperparameters shared between the two sizes
  (backbone, field/electrostatics, E0s, element set).
- `omol-statistics-linear.json` — statistics (avg_num_neighbors = 30, mean 0 / std 1).

## Requirements
- A MACE version with `PolarMACE` (`--model=PolarMACE`), the
  `--warmup_steps_schedulefree` optimizer flag, and `--readout_cls`. Older
  versions build a different last readout from the released models, and ignore
  the statistics file's mean/std unless `--mean`/`--std` are also given.
- `graph_longrange` must be installed (PolarMACE depends on it).
- `cuequivariance` for `--enable_cueq=True`. It only accelerates training: the
  model is converted back to e3nn when saved. Convolution fusion stays off
  (`--cueq_conv_fusion=False`); it was slower for this model in training.
- Install with the cueq extra that matches `torch.version.cuda`, e.g.
  `pip install -e "./mace[polar,schedulefree,cueq,cueq-cuda-13]"` for a CUDA 13
  torch (the current PyPI default) or `cueq-cuda-12` for CUDA 12. A mismatched
  extra cannot load its kernels.

## Notes
- Loss is `l1l2energyforces` (MAE energy + normed forces), weights 10/10.
- Optimizer: `schedulefree` / AdamWScheduleFree, `betas=(0.9, 0.98)`,
  `warmup_steps=2000`.
- Single `Default` head, no input embeddings.
- Total batch 512. The medium script runs 64 per GPU (fits 80 GB), so launch it as 8
  processes with one GPU each (e.g. Slurm `--ntasks=8 --gpus-per-task=1`); the release
  used 4 per GPU on 128. The large script keeps the release's 4 per GPU.
