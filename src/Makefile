CC = g++

LIBS=-lmozjs-91 -ldl
MOZJS_INCLUDES = /usr/include/mozjs-91/
# Any special flags you want to pass to the compiler
MYFLAGS = $(LIBS) -O -std=c++2a -DXP_UNIX -I/usr/local/include -DICONV_ACCEPTS_NONCONST_INPUT=1 -Wformat-security -Wformat -Wpointer-arith -Wcast-align -Wredundant-decls \
 		-L/usr/local/lib -DJS_C_STRINGS_ARE_UTF8 -I/usr/local/lib/pkgconfig/../../include -I$(MOZJS_INCLUDES) -I/usr/local/include

#flags for profiling (see hacker.doc for more information)
PROFILE =

##############################################################################
# Do Not Modify Anything Below This Line (unless you know what you're doing) #
##############################################################################

CPPFLAGS = -ggdb3 $(MYFLAGS) $(PROFILE)

OBJDIR = obj
BINDIR = ./bin

OBJFILES = boilerplate.o hello.o
OBJFILES := $(patsubst %.o,$(OBJDIR)/%.o,$(OBJFILES))

$(OBJDIR)/%.d: %.cpp
	$(SHELL) -ec '$(CC) -MM $(CPPFLAGS) $< | \
	sed '\''s,\($*\)\.o[ :]*,$(OBJDIR)\/\1.o $@ : ,g'\'' > $@'

default: all

-include $(OBJFILES:.o)

$(OBJDIR)/%.o: %.cpp
	@mkdir -p $(@D)
	$(CC) $(CPPFLAGS) -c	$<	-o $@

all:
	$(MAKE) demo

demo:
	@mkdir -p $(BINDIR)
	$(MAKE) $(BINDIR)/demo

$(BINDIR)/demo : $(OBJFILES)
	$(CC) -o $(BINDIR)/demo $(PROFILE) $(OBJFILES) $(LIBS)

clean:
	rm -f $(OBJFILES) *~

full:
	clean
	all