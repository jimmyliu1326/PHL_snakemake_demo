rule read_QC:
    input:
        R1=lambda wildcards: samples_tbl.R1[wildcards.samples],
        R2=lambda wildcards: samples_tbl.R2[wildcards.samples]
    output:
        R1_trimmed=temp("read_QC/{samples}/{samples}_R1_trimmed.fastq.gz"),
        R2_trimmed=temp("read_QC/{samples}/{samples}_R2_trimmed.fastq.gz"),
        json="read_QC/{samples}/fastp.json",
        html="read_QC/{samples}/fastp.html"
    threads: 4
    shell:
        """
        fastp -i {input.R1} -I {input.R2} -o {output.R1_trimmed} -O {output.R2_trimmed} \
            -w {threads} -j {output.json} -h {output.html}
        """