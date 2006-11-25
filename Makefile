#########################################################################
# vim: ts=8 sw=8
#########################################################################
# Author:   reynolds (Tommy Reynolds)
# Filename: Makefile
# Date:     2006-11-25 11:29:00
#########################################################################
# Note that we use '::' rules to allow multiple rule sets for the same
# target.  Read that as "modularity exemplarized".
#########################################################################

PREFIX	:=/opt/all-misc
BINDIR	=${PREFIX}/bin

TEMPLATES:=$(wildcard t_*)

TARGETS	=all clean distclean clobber check install uninstall tags
TARGET	=all

SUBDIRS	=

.PHONY:	${TARGETS} ${SUBDIRS}

CC	=ccache gcc -march=i686 -std=gnu99
CFLAGS	=-Os -Wall -Wextra -Werror -pedantic -g
LDFLAGS	=-g
LDLIBS	=

all::	all-misc

${TARGETS}::

clean::
	${RM} a.out *.o core.* lint tags

distclean clobber:: clean

check::	all-misc
	DEBUG=echo ./all-misc ${ARGS}

install:: all-misc
	install -d ${BINDIR}
	install -c -s all-misc ${BINDIR}/

uninstall::
	${RM} ${BINDIR}/all-misc

tags::
	ctags -R .

# ${TARGETS}::
# 	${MAKE} TARGET=$@ ${SUBDIRS}

# ${SUBDIRS}::
# 	${MAKE} -C $@ ${TARGET}
