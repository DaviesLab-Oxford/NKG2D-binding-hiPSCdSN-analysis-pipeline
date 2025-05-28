# NKG2D-binding-HiPSCdSN-analysis-pipeline

This pipeline is for analysing binding density of NKG2D in human iPSC-derived sensory neurons.

Please follow the steps bellow:

Step 1: Automatically measure the area of BtubIII+ axons and count particles within the BtubIII+ axons by running the script 'NKG2D macro_area_particle counting_axons only_HiPSCdSN.ijm'. 

Step 2: Save 'Summary' containing particle counts and 'Results' containing area of BtubIII+ axons.

Step 3: Calculate NKG2D+ particle density: 

        Particle density = Particle count / area of BtubIII+ axons.
