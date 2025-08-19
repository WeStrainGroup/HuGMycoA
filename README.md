# README - HuGMycoA

# HuGMycoA

An R package for accessing and analyzing the Human Gut Mycobiome Atlas

---

## Introduction

The HuGMycoA R package provides direct access to the Human Gut Mycobiome Atlas, allowing researchers to seamlessly integrate these data into their customized workflows.

HuGMycoA offers a collection of well-structured [phyloseq](https://joey711.github.io/phyloseq/index.html) objects, comprising an `otu_table`, `tax_table`, `sample_data`, and `refseq`.

To ensure broad usability, we provide read count data at both the species hypothesis (SH) and genus levels, with options for datasets with or without sequencing-depth filtering. Importantly, no prevalence or abundance filtering was applied, thereby maximizing users’ analytical flexibility. 

- For unfiltered datasets, all samples with more than one microfungal read after FunGAP processing were retained.
- For depth-filtered datasets, only samples with ≥10,000 microfungal reads after FunGAP processing were included, in accordance with our publication.

In addition, the `sample_data` slot contains curated metadata and basic alpha-diversity metrics, enabling straightforward filtering and extraction of sample-level information.

---

## Installation

Currently, HuGMycoA can be installed directly from GitHub. Support for CRAN and Conda distribution will be added in the future.

```r
devtools::install_github("WeStrainGroup/HuGMycoA")
```

HuGMycoA requires the [phyloseq](https://joey711.github.io/phyloseq/) package. Please ensure that `phyloseq` is installed before use. For users working in a conda environment, you can install it via:

```bash
conda install bioconda::bioconductor-phyloseq
```

---

## Usage

```r
library(hugmycoa) # note the case! 

# SHs level, depth-unfiltered
ps <- load_hugmycoa(level = "SH", filterdepth = FALSE)

# SHs level, depth-filtered (# clean microfungal reads >= 10,000)
ps <- load_hugmycoa(level = "SH", filterdepth = TRUE)

# Genus level, depth-unfiltered
ps <- load_hugmycoa(level = "Genus", filterdepth = FALSE)

# Genus level, depth-filtered (# clean microfungal reads >= 10,000)
ps <- load_hugmycoa(level = "Genus", filterdepth = TRUE)
```

---

## Recommendations

- For meta-analysis across multiple projects, we recommend using the `PRJ` field in `sample_data` (corresponding to the sub-projects described in our publication) as a batch variable for correction.
- For routine analyses, we suggest using the genus-level, depth-filtered version. This option requires the least computational memory while maintaining robust results due to sufficient microfungal read counts.
- For more detailed investigations (e.g., SHs or sequence-level), please note:
    - SHs were generated within each sub-project, and were not merged or de-duplicated across projects.
    - ITS1 SHs/sequences cannot be directly compared with ITS2 SHs/sequences.

---

## Citation

If HuGMycoA proves useful in your work, please support us by citing our publication:

…

Citation helps us continue building resources that advance the understanding of the human gut mycobiome! 

---

## Contact

For questions, suggestions, or bug reports, please contact us:

- Xinyu Wang: [wangxinyu30@westlake.edu.cn](mailto:wangxinyu30@westlake.edu.cn)
- Kailang Huang: [huangkailang@westlake.edu.cn](mailto:huangkailang@westlake.edu.cn)

We greatly appreciate your feedback and contributions!

---