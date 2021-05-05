#!/bin/csh
#
# $Id: ex00.csh,v 1.3 2005/01/31 03:55:40 lindy Exp $
#

# Because this script uses "pwd" to set VSTROOT is matters
# where (which directory you run it from. This script should
# be run as "source ./scripts/ex00.csh" So, after you
# did your "cvs co VSTutorial" a "VSTutorial" directory was
# created and that's the one that should be your working
# directory when you source this script.

#
# set up the root directory of the Virtual Screening Tutorial
#
setenv VSTROOT `pwd`

