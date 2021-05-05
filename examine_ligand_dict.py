#!/usr/bin/env python
#
# Last modified on Mon Feb 26 14:36:57 PST 2007 by lindy
#
# $Id: examine_ligand_dict.py,v 1.3 2008/01/10 18:48:16 rhuey Exp $
#

from ligand_dict import d
import time

print
print "VirtualScreening ZINC subset summary as of %s" % (time.asctime())
#
# Here is the list of all atom types in the diversity set
#
union = {}
for dict in d.values():
    for atom_type in dict['atom_types']:
        union[atom_type] = 1
union.keys().sort()
print
print "There are %d atom_types: %s" % (len(union.keys()), repr(union.keys()))

#
# Here's how one might break down that union
#
print
print "Here are some categories:"
breakdown = {
    'common'  : ['A', 'C', 'HD', 'N','NA', 'O','OA', 'S','SA' ], # A C HD N NA OA SA
    'salt'    : ['Na', 'Mg', 'Mn', 'MG','MN'],
    'metal'   : ['Ni', 'Pt', 'Pd', 'Rh', 'Zn', 'Sn', 'W', 'Sb', 'Se',
                 'Co', 'Ag','Fl', 'f', 'Si', 'As', 'Au', 'Cr', 'Cu',
                 'NI','PT','PD','RH','ZN','SN','SB','SE',
                 'CO','AG','FL','SI','AS','AU','CR','CU'],
    'halogen' : [ 'F', 'I', 'Cl','c','Br', 'b','CL','BR'],
    'other'   : [ 'B', 'P' ],
    }
sum = 0
for category, atom_types in breakdown.items():
    print "    %s  : %s" % (category, atom_types)
    sum += len(atom_types)
print "%d total." % (sum)

#
# Here's the list of ligands having the 7 'common' atom_types  A C HD N NA OA SA
#
common_ligands = []
uncommon_ligands = []
uncommon = False
for filename, dict in d.items():
    for atom_type in dict['atom_types']:
        if atom_type not in breakdown['common']:
            uncommon_ligands.append(filename)
            uncommon = True
            break
    if not uncommon:
        common_ligands.append(filename)
    uncommon = False # reset
print
print "There are %d ligands with only 'common' atom_types (A C HD N NA OA SA only)." % \
      (len(common_ligands))
print "There are %d ligands with 'uncommon' atom_types." % \
      (len(uncommon_ligands))
print "%d total." % (len(common_ligands) + len(uncommon_ligands))


#
# Here the list of the ligands having exotic atom-types
#
mundane_elms = breakdown['common'] + breakdown['halogen']
exotic_elms = breakdown['salt'] + breakdown['metal'] + breakdown['other']
exotic_ligands = []
mundane_ligands = []
exotic = False
exotic_more_than_seven = 0
mundane_more_than_seven = 0
#exotic_more_than_six = 0
#mundane_more_than_six = 0
for filename, dict in d.items():
    exotic = False
    for atom_type in dict['atom_types']:
        if atom_type in exotic_elms:
            exotic_ligands.append(filename)
            exotic = True
            if len(dict['atom_types']) > 7:
                exotic_more_than_seven += 1
            break
    if not exotic:
        mundane_ligands.append(filename)
        if len(dict['atom_types']) > 7:
            mundane_more_than_seven += 1
    exotic = False # reset
print
print "There are %d ligands with 'mundane' atom_types (common + halogen)." % \
      (len(mundane_ligands))
print "    (%d of these have more than seven atom_types)." % \
      (mundane_more_than_seven)
print "There are %d ligands with 'exotic' atom_types." % \
      (len(exotic_ligands))
print "    (%d of these have more than seven atom_types)." % \
      (exotic_more_than_seven)
print "%d total. (%d have more than seven atom_types)." % \
      ((len(mundane_ligands) + len(exotic_ligands)),
       (mundane_more_than_seven + exotic_more_than_seven))


#
# How about rotatable bonds? well that information isn't in the
# dictionary but it could be...
#
# key - number of rotable bonds, value - number of ligands with that number
bond_dict = {}
for n in [ ld['rbonds'] for ld in d.values()]:
    if bond_dict.has_key(n):
        bond_dict[n] += 1
    else:
        bond_dict[n] = 1
num_bond_list = bond_dict.keys()[:]
num_bond_list.sort()
print
print "Here's the rotatable bond distribution."
sum = 0
for key in num_bond_list:
    print "    %3d ligands have %2d rotatable bonds." % (bond_dict[key], key)
    sum +=  bond_dict[key]
print "%d total." % (sum)


#
# Atoms with zero-charge are suspect
#
zero_charge_ligands = []
for filename, dict in d.items():
    if dict['zero_charge'] != []:
        zero_charge_ligands.append(filename)
print
print "There are %d ligands with atoms having zero charge ('C', 'A' excluded)." % \
      (len(zero_charge_ligands))
print "These ligands are suspect and can probably be fixed."
zero_charge_ligands.sort()
for f in zero_charge_ligands:
    print "    %s : %s" % (f, d[f]['zero_charge'])



#
# ligands with only one atomtype are suspect
#
        
one_atom_type_ligands = []
for filename, dict in d.items():
    if len(dict['atom_types']) == 1:
        one_atom_type_ligands.append(filename)
print
print "There are %d ligands with only one atom_type." % \
      (len(one_atom_type_ligands))
print "These ligands are suspect and can probably be fixed."
one_atom_type_ligands.sort()
for f in one_atom_type_ligands:
    print "    %s : %s" % (f, d[f]['atom_types'])


#
# Here's the list of the ligands with more that six atom_types
#
more_than_six_ligands = []
for filename, dict in d.items():
    if len(dict['atom_types']) > 6:
        more_than_six_ligands.append(filename)
print
print "There are %d ligands with more than six atom_types." % \
      (len(more_than_six_ligands))
more_than_six_ligands.sort()
for f in more_than_six_ligands:
    print "    %s : %s" % (f, d[f]['atom_types'])

