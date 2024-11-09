LATEX=xelatex
DOCS=assign1_parta.pdf

all: $(DOCS)

%.pdf: %.tex
	$(LATEX) $^

clean:
	rm -rf $(DOCS)
