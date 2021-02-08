rule spades:
    input:
        R1=spades_input_R1,
        R2=spades_input_R2
    output:
        "spades/{samples}"
    threads: 4
    shell:
        "spades.py -1 {input.R1} -2 {input.R2} -o {output} -t {threads}"