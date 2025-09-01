# MACE-FOUNDATION models

This repository contains the MACE pre-trained foundation models for materials chemistry, parameterised for 89 chemical elements.

To use the models please install the [MACE code](https://github.com/ACEsuit/mace).

Models also available on Hugging Face: https://huggingface.co/mace-foundations.

## Models

### Latest Recommended Foundation Models

| Model Name        | Elements Covered | Training Dataset | Level of Theory       | Target System         | Model Size          | GitHub Release | Notes                                                | License |
|-------------------|------------------|------------------|-----------------------|----------------------|---------------------|----------------|-------------------------------------------------------|---------|
| MACE-MP-0a         | 89               | MPTrj            | DFT (PBE+U)           | Materials            | [small](https://github.com/ACEsuit/mace-mp/releases/download/mace_mp_0/2023-12-10-mace-128-L0_energy_epoch-249.model), [medium](https://github.com/ACEsuit/mace-mp/releases/download/mace_mp_0/2023-12-03-mace-128-L1_epoch-199.model), [large](https://github.com/ACEsuit/mace-mp/releases/download/mace_mp_0/2024-01-07-mace-128-L2_epoch-199.model)| >=v0.3.6       | Initial release of foundation model.                          | MIT |
| MACE-MP-0b        | 89               | MPTrj             | DFT (PBE+U)           | Materials            | [models](https://github.com/ACEsuit/mace-mp/releases/tag/mace_mp_0b)              | >=v0.3.10      | Improve pair repulsion and correct isolated atoms. | MIT |
| MACE-MP-0b2        | 89               | MPTrj             | DFT (PBE+U)           | Materials            | [models](https://github.com/ACEsuit/mace-mp/releases/tag/mace_mp_0b2)              | >=v0.3.9      | Improve stability at high pressure. | MIT |
| MACE-MP-0b3        | 89               | MPTrj             | DFT (PBE+U)           | Materials            | [models](https://github.com/ACEsuit/mace-mp/releases/tag/mace_mp_0b3)              | >=v0.3.9      | Fixed some phonons issues compared to b2. | MIT |
| MACE-MPA-0        | 89               | MPTrj + sAlex    | DFT (PBE+U)           | Materials            | [medium](https://github.com/ACEsuit/mace-mp/releases/download/mace_mpa_0/mace-mpa-0-medium.model)              | >=v0.3.10      | Improved accuracy for materials, improved high pressure stability. | MIT |
| MACE-OMAT-0        | 89               | OMAT         | DFT (PBE+U) VASP 54        | Materials    | [medium](https://github.com/ACEsuit/mace-mp/releases/download/mace_omat_0/mace-omat-0-medium.model) [small](https://github.com/ACEsuit/mace-foundations/releases/download/mace_omat_0/mace-omat-0-small.model) | >=v0.3.10       |     Excellent phonons.        | ASL |
| MACE-MATPES-PBE-0        | 89               | MATPES-PBE         | DFT (PBE)        | Materials    | [medium](https://github.com/ACEsuit/mace-foundations/releases/download/mace_matpes_0/MACE-matpes-pbe-omat-ft.model) | >=v0.3.10       | No +U correction.            | ASL |
| MACE-MATPES-r2SCAN-0        | 89               | MATPES-r2SCAN         | DFT (r2SCAN)        | Materials    | [medium](https://github.com/ACEsuit/mace-foundations/releases/download/mace_matpes_0/MACE-matpes-r2scan-omat-ft.model) | >=v0.3.10       |  Better functional for materials.           | ASL |


The first generation of models are available in the [MACE-MP-0](https://github.com/ACEsuit/mace-mp/releases/tag/mace_mp_0).

We subsequently released a second generation of models in the [MACE-MP-0b](https://github.com/ACEsuit/mace-mp/releases/tag/mace_mp_0b), [MACE-MP-0b2](https://github.com/ACEsuit/mace-mp/releases/tag/mace_mp_0b2) and [MACE-MP-0b3](https://github.com/ACEsuit/mace-mp/releases/tag/mace_mp_0b3) releases.
This release includes models with improved stability during MD simulations, using core repulsion, a new repulsion regularization for high pressure, and a few extra high pressure training examples. Moreover,
we recommend using the second generation models for [fine-tuning](https://mace-docs.readthedocs.io/en/latest/guide/finetuning.html).

We have also released a model trained on an enlarged dataset containing 3.5M new crystals, obtained by combining the MPtraj and sAlex datasets. This model, released as [MACE-MPA-0](https://github.com/ACEsuit/mace-mp/releases/tag/mace_mpa_0), achieves state-of-the-art accuracy on the Matbench benchmarks and significantly improves accuracy compared to the MACE-MP-0 models on material systems.

We do not guarantee that the second generation models are better than the first generation models in all cases, but they are expected to be more stable during MD simulations.

If you use the models please cite

```bib
@article{batatia2023foundation,
      title={A foundation model for atomistic materials chemistry},
      author={Ilyes Batatia and Philipp Benner and Yuan Chiang and Alin M. Elena and Dávid P. Kovács and Janosh Riebesell and Xavier R. Advincula and Mark Asta and William J. Baldwin and Noam Bernstein and Arghya Bhowmik and Samuel M. Blau and Vlad Cărare and James P. Darby and Sandip De and Flaviano Della Pia and Volker L. Deringer and Rokas Elijošius and Zakariya El-Machachi and Edvin Fako and Andrea C. Ferrari and Annalena Genreith-Schriever and Janine George and Rhys E. A. Goodall and Clare P. Grey and Shuang Han and Will Handley and Hendrik H. Heenen and Kersti Hermansson and Christian Holm and Jad Jaafar and Stephan Hofmann and Konstantin S. Jakob and Hyunwook Jung and Venkat Kapil and Aaron D. Kaplan and Nima Karimitari and Namu Kroupa and Jolla Kullgren and Matthew C. Kuner and Domantas Kuryla and Guoda Liepuoniute and Johannes T. Margraf and Ioan-Bogdan Magdău and Angelos Michaelides and J. Harry Moore and Aakash A. Naik and Samuel P. Niblett and Sam Walton Norwood and Niamh O'Neill and Christoph Ortner and Kristin A. Persson and Karsten Reuter and Andrew S. Rosen and Lars L. Schaaf and Christoph Schran and Eric Sivonxay and Tamás K. Stenczel and Viktor Svahn and Christopher Sutton and Cas van der Oord and Eszter Varga-Umbrich and Tejs Vegge and Martin Vondrák and Yangshuai Wang and William C. Witt and Fabian Zills and Gábor Csányi},
      year={2023},
      eprint={2401.00096},
      archivePrefix={arXiv},
      primaryClass={physics.chem-ph}
}

MACE-Universal by Yuan Chiang, 2023, Hugging Face, Revision e5ebd9b, DOI: 10.57967/hf/1202, URL: https://huggingface.co/cyrusyc/mace-universal
```

## Training scripts

We provide training scripts for the models in this repository. The latest training command line is found in [`mace_mp_0/2024-01-07-mace-128-L2.sh`](mace_mp_0/2024-01-07-mace-128-L2.sh).

## Training data

The MPtrj dataset used to train the model is available at [training-data](https://github.com/ACEsuit/mace-mp/releases/download/mace_mp_0/training_data.zip). Please cite the following paper if you use the dataset.

```bib
@article{deng2023chgnet,
      title={CHGNet: Pretrained universal neural network potential for charge-informed atomistic modeling},
      author={Bowen Deng and Peichen Zhong and KyuJung Jun and Janosh Riebesell and Kevin Han and Christopher J. Bartel and Gerbrand Ceder},
      year={2023},
      eprint={2302.14231},
      archivePrefix={arXiv},
      primaryClass={cond-mat.mtrl-sci}
}
```

## Trajectories and movies

Trajectories for the results presented in the paper and simulation movies can be found at [example-xyz-movies](https://drive.google.com/drive/folders/1141d1rI1rtwf9iSFv5r_g4XL_AvmjiK5).
