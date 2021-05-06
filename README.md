# Autodock

Refer steps for more detailed information

Prepare pdbqt is to convert pdb files to pdbqt format

Prep.sh file is to prepare dpf file for the ligand and protein.

Steps:
Create a folder name as Receptors: place all the grid prepared files e.g., maps etc. 
Create a folder named as Ligands: Place all the ligand pdbqt file

Remeber to keep prepare_dpf42.py file in the home folder from which you can call the python file. 

Run prep.sh from outside the folder. It will prepare all the dpf files bu creating folders respective to the number of ligands

Then launch actual autodock script to run launch_ad.sh or if you have gpu then launcgAD4gpu.bash

