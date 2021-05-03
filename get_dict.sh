for f in *.pdbqt
do
awk '{print $12}' $f >> atom_types
done;
sort atom_types | uniq > atom_types_uniq
