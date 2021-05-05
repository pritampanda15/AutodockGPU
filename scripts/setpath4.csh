#!/bin/csh

#
# $Id: setpath4.csh,v 1.3 2008/01/11 22:34:30 rhuey Exp $
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

echo "________________________________________________________________________________"
echo "The architecture and operating system you are using is:"
echo $archosv

unlimit stacksize # for autodock3

#
# Set up the search path for executables:
#
set path = ( /tsri/python/$archosv/bin \
	     /tsri/python/share/bin \
	     /mgl/prog/$archosv/bin \
	     /tsri/$osv/bin \
	     $path \
	   )

#
# Set up the correct version of ADT:
#
alias adt /mgl/prog/share/bin/adt
alias pythonsh /mgl/prog/share/bin/pythonsh
#
# Set up the Linux versions to use the latest version of AutoDock 4 and
# AutoGrid 4
#
switch($archosv)
	case "i86Linux2":
		alias autodock4 `\ls -ltr /mgl/prog/i86Linux2/bin/autodock4* | tail -1 | awk '{print $9}'`
		alias autogrid4 `\ls -ltr /mgl/prog/i86Linux2/bin/autogrid4* | tail -1 | awk '{print $9}'`
		breaksw
	case "i686Linux2":
		alias autodock4 `\ls -ltr /mgl/prog/i86Linux2/bin/autodock4* | tail -1 | awk '{print $9}'`
		alias autogrid4 `\ls -ltr /mgl/prog/i86Linux2/bin/autogrid4* | tail -1 | awk '{print $9}'`
		breaksw
        case "i386Darwin8":
                echo "sdfsd"
                alias autodock4 `\ls -ltr /mgl/prog/i86Darwin8/bin/autodock4* | tail -1 | awk '{print $9}'`
                alias autogrid4 `\ls -ltr /mgl/prog/i86Darwin8/bin/autogrid4* | tail -1 | awk '{print $9}'`
                breaksw
endsw


#
# Tell the user what versions they will be using:
#

echo " "
echo "The version of Babel you are using is:"
which babel
echo " "
echo "The version of Python you are using is:"
which python
echo " "
echo "The version of ADT you are using is:"
which adt
echo " "
echo "The version of AutoDock4 you are using is:"
which autodock4
echo " "
echo "The version of AutoGrid4 you are using is:"
which autogrid4
echo "________________________________________________________________________________"
echo ""
echo "Let us know immediately if you got any error messages at all."
echo "If everything went smoothly, you now have access all the software for the tutorial."

echo "________________________________________________________________________________"

