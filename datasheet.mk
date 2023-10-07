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

#
# lwarpmk does background image processing with no obvious way to wait for
# completion, which is probably why it says
#
#   "Wait a moment for the images to complete"
#
# We will just wait until the temp images go away
#
release: html
	for file in $(PRJ)-images/lateximagetemp-*; do \
	    while [ -f $$file ]; do \
	        echo "wait for $$file deletion"; \
	        sleep 1; \
	    done; \
	done
	cp -a $(PRJ).html $(PRJ)-images lwarp.css $(REL)

clean:
	-rm -rf *.{pdf,aux,log,dvi,css,lwarpmkconf,cut,txt,fdb_latexmk,fls,svg} lwarp* *html* *-images $(PRJ).out
