%: CoqMakefile phony
	+make -f Makefile.coq $@

all: CoqMakefile
	+make -f Makefile.coq all

clean: CoqMakefile
	+make -f Makefile.coq clean
	rm -f Makefile.coq

Makefile.coq: _CoqProject Makefile
	coq_makefile -f _CoqProject | sed 's/$$(COQCHK) $$(COQCHKFLAGS) $$(COQLIBS)/$$(COQCHK) $$(COQCHKFLAGS) $$(subst -Q,-R,$$(COQLIBS))/' > Makefile.coq

_CoqProject: ;

Makefile: ;

phony: ;

.PHONY: all clean phony
