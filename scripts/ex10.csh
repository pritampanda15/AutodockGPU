#!/bin/csh
#
# $Id: ex10.csh,v 1.8 2008/01/10 19:02:56 rhuey Exp $
#


# Extract the Free Energy and Docked Energy from the dlg files.
# From the docking log files, use ``grep`` to extract the lines
# containing the binding energy and docked energy of each complex.
# Use ``sed`` and ``awk`` to process these lines into the final output:

cd $VSTROOT/VirtualScreening/Dockings
foreach d (`/bin/ls`)
    echo $d
#    egrep "^USER    Estimated Free Energy of Binding|^USER    Final Docked Energy" $d/$d.dlg | sed "N;s/\n//" | awk  -v n=$d 'BEGIN {N=n} { print N"  "$8"  "$15}' > $d/$d.energies
    pythonsh $VSTROOT/summarize_results4.py -d $d -t 2.0 -L -a -o $VSTROOT/VirtualScreening/etc/summary_2.0.txt
    end

## Sort the ``summary_2.0.txt`` file to find your best docking::
cd ../etc
cat summary_2.0.txt | sort -k5n -t, > summary_2.0.sort

