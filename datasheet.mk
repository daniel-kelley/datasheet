#
#  Datasheet template make fragment
#
#  Copyright (c) 2020 by Daniel Kelley
#

PRJ ?= top
REL ?= ws
OUT := pdf
LMK := -interaction=nonstopmode
LMK += -pdflua
LMK += $(PRJ_LMK)
LWK := $(PRJ_LWK)

.PHONY: all pdf html clean release

all: $(OUT)

pdf: $(PRJ).pdf

html: $(PRJ).html

$(PRJ).html: $(PRJ).pdf $(DEP)
	lwarpmk $(LWK) html
	lwarpmk $(LWK) html
	lwarpmk $(LWK) limages

$(PRJ).pdf: $(PRJ).tex $(DEP)
	latexmk $(LMK) $<
	lwarpmk $(LWK) print

release: html
	cp -a $(PRJ).html $(PRJ)-images lwarp.css $(REL)

clean:
	-rm -rf *.{pdf,aux,log,dvi,css,lwarpmkconf,cut,txt,fdb_latexmk,fls,svg} lwarp* *html* *-images $(PRJ).out
