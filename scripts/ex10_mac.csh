#!/bin/csh
#
# $Id: ex10_mac.csh,v 1.1 2007/07/31 16:47:18 rhuey Exp $
#


# Extract the Free Energy and Docked Energy from the dlg files.
# From the docking log files, use ``grep`` to extract the lines
# containing the binding energy and docked energy of each complex.
# Use ``sed`` and ``awk`` to process these lines into the final output:

cd $VSTROOT/VirtualScreening/Dockings
foreach d (`/bin/ls`)
    echo $d
#    egrep "^USER    Estimated Free Energy of Binding|^USER    Final Docked Energy" $d/$d.dlg | sed "N;s/\n//" | awk  -v n=$d 'BEGIN {N=n} { print N"  "$8"  "$15}' > $d/$d.energies
    pythonsh $VSTROOT/summarize_results4.py -d $d -t 2.0 -B -a -o $VSTROOT/VirtualScreening/etc/summary_2.0.txt
    end

## Sort the ``summary_2.0.txt`` file to find your best docking::
cd ../etc
#cat summary_2.0.txt | sort -k11g -t, > summary_2.0.sort
#apple specific
cat summary_2.0.txt | sort -k11 -t, -r > summary_2.0.sort

