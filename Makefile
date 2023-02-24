SRC := src
COQPROJECT := _CoqProject
COQMAKEFILE := Makefile.coq
COQDEP := coqdep
COQDOC := coqdoc
COQC := coqc
COQFLAGS := -R . PhiReducer
COQDOCFLAGS := --latex -d $(SRC)/theorems/
PAPERSDIR := papers

LATEXMK := latexmk
LATEXFLAGS :=

.PHONY: all clean

all: $(COQMAKEFILE)
	$(MAKE) -f $(COQMAKEFILE)
	$(MAKE) latex

$(COQMAKEFILE): $(COQPROJECT)
	coq_makefile $(COQFLAGS) -f $(COQPROJECT) -o $(COQMAKEFILE)

%.vo: %.v
	$(COQC) $(COQFLAGS) $<

%.tex: %.v
	mkdir -p $(PAPERSDIR)
	$(COQC) $(COQFLAGS) $<
	$(COQDOC) $(COQDOCFLAGS) $*.v $<
	$(LATEXMK) $(LATEXFLAGS) -pdf $*.tex $<
	mv $*pdf ../../$(PAPERSDIR)/

latex: $(patsubst %.v,%.tex,$(wildcard $(SRC)/theorems/*.v))

clean:
	$(MAKE) -f $(COQMAKEFILE) clean
	rm -f $(COQMAKEFILE)
	find . -name "*.vos" -type f -delete
	find . -name "*.vok" -type f -delete
	find . -name "*.out" -type f -delete
	find . -name "*.log" -type f -delete
	find . -name "*.aux" -type f -delete
	find . -name "*.fls" -type f -delete
	find . -name "*.sty" -type f -delete
	find . -name "*.glob" -type f -delete
	find . -name "*.vo" -type f -delete
	find . -name "*.tex" -type f -delete
	find . -name "*.fdb_latexmk" -type f -delete
	rm -f *.html *.css

depend: $(COQPROJECT)
	$(COQDEP) $(COQFLAGS) -f $(COQPROJECT) -I . $(SRC)/theorems/*.v > .depend

-include .depend
