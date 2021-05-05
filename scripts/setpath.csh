#!/bin/csh

#
# $Id: setpath.csh,v 1.2 2005/01/19 18:29:52 rhuey Exp $
#
# This script is specific to The Scripps Research Institute.
#
# for real VS projects we suggest you incorporate
# the applicable parts of the stuff below into your .cshrc
# contact Research Computing for help if you're unsure: 4-9369




# babel is in     /tsri/$osv/bin
# python is in    /tsri/python/$archosv/bin
# adt is in       /tsri/python/share/bin
# autodock3 is in /mgl/apps/bin/$archosv
# autodgrid is in /mgl/apps/bin/$archosv
# 

# $osv is setup by the .cshrc that in your TSRI account
# we're forcing it here anyway, just in case
set osv = `uname -a | awk '{print $1 substr ($3,1,1)}'`
set archosv = `arch`$osv
echo $archosv

unlimit stacksize # for autodock3

set path = ( /tsri/python/$archosv/bin \
	     /tsri/python/share/bin \
	     /mgl/apps/bin/$archosv \
	     /tsri/$osv/bin $path )

which babel
which python
which adt
which autodock3
which autogrid3
echo ""
echo "Let us know immediately if you got any error messages at all."
echo "If everything went smoothly you now have access all software for the tutorial."

