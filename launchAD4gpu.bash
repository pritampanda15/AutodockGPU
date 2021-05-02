#!/bin/bash
for r in $(cat list)
do
for l in $(cat list2)
do
	cd "$l"_"$r"
	/opt/AutoDock-GPU-develop/bin/autodock_gpu_128wi -ffile *.maps.fld -lfile $l.pdbqt -nrun 100 -heuristics 1
	mv docking.dlg "$l"_"$r".dlg
        cd ..
done
done
