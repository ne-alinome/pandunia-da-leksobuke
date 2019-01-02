#!/usr/bin/awk

# This file is part of the project
# _pandunia da lekse buke_
# (http://ne.alinome.net)

# By Marcos Cruz (programandala.net), 2019

# Last modified 201901022222
# See change log at the end of the file

# ==============================================================

BEGIN {

	RS = "\n" 
	FS = "\t"
	OFS = ""

	print "= pandunia da lekse buke"
	print ":author: Risto Kupsala"
	print ":revdate: {nbsp}"
	print
	print ":bullet: ."
	print
	print "// This document was created automatically"
	print "// in Asciidoctor format."
	print
	print "== na ci buke"
	print
	print "ci buke ada"
	print "http://pandunia.info[pandunia] da pan lekse"
	print "du Risto Kupsala kitaba"
	print "na {docdate}."
	print
	print "fini buke mey zaman na http://ne.alinome.net[ne alinome]."
	print
	print "Marcos Cruz, 2019-01"
	print
	print "== lekse liste"
	print

	}

# ==============================================================

{
	if (NR>1){
		print "{bullet}**",$4,"** (",$2,")"
		print ""
		if ($6!="")  print "- engli: ",$6
		if ($10!="") print "- espani: ",$10
		if ($7!="")  print "- esperanti: ",$7
		if ($13!="") print "- fransi: ",$13
		if ($9!="")  print "- polski: ",$9
		if ($11!="") print "- putonghan: ",$11
		if ($12!="") print "- rusi: ",$12
		if ($8!="")  print "- suomi: ",$8
		print ""
		if ($1!=""){
			print "loge asle: ",$1
			print ""
		}
	}
}

# ==============================================================

END { }

# ==============================================================
# Change log

# 2019-01-02: Start.
