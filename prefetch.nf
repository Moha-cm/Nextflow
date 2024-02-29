

# Model 1

params.temp_dir="/home/hdoop/Desktop/Mohan_mini/nextflow/temp"

params.prefetch_out_dir="/home/hdoop/Desktop/Mohan_mini/nextflow/output/prefetch"

params.reads_dir="/home/hdoop/Desktop/Mohan_mini/nextflow/output/fastq_reads"


process prefetch_data{

    publishDir("${params.prefetch_out_dir}",mode:"move")
    cache false

    input:
    val sra_number

    """
    prefetch -p  -O ${params.prefetch_out_dir} ${sra_number}.sra
    
    """
}





workflow{
    Channel.of('SRR27018959')|prefetch_data
}






# Model 2






params.prefetch_out_dir="/home/user/Desktop/Monkey_D_Luffyoutput/prefetch"



process prefetch_data{

    publishDir("${params.prefetch_out_dir}",mode:"move")
    cache false

    input:
    val sra_number

    output:
    file "${sra_number}.sra"


    """
    prefetch -p  -O ${params.prefetch_out_dir}  ${sra_number}.sra
    
    """
}





workflow{
    Channel.of('SRR27018959')|prefetch_data
}

