#
# CDDL HEADER START
#
# The contents of this file are subject to the terms of the
# Common Development and Distribution License (the "License").
# You may not use this file except in compliance with the License.
#
# You can obtain a copy of the license at usr/src/OPENSOLARIS.LICENSE
# or http://www.opensolaris.org/os/licensing.
# See the License for the specific language governing permissions
# and limitations under the License.
#
# When distributing Covered Code, include this CDDL HEADER in each
# file and include the License file at usr/src/OPENSOLARIS.LICENSE.
# If applicable, add the following below this CDDL HEADER, with the
# fields enclosed by brackets "[]" replaced with your own identifying
# information: Portions Copyright [yyyy] [name of copyright owner]
#
# CDDL HEADER END
#
#
# Copyright 2010 Sun Microsystems, Inc.  All rights reserved.
# Use is subject to license terms.
#
# Copyright 2014 Garrett D'Amore <garrett@damore.org>
#
# head/Makefile
#
# include global definitions
include ../Makefile.master

sparc_HDRS=
i386_HDRS=

HDRS=  

ROOTHDRS= $(HDRS:%=$(ROOT)/usr/include/%)

DIRS=
ROOTDIRS= $(DIRS:%=$(ROOT)/usr/include/%)

SED=	sed

# check files really don't exist
#
# should do something with the rpcsvc headers

#
CHECKHDRS= $(HDRS:%.h=%.check)

# install rules

$(ROOT)/usr/include/%: %
	$(INS.file)

.KEEP_STATE:

.PARALLEL:	$(ROOTHDRS) $(CHECKHDRS)

install_h: 	$(ROOTDIRS) .WAIT $(ROOTHDRS)

check:	$(CHECKHDRS)

clean clobber:

$(ROOTDIRS):
	$(INS.dir)

