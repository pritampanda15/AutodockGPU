#!/bin/csh
#
# $Id: ex04.csh,v 1.3 2005/04/28 18:38:01 rhuey Exp $
#

# Create a directory called ``Receptor`` and populate it with the
# supplied ``x1hpv.pdb`` file. On your own, use AutoDockTools to
# create the pdbqs file.

cd $VSTROOT/VirtualScreening
mkdir Receptor
cp ../x1hpv.pdb Receptor
cd Receptor

echo "use adt to complete this exercise"
# cp $VSTROOT/Results/x1hpv.pdbqs $VSTROOT/VirtualScreening/Receptor
