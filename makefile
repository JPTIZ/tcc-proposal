OUTPUT := tcc-proposal
LATEX  := xelatex

OBJS   := $(wildcard *.tex)
BIBS   := $(wildcard *.bib)

all: $(OUTPUT).pdf

%.pdf: $(OBJS) $(BIBS)
	$(LATEX) -shell-escape $(basename $@)
	bibtex $(basename $@)
	$(LATEX) -shell-escape $(basename $@)
	$(LATEX) -shell-escape $(basename $@)

.PHONY: clean

clean:
	rm -f *.{aux,bbl,blg,log,toc} $(OUTPUT).pdf
