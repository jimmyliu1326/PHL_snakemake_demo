import pandas as pd
import os

samples_file=config["samples"]
samples_tbl=pd.read_csv(samples_file, header = None)
samples_tbl.columns=["Sample", "R1", "R2"]
samples_tbl=samples_tbl.set_index("Sample", drop=False)

def spades_input_R1(wildcards):
    sample=wildcards.samples
    if config["QC"] == 0:
        return samples_tbl.R1[sample]
    else:
        return os.path.join("read_QC", sample, sample+"_R1_trimmed.fastq.gz")

def spades_input_R2(wildcards):
    sample=wildcards.samples
    if config["QC"] == 0:
        return samples_tbl.R2[sample]
    else:
        return os.path.join("read_QC", sample, sample+"_R2_trimmed.fastq.gz")