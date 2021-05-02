cd dockings        # ligand atom types
for f in $(ls -d *);
do
cd $f
autodock4 -p $f.dpf -l $f.dlg &
cd ..
done;  



