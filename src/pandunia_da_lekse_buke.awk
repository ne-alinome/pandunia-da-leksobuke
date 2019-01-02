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
	print "// This file is part of the project"
	print "// _pandunia da lekse buke_"
	print "// (http://ne.alinome.net)"
	print
	print "// This document was created automatically"
	print "// in Asciidoctor format (http://asciidoctor.org)."
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

	current_letter="*" # dummy non-alphabet character to start

	default_ORS=ORS

	}

# ==============================================================

{
	if (NR>1){

		loge_asle= $1
		klase=     $2 # coverb, dex, made, mosim, nax, planet

		pandunia=  $4

		engli=     $6
		esperanti= $7
		suomi=     $8
		polski=    $9
		putonghan= $11
		rusi=      $12
		espani=    $10
		fransi=    $13

		this_letter=substr(pandunia,1,1)
		if (this_letter!=current_letter){
			current_letter=this_letter
			print ""
			print "// ",current_letter," {{{1"
			print "== ",current_letter
			print ""
			}

		print "{bullet}**",pandunia,"**"
		if (klase!=""){
			ORS=""
			print " (",klase,")"
			ORS=default_ORS
			print ""
		}
		print ""

		if (engli!="")     print "- engli: "     , engli
		if (espani!="")    print "- espani: "    , espani
		if (esperanti!="") print "- esperanti: " , esperanti
		if (fransi!="")    print "- fransi: "    , fransi
		if (polski!="")    print "- polski: "    , polski
		if (putonghan!="") print "- putonghan: " , putonghan
		if (rusi!="")      print "- rusi: "      , rusi
		if (suomi!="")     print "- suomi: "     , suomi
		print ""

		if (loge_asle!=""){
			print "loge asle: ",loge_asle
			print ""
		}
	}
}

# ==============================================================

END { }

# ==============================================================
# Change log

# 2019-01-02: Start.
