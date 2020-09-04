#
#  Datasheet template make fragment
#
#  Copyright (c) 2020 by Daniel Kelley
#

PRJ := top
OUT := pdf
LMK := -interaction=nonstopmode
LMK += -pdflua

.PHONY: all pdf html clean

all: $(OUT)

pdf: $(PRJ).pdf

html: $(PRJ).html

$(PRJ).html: $(PRJ).pdf $(DEP)
	lwarpmk html
	lwarpmk html
	lwarpmk limages

$(PRJ).pdf: $(PRJ).tex $(DEP)
	latexmk $(LMK) $<
	lwarpmk print

clean:
	-rm -rf *.{pdf*,aux,log,dvi,css,lwarpmkconf,cut,txt,fdb_latexmk,fls,svg} lwarp* *html* *-images
