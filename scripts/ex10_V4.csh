#!/bin/csh
#
# $Id: ex10_V4.csh,v 1.1 2006/04/11 15:14:49 rhuey Exp $
#


# Extract the Free Energy and Docked Energy from the dlg files.
# From the docking log files, use ``grep`` to extract the lines
# containing the binding energy and docked energy of each complex.
# Use ``sed`` and ``awk`` to process these lines into the final output:

cd $VSTROOT/VirtualScreening/Dockings
foreach d (`/bin/ls`)
    echo $d
    egrep "^USER    Estimated Free Energy of Binding" $d/$d.dlg | awk  -v n=$d 'BEGIN {N=n} { print N"  "$8" "}' > $d/$d.energies
    end

# Save the best energy from each docking in a single file in
# the ``etc`` directory called ``all_energies.list``:
     
touch ../etc/all_energies.list
foreach d ( `/bin/ls` )
    echo $d
    head -1 $d/$d.energies >> ../etc/all_energies.list
    end

# Sort the ``all_energies.list`` file to find your best docking::
cd ../etc
#sort -k3n all_energies.list > all_energies.sort
sort -k2n all_energies.list > all_energies.sort

