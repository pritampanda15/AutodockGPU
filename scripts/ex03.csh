#!/bin/csh
#
# $Id: ex03.csh,v 1.4 2005/01/31 03:55:40 lindy Exp $
#

# The ``examine_ligand_dict.py`` scripts reads the ``ligand_dict.py``
# written in Exercise 2 and writes a summary describing the set of
# ligands to stdout.

cd $VSTROOT/VirtualScreening/etc
cp ../../examine_ligand_dict.py .
./examine_ligand_dict.py > summary.txt

