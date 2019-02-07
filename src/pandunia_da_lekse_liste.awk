#!/usr/bin/awk

# pandunia_da_lekse_liste.awk

# This file is part of the project
# _pandunia da lekse buke_
# (http://ne.alinome.net)

# By Marcos Cruz (programandala.net), 2019

# Last modified 201902071737
# See change log at the end of the file

# ==============================================================

BEGIN { # {{{1

  RS = "\n" 
  FS = "\t"
  OFS = ""

  default_ORS=ORS

  switch (lang) {

    case "eng": {
      lang_name="engli"
      eng_lang_name="English"
      headword=6
      break
      }
    case "epo": {
      lang_name="esperanti"
      eng_lang_name="Esperanto"
      headword=7
      break
      }
    case "fin": {
      lang_name="suomi"
      eng_lang_name="Finnish"
      headword=8
      break
      }
    case "fra": {
      lang_name="fransi"
      eng_lang_name="French"
      headword=13
      break
      }
    case "pol": {
      lang_name="polski"
      eng_lang_name="Posish"
      headword=9
      break
      }
    case "rus": {
      lang_name="rusi"
      eng_lang_name="Russian"
      headword=11
      break
      }
    case "spa": {
      lang_name="espani"
      eng_lang_name="Spanish"
      headword=10
      break
      }
    case "zho": {
      lang_name="putonghan"
      eng_lang_name="Chinese"
      headword=12
      break
      }

  }

  if (target==""){
    target=="asciidoctor" # default value
  }

  #print "target==",target # XXX INFORMER
  #exit # XXX INFORMER

  if (target=="asciidoctor"){
    print "= pandunia da lekse liste ze " lang_name
    print ":author: risto kupsala"
    print ":revdate: ",datadate
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
    print "== na tem du ci buke"
    print
    print "ci buke ada"
    print "http://pandunia.info[pandunia.info] da pan lekse liste"
    print "na " lang_name "."
    print
    print "ci buke i ali forme ze http://ne.alinome.net[ne.alinome.net]."
    print
    print "nen mes den du lekse informe: ",datadate,"."

    current_letter="*" # dummy non-alphabet character to start

  }

  if (target=="c5"||target=="p"||target=="j"){
    switch (lang) {
      case "epo": print "Vortaro Esperanto-Pandunio"; break
      case "spa": print "Vocabulario español-pandunia"; break
    }
    print "pandunia da lekse liste na " lang_name
    print eng_lang_name "-Pandunia Vocabulary"
    print
    switch (lang) {
      case "epo": {
        print "Ĉi vortaro enhavas ĉiujn vortojn el:"
        break
      }
      case "spa": {
        print "Este vocabulario incluye todos los términos de:"
        break
      }
    }
    print "ci lekse liste ada pan lekse du:"
    print "This dictionary contains all the vocabulary from:"
    print
    print "  http://pandunia.info"
    print
    switch (lang) {
      case "epo": {
        print "Ĉi dosiero DICT kaj aliaj formatoj estas en:"
        break
      }
      case "spa": {
        print "Este fichero en formato DICT y otros están en:"
        break
      }
    }
    print "ci DICT liste i ali forme ze:"
    print "This DICT file and other formats are in:"
    print
    print "  http://ne.alinome.net"
    print
    switch (lang) {
      case "epo": {
        print "Dato de la vortara datumbanko:"
        break
      }
      case "spa": {
        print "Fecha de la base de datos del diccionario:"
        break
      }
    }
    print "nen mes den du lekse informe:"
    print "Date of the vocabulary data:"
    print
    print "  " datadate
    print
  }

}

# ==============================================================

{ # main block {{{1
  if (NR>1){

    pandunia=  $4
    loge_asle= $1 # origin
    klase=     $2 # class: coverb, dex, made, mosim, nas, planet

    if (target=="asciidoctor"){ # {{{2

      # XXX TODO --

      this_letter=substr(pandunia,1,1)
      if (this_letter!=current_letter){
        current_letter=this_letter
        print ""
        print "// ",current_letter," {","{","{1"
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

    if ($headword!="") {

      if (target=="c5"){ # {{{2
        
        print "_____"
        print ""
        print $headword
        if (klase!="") ORS=""
        print pandunia
        print ""
        if (klase!=""){
          print "(",klase,")"
          ORS=default_ORS
          print ""
        }

      }

      if (target=="j"){ # {{{2

        if (klase!="") ORS=""
        print ":",$headword,":",pandunia
        if (klase!=""){
          print " (",klase,")"
          ORS=default_ORS
          print ""
        }

      }

      if (target=="p"){ # {{{2

        print "%h ",$headword
        print "%d"
        if (klase!="") ORS=""
        print pandunia
        if (klase!=""){
          print "(",klase,")"
          ORS=default_ORS
          print ""
        }

      }

    }

  }
}

# ==============================================================

END { } # {{{1

# ==============================================================
# Change log {{{1

# 2019-02-07: Start.
