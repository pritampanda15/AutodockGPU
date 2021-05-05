#!/bin/csh
#
# $Id: ex01.csh,v 1.8 2007/08/06 16:30:23 rhuey Exp $
#


# Create the directory in which all your Virtual Screening Tutorial
# activities will take  place:
cd $VSTROOT
mkdir VirtualScreening

# Create the Ligands and etc subdirectories
cd VirtualScreening
mkdir Ligands
mkdir etc

# make the Ligands directory the current working directory
cd Ligands

# use the UNIX utility csplit to divide the multi-molecule mol2
# file into separate files
cat $VSTROOT/zinc.mol2 | csplit -ftmp -n4 -ks - '%^@.TRIPOS.MOLECULE%' '/^@.TRIPOS.MOLECULE/' '{*}'

# Rename the tmp file according to ZINC identifier
# Here the outline of how we do this:
#    1. extract ZINCn8 from the tmpNNNN file and set to variable
#    2. if the Zn8.mol2 file does not exist, the rename the tmpNNNN file

foreach f (tmp*)
echo $f
set zid = `grep ZINC $f`
if !(-e "$zid".mol2) then
set filename = "$zid".mol2
else foreach n (`seq -w 1 99`)
if !(-e "$zid"_"$n".mol2) then
set filename = "$zid"_"$n".mol2
break
endif
end
endif
mv -v $f $filename
end

# Copy positive control 'ind.pdb' into 'Ligands'
cp $VSTROOT/ind.pdb .

# Create the list of Ligands and
\ls *.mol2 *.pdb > $VSTROOT/VirtualScreening/etc/ligand.list


