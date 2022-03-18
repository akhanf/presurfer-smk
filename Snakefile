rule presurfer:
    input: 
        uni = 'sub-HCb9_acq-UNI_run-01_MP2RAGE.nii',
        inv2 = 'sub-HCb9_inv-2_run-01_MP2RAGE.nii',
        template_matlab = 'scripts/presurfer_spmdocker.m.template'
    params:
        container = '/srv/containers/spm-docker_docker-matlab.sif',
    output:
        presurfer = directory('sub-HCb9_presurfer'),
        presurfer_script = temp('sub-HCb9_presurfer/presurfer.m')
    shell:
        "mkdir -p {output.presurfer} && "
        "cat {input.template_matlab} | "
        " sed 's/PATH_TO_UNI_NII/{input.uni}/g' | "
        " sed 's/PATH_TO_INV2_NII/{input.inv2}/g' | "
        " sed 's/PATH_TO_OUT_FOLDER/{output.presurfer}/g' > "
        "  {output.presurfer_script} && "
        "singularity run -e {params.container} script {output.presurfer_script}"

