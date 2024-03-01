/*

rna seq analysis 

*/


params.prefetch_dir="/home/hdoop/Desktop/Mohan_mini/nextflow/output/prefetch"


log.info """\
                R N A S E Q  - A N A L Y S I S
================================================================================
  PREFETCH DIRECTORY: ${params.prefetch_dir}    
"""
.stripIndent()



process PREFETCH {

    tag "PREFETCH SAMPLE $sra_number"
    publishDir params.prefetch_dir, mode: 'move'
    

    input:
    val sra_number

    output:
    file "${sra_number}.sra"

    """
    prefetch -p -v ${sra_number} -O ${sra_number}.sra

    """
}


workflow{
    channel.of("SRR22325214")|PREFETCH
}


