# MACE-Polar (polar-1-m / polar-1-l)

Reproduction files for the MACE-Polar foundation models (`PolarMACE`), trained
on OMol at the wB97M-V level.

| Model | Layers | hidden_irreps | edge_irreps | Script |
|-------|--------|---------------|-------------|--------|
| polar-1-m | 2 | `512x0e + 512x1o` | `128x0e + 128x1o` | `mace-polar-medium.sh` |
| polar-1-l | 3 | `512x0e + 512x1o + 512x2e` | `128x0e + 128x1o + 128x2e` | `mace-polar-large.sh` |

- `config-mace-polar.yaml` — all hyperparameters shared between the two sizes
  (backbone, field/electrostatics, E0s, element set).
- `omol-statistics-linear.json` — statistics (avg_num_neighbors = 30, mean 0 / std 1).

## Requirements
- A MACE version with `PolarMACE` (`--model=PolarMACE`) and the
  `--warmup_steps_schedulefree` optimizer flag.
- `graph_longrange` must be installed (PolarMACE depends on it).

## Notes
- Loss is `l1l2energyforces` (MAE energy + normed forces), weights 10/10.
- Optimizer: `schedulefree` / AdamWScheduleFree, `betas=(0.9, 0.98)`,
  `warmup_steps=2000`.
- Single `Default` head, no input embeddings.
