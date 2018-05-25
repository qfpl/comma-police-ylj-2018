ALL_TEX = sv.tex
SV_TEX = sv.tex
SV = sv.pdf
PDFS = $(SV)
LATEX = pdflatex -shell-escape
SPELL = aspell check -len_GB

.PHONY: all spell open clean plots sv

all: sv

sv: plots $(SV)

plots: data
	make -C data

%.pdf: %.tex diagrams/*
	$(LATEX) $<
	$(LATEX) $<
	$(LATEX) $<

re: clean all

spell: $(ALL_TEX)
	for x in $(ALL_TEX) ; do \
	  $(SPELL) $$x ; \
	done

clean:
	rm -rf $(PDFS) *.loc *.toc *.log *.idx *.aux *.out *.nav *.snm *.vrb *.blg *.bbl *.pdf_tex

