#!/usr/bin/awk

# This file is part of the project
# _pandunia da lekse buke_
# (http://ne.alinome.net)

# By Marcos Cruz (programandala.net), 2019

# Last modified 201901030032
# See change log at the end of the file

# ==============================================================

BEGIN {

	RS = "\n" 
	FS = "\t"
	OFS = ""

	if (target==""){
		target=="asciidoctor" # default value
	}

	# print "target==",target; exit # XXX INFORMER

	if (target=="asciidoctor"){
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
		print "http://pandunia.info[pandunia.info] da zay pan lekse liste"
		print "du _risto kupsala_ kitaba."
		print
		print "fini ci buke na EPUB i \"dict\" metode mey zaman"
		print "plus na http://ne.alinome.net[ne.alinome.net]"
		print "du _markos krus_ (\"Marcos Cruz\")."
		print
		print "na 2019-01-03"

		current_letter="*" # dummy non-alphabet character to start

		default_ORS=ORS

	}

	if (target=="c5"||target="p"){
		print "pandunia da lekse buke"
		print "du Risto Kupsala"
		print
		print "ci \"dict\" lekse liste ada http://pandunia.info da pan lekse"
		print "du risto kupsala kitaba."
		print
		print "fini ci buke na EPUB i \"dict\" metode mey zaman"
		print "plus na http://ne.alinome.net"
		print "du _markos krus_ (\"Marcos Cruz\")."
		print
		print "na 2019-01-03"
		print
	}
}

# ==============================================================

{
	if (NR>1){

		pandunia=  $4 # headword
		loge_asle= $1 # origin
		klase=     $2 # class: coverb, dex, made, mosim, nax, planet

		# translations:
		engli=     $6
		esperanti= $7
		suomi=     $8
		polski=    $9
		putonghan= $11
		rusi=      $12
		espani=    $10
		fransi=    $13

		if (target=="asciidoctor"){

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

		}

		if (target=="c5"){
			
			print "_____"
			print
			print pandunia
			if (klase!=""){
				print "(",klase,")"
				print ""
			}

		}

		if (target=="p"){
			
			print "%h ",pandunia
			print "%d"
			if (klase!=""){
				print "(",klase,")"
				print ""
			}

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

# 2019-01-02: Start. Create an Asciidoctor document from the
# original data.
#
# 2019-01-03: Create also two of the input formats used by dictfmt
# in order to create a difct format dictionary.
