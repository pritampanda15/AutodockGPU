#!/bin/csh
#
# $Id: ex02.csh,v 1.5 2007/07/19 21:52:59 rhuey Exp $
#

# use the 'prepare_ligands.py' python script to create pdbq files
cd $VSTROOT/VirtualScreening/Ligands
foreach f (`ls *`)
    echo $f
    pythonsh ../../prepare_ligand4.py -l $f  -d ../etc/ligand_dict.py
    end
