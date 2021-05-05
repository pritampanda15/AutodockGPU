#!/bin/csh
#
# $Id: ex09.csh,v 1.7 2008/01/10 19:01:24 rhuey Exp $
#

# Create a file with a list of the dockings to run::

cd $VSTROOT/VirtualScreening/Dockings
/bin/ls > ../etc/docking.list

# For the purposes of this tutorial, instead of running ``autodock3`` as
# you normally would) simply copy the results of a docking that we've
# done for you previously.

foreach d (`cat ../etc/docking.list`)
    echo $d
    cd $d
    echo "autodock4 -p $d.dpf -l $d.dlg"
    # submit.py $d 1
    cp ../../../Results4/dlgs/"$d".dlg .
    cd ..
    end
