#!/bin/csh
#
# $Id: ex02_V4.csh,v 1.1 2006/04/11 15:14:49 rhuey Exp $
#

# use the 'prepare_ligand4.py' python script to create pdbqt files
cd $VSTROOT/VirtualScreening/Ligands
foreach f (`ls *.pdb`)
    echo $f
    ../../prepare_ligand4.py -l $f -o "$f"qt -d ../etc/ligand_dict.py -F
    end
