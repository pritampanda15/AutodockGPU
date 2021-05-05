mkdir dockings
cd dockings

for f in ../Receptor/*.pdbqt
do 
for l in ../Ligands/*.pdbqt
do 
a=(`basename $f .pdbqt`)
b=(`basename $l .pdbqt`)
echo "$b"_"$a"
mkdir "$b"_"$a"
cd "$b"_"$a"
cp ../../Ligands/"$b".pdbqt .
ln -s ../../Receptor/"$a".pdbqt .
ln -s ../../Receptor/"$a"*.map .
ln -s ../../Receptor/"$a"*.maps.fld  
ln -s ../../Receptor/"$a"*.maps.xyz  
ln -s ../../Receptor/ref.dpf
ln -s ../../Receptor/AD4_parameters.dat
prepare_dpf42.py -l "$b".pdbqt -r "$a".pdbqt \
    -p ga_num_evals=20000000 \
    -p ga_pop_size=150 \
    -p ga_run=100 \
    -p rmstol=2.0 \
    
cd ..
done;
done;
cd ..
