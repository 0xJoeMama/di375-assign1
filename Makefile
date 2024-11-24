LATEX=lualatex
LATEX_FLAGS=--shell-escape --halt-on-error
DOCS=assign1_parta.pdf assign1_partB_1.pdf assign1_partB_2.pdf
TMP=build
ZIP=assign1_$(USER).zip
ZIP_CONTENTS=$(DOCS) $(TMP)/assign_1.vhd $(TMP)/assign_1_tb.vhd

all: $(DOCS)

%.pdf: %.tex
	$(LATEX) $(LATEX_FLAGS) $^ 

$(TMP)/assign_1.vhd: assign_1/majority_old.vhdl | $(TMP)
	cp $^ $@

$(TMP)/assign_1_tb.vhd: assign_1/majority_tb.vhdl | $(TMP)
	cp $^ $@

$(TMP):
	mkdir -p $@

zip: $(ZIP_CONTENTS)
	zip -j $(ZIP) $^

clean:
	rm -rf $(DOCS) *.aux *.log _minted* $(TMP) *.zip

