# Makefile for generating PDFs from Coq files

# Directories
SRC_DIR = src/theorems
PAPERS_DIR = papers

# Files
V_FILES = $(wildcard $(SRC_DIR)/*.v)
TEX_FILES = $(patsubst $(SRC_DIR)/%.v,$(PAPERS_DIR)/%.tex,$(V_FILES))
PDF_FILES = $(patsubst $(PAPERS_DIR)/%.tex,$(PAPERS_DIR)/%.pdf,$(TEX_FILES))

# Commands
COQ_MAKEFILE = coq_makefile
COQ_MAKEFILE_OPTS = -f _CoqProject -o Makefile.coq
COQ_MAKE = make -f Makefile.coq
COQ_COMPILE = coqc -verbose
LATEXMK = latexmk
LATEXMK_FLAGS = -pdf -interaction=nonstopmode -outdir=$(PAPERS_DIR)
RM = rm -f

# Targets
.PHONY: all clean

all: $(PDF_FILES)

$(TEX_FILES): $(V_FILES) | $(PAPERS_DIR)
	$(COQ_MAKEFILE) $(COQ_MAKEFILE_OPTS)
	$(COQ_MAKE)
	$(foreach var, $(V_FILES), $(COQ_COMPILE) $(var);)
	coqdoc --latex -o $(PAPERS_DIR)/$(@F) $^

$(PDF_FILES): $(TEX_FILES)
	$(LATEXMK) $(LATEXMK_FLAGS) $<

$(PAPERS_DIR):
	mkdir -p $(PAPERS_DIR)

clean:
	$(COQ_MAKE) clean
	$(RM) $(PDF_FILES) $(TEX_FILES) Makefile.coq
	$(RM) $(SRC_DIR)/**.aux
	$(RM) $(SRC_DIR)/*.glob
	$(RM) $(SRC_DIR)/*.vo
	$(RM) $(SRC_DIR)/*.vok
	$(RM) $(SRC_DIR)/*.vos
	$(RM) $(PAPERS_DIR)/*.sty
	$(RM) $(PAPERS_DIR)/*.aux
	$(RM) $(PAPERS_DIR)/*.fdb_latexmk
	$(RM) $(PAPERS_DIR)/*.fls
	$(RM) $(PAPERS_DIR)/*.log
	$(RM) $(PAPERS_DIR)/*.out
