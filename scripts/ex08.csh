#!/bin/csh
#
# $Id: ex08.csh,v 1.6 2007/07/19 21:53:32 rhuey Exp $
#


# Create the ``Dockings`` directory::

cd $VSTROOT/VirtualScreening
mkdir Dockings
cd Dockings

# Create a subdirectory named ``<ligand>_x1hpv`` and populate it
# with the docking input files: a) the ``pdbqt`` from the ``Ligands``
# directory will be copied directly; b) the maps will be lined to
# the ``Receptor`` directory; and, c) the ``dpf`` file will be created
# using ``prepare_dpf4.py``

foreach f (`ls ../Ligands/*.pdbqt`)
    set name = `basename $f .pdbqt`
    echo $name
    mkdir "$name"_x1hpv
    cd "$name"_x1hpv
    cp ../"$f" .
    ln -s ../../Receptor/x1hpv.pdbqt .
    ln -s ../../Receptor/x1hpv*map* .
    pythonsh ../../../prepare_dpf4.py -l `basename $f` -r x1hpv.pdbqt \
    -p ga_num_evals=1750000 \
    -p ga_pop_size=150 \
    -p ga_run=20 \
    -p rmstol=2.0
    cd ..
    end
