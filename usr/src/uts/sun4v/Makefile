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
# Copyright 2009 Sun Microsystems, Inc.  All rights reserved.
# Use is subject to license terms.
#
#	This makefile drives the production of all implementation architecture
#	dependent modules for the sun4v architecture.
#

UTSBASE = ..

include Makefile.sun4v

#
#	The following are SPARC specific (rather than sun4v) specific modules
#	which are required for the sun4v kernel to completely lint. They are
#	not involved in the build in any other way. In order to minimize
#	build time, it is assumed that they are up to date. But since sun4v
#	is really a separate architecture we cannot use the v7 sparc modules.
#
SPARC_LIB_DIR	 = $(UTSBASE)/sparc/lint-libs/$(OBJS_DIR)

SPARC_LINTS	 =

#
#
#
LINT_LIBS	 = $(LINT_LIB) \
		   $(LINT_KMODS:%=$(LINT_LIB_DIR)/llib-l%.ln)

def		:=	TARGET= def
all		:=	TARGET= all
install		:=	TARGET= install
install_h	:=	TARGET= install_h
clean		:=	TARGET= clean
clobber		:=	TARGET= clobber
lint		:=	TARGET= lint
lintlib		:=	TARGET= lintlib
modlintlib	:=	TARGET= modlintlib
clean.lint	:=	TARGET= clean.lint
check		:=	TARGET= check

.KEEP_STATE:

.PARALLEL:	$(PARALLEL_KMODS)

def all clean clobber clean.lint: $(KMODS)

install: install_platforms unix .WAIT $(KMODS)

lintlib:	unix

modlintlib:	$(LINT_KMODS) $(CLOSED_LINT_KMODS)

$(KMODS):	FRC
	@cd $@; pwd; $(MAKE) $(NO_STATE) $(TARGET)

install_h check:

#
# Make the /platforms directories.  This is hardwired here because
# the first stage of the project (KBI) only implements the userland
# changes, but the only reasonable place to record the aliases is
# here in kernel land.
#

install_platforms:	$(ROOT_PSM_DIR) $(USR_PSM_DIR) \
			$(ROOT_PLAT_DIRS) $(USR_PLAT_DIRS) \
			$(LINKED_PLATFORMS:%=$(ROOT_PLAT_DIR)/%)

#
#	Full kernel lint target.
#
LINT_TARGET	= globallint

globallint:
	@-$(ECHO) "\nSUN4V KERNEL: global crosschecks:"
	@-$(LINT) $(LINTFLAGS) $(LINT_LIBS) 2>&1 | $(LGREP.2)

lint:	lintlib .WAIT modlintlib .WAIT $(SPARC_LINTS) $(LINT_DEPS) \
	$(IMPLEMENTATIONS) $(LINT_CPU_KMODS)

include ../Makefile.targ

