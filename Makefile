# Makefile of _pandunia da lekse buke_

# This file is part of the project
# _pandunia da lekse buke_
# (http://ne.alinome.net)

# By Marcos Cruz (programandala.net)

# Last modified 201901021920
# See change log at the end of the file

# ==============================================================
# Requirements

# - make

# ==============================================================
# Config

VPATH=./src:./target

# ==============================================================
# Interface

.PHONY: all
all: epub

.PHONY: adoc
adoc: target/pandunia_da_lekse_buke.adoc

.PHONY: epub
epub: target/pandunia_da_lekse_buke.adoc.xml.pandoc.epub

.PHONY: clean
clean:
	rm -f target/* tmp/*

# ==============================================================
# Make Asciidoctor from the original table

target/pandunia_da_lekse_buke.adoc: src/pandunia-lekse.tsv
	awk --file src/pandunia_da_lekse_buke.awk \
		$< > $@

# ==============================================================
# Make DocBook from Asciidoctor

%.adoc.xml: %.adoc
	asciidoctor --backend=docbook5 --out-file=$@ $<

# ==============================================================
# Make EPUB from DocBook

%.adoc.xml.pandoc.epub: %.adoc.xml
	pandoc -f docbook -t epub --output $@ $<

# ==============================================================
# Change log

# 2019-01-02: Start.
