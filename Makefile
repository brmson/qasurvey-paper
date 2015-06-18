TEX=xelatex -shell-escape
BIB=qa.bib
BBL=$(BIB:%.bib=%.bbl)

all: qasurvey.pdf

$(BBL): $(BIB)
	rm -f $(BBL)
	$(TEX) qasurvey
	bibtex qasurvey || :
	$(TEX) qasurvey

qasurvey.pdf: qasurvey.tex $(BBL)
	$(TEX) qasurvey

clean:
	rm -f qasurvey.pdf qasurvey.aux qasurvey.log qasurvey.blg $(BBL)
