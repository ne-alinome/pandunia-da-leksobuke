# Makefile of _pandunia da lekse buke_

# This file is part of the project
# _pandunia da lekse buke_
# (http://ne.alinome.net)

# By Marcos Cruz (programandala.net)

# Last modified 201901181421
# See change log at the end of the file

# ==============================================================
# Requirements

# - asciidoctor
# - awk
# - dictfmt
# - make
# - pandoc

# ==============================================================
# Config

VPATH=./src:./target

dict_input_format=c5

# ==============================================================
# Interface

.PHONY: all
all: dict epub odt rtf txt xml

.PHONY: adoc
adoc: target/pandunia_da_lekse_buke.adoc

.PHONY: dict
dict: target/pandunia.dict.dz

.PHONY: epub
epub: target/pandunia_da_lekse_buke.adoc.xml.pandoc.epub

.PHONY: odt
odt: target/pandunia_da_lekse_buke.adoc.xml.pandoc.odt

.PHONY: rtf
rtf: target/pandunia_da_lekse_buke.adoc.xml.pandoc.rtf

.PHONY: txt
txt: target/pandunia_da_lekse_buke.adoc.xml.pandoc.txt

.PHONY: xml
xml: target/pandunia_da_lekse_buke.adoc.xml

.PHONY: clean
clean:
	rm -f target/* tmp/*

# ==============================================================
# Make Asciidoctor from the original table

target/pandunia_da_lekse_buke.adoc: src/pandunia-lekse.tsv
	awk \
		--assign target=asciidoctor \
		--file src/pandunia_da_lekse_buke.awk \
		$< > $@

# ==============================================================
# Make dict input text from the original table

tmp/pandunia_da_lekse_buke.txt: src/pandunia-lekse.tsv
	awk \
		--assign target=$(dict_input_format) \
		--file src/pandunia_da_lekse_buke.awk \
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
# Make ODT from DocBook

%.adoc.xml.pandoc.odt: %.adoc.xml
	pandoc -f docbook -t odt --output $@ $<

# ==============================================================
# Make RTF from DocBook

%.adoc.xml.pandoc.rtf: %.adoc.xml
	pandoc -f docbook -t rtf --standalone --output $@ $<

# ==============================================================
# Make plain text from DocBook

%.adoc.xml.pandoc.txt: %.adoc.xml
	pandoc -f docbook -t plain --output $@ $<

# ==============================================================
# Make dict

target/pandunia.dict: tmp/pandunia_da_lekse_buke.txt
	dictfmt \
		--utf8 \
		--allchars \
		-u "http://pandunia.info" \
		-s "pandunia da lekse buke (Pandunia Dictionary)" \
		-$(dict_input_format) \
		$(basename $@) < $<

%.dict.dz: %.dict
	dictzip --force $<

# ==============================================================
# Install and uninstall dict

.PHONY: install
install: target/pandunia.dict.dz
	cp --force \
		$^ \
		$(addsuffix .index, $(basename $(basename $^))) \
		/usr/share/dictd/
	/usr/sbin/dictdconfig --write
	/etc/init.d/dictd restart

.PHONY: uninstall
uninstall:
	rm --force /usr/share/dictd/elefen.*
	/usr/sbin/dictdconfig --write
	/etc/init.d/dictd restart

# ==============================================================
# Change log

# 2019-01-02: Start. Create first version of EPUB with pandoc, from
# Asciidoctor.
#
# 2019-01-03: Create also a dict format dictionary.
#
# 2019-01-18: Update the requirements. Add rule to uninstall the dict format
# dictionary. Add ODT, RTF and TXT outputs.
