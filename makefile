OUTPUT := tcc-proposal
LATEX  := xelatex

OBJS   := $(wildcard *.tex)

all: $(OUTPUT).pdf

%.pdf: $(OBJS)
	$(LATEX) $(basename $@)
	bibtex  $(basename $@)
	$(LATEX) $(basename $@)
	$(LATEX) $(basename $@)

.PHONY: clean

clean:
	rm -f *.{aux,bbl,blg,log} $(OUTPUT).pdf
