# NKG2D-binding-HiPSCdSN-analysis-pipeline

This pipeline is for analysing binding density of NKG2D in human iPSC-derived sensory neurons.

Please follow the steps bellow:

Step 1: Generate MIP (maximum intensity projection) images of BtubIII+ neurons and segment images by running script 'NKG2D macro A_threshold_transform.ijm' in Fiji.

Step 2: Upload the generated BtubIII+ and segmented images to the folder on Matlab and run the script 'Matlab_Script_Gaussian.m'. Soma (Debris) mask array written in .txt files can be downloaded.

Step 3: Transform mask array into mask images by running script 'NKG2D macro B_Soma_mask.ijm' in Fiji.

Step 4: Automatically measure the area of BtubIII+ axons and count particles within the BtubIII+ axons by running the script 'NKG2D Macro C_area_particle counting_axons only_HiPSCdSN.ijm' in Fiji. 

Step 5: Save 'Summary' containing particle counts and 'Results' containing area of BtubIII+ axons.

Step 6: Calculate NKG2D+ particle density: 

        Particle density = particle count / area of BtubIII+ axons.
