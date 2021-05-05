#!/bin/csh
#
# $Id: ex07.csh,v 1.6 2007/07/19 22:44:52 rhuey Exp $
#

# Create a directory called 'ind_x1hpv' in the 'etc' directory:

cd $VSTROOT/VirtualScreening/etc
mkdir ind_x1hpv
cd ind_x1hpv

# Populate this directory with the docking input files::

cp ../../Ligands/ind.pdbqt .
ln -s ../../Receptor/x1hpv.pdbqt .
ln -s ../../Receptor/x1hpv*map* .

# Create the Docking Parameter File with modified parameters
# modified to shorten the autodock3 run time by restricting the
# search:

pythonsh ../../../prepare_dpf4.py -l ind.pdbqt -r x1hpv.pdbqt -p ga_num_evals=25000 -p ga_run=2

# Run ``autodock4`` and examine the output::
unlimit stacksize
autodock4 -p ind_x1hpv.dpf -l ind_x1hpv.dlg
