LATEX=lualatex
DOCS=assign1_parta.pdf assign1_partB_1.pdf assign1_partB_2.pdf

all: $(DOCS)

%.pdf: %.tex
	$(LATEX) --shell-escape $^ 

clean:
	rm -rf $(DOCS) *.aux *.log _minted*
