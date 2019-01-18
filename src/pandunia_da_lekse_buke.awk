#!/usr/bin/awk

# This file is part of the project
# _pandunia da lekse buke_
# (http://ne.alinome.net)

# By Marcos Cruz (programandala.net), 2019

# Last modified 201901181337
# See change log at the end of the file

# ==============================================================

BEGIN { # {{{1

  RS = "\n" 
  FS = "\t"
  OFS = ""

  if (target==""){
    target=="asciidoctor" # default value
  }

  #print "target==",target # XXX INFORMER
  #exit # XXX INFORMER

  if (target=="asciidoctor"){
    print "= pandunia da lekse buke"
    print ":author: risto kupsala"
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
    print "== na tem du ci buke"
    print
    print "ci buke ada"
    print "http://pandunia.info[pandunia.info] da pan lekse liste."
    print
    print "ci buke i ali forme ze http://ne.alinome.net[ne.alinome.net]."
    print
    print "na 2019-01."

    current_letter="*" # dummy non-alphabet character to start

    default_ORS=ORS

  }

  if (target=="c5"||target=="p"){
    print "pandunia da lekse buke"
    print "(Pandunia Dictionary)"
    print
    print "ci lekse liste ada http://pandunia.info da pan lekse."
    print "(This dictionary contains all the vocabulary from http://pandunia.info.)"
    print
    print "ci \"dict\" i ali forme ze http://ne.alinome.net."
    print "(This \"dict\" and other formats from http://ne.alinome.net.)"
    print
    print "na 2019-01."
    print "(In 2019-01.)"
    print
  }

  iso_codes=1

  # XXX TODO --
  # if (iso_codes){
  #   eng_lang="eng"
  #   esp_lang="epo"
  #   fin_lang="fin"
  #   fra_lang="fra"
  #   pol_lang="pol"
  #   rus_lang="rus"
  #   spa_lang="spa"
  #   zho_lang="zho"
  # }else{
  #   eng_lang="engli"
  #   esp_lang="espani"
  #   esp_lang="esperanti"
  #   fin_lang="suomi"
  #   fra_lang="fransi"
  #   pol_lang="polski"
  #   rus_lang="rusi"
  #   zho_lang="putonghan"
  # }
}

# ==============================================================

{ # main block {{{1
  if (NR>1){

    pandunia=  $4 # headword
    loge_asle= $1 # origin
    klase=     $2 # class: coverb, dex, made, mosim, nas, planet

    # translations:
    engli=     $6
    esperanti= $7
    suomi=     $8
    polski=    $9
    putonghan= $11
    rusi=      $12
    espani=    $10
    fransi=    $13

    if (target=="asciidoctor"){ # {{{2

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

    if (target=="c5"){ # {{{2
      
      print "_____"
      print ""
      print pandunia
      if (klase!=""){
        print "(",klase,")"
        print ""
      }

    }

    if (target=="p"){ # {{{2

      print "%h ",pandunia
      print "%d"
      if (klase!=""){
        print "(",klase,")"
        print ""
      }

    }

    print ""

    if (iso_codes){

      if (engli!="")     print "- eng: " , engli
      if (esperanti!="") print "- epo: " , esperanti
      if (suomi!="")     print "- fin: " , suomi
      if (fransi!="")    print "- fra: " , fransi
      if (polski!="")    print "- pol: " , polski
      if (rusi!="")      print "- rus: " , rusi
      if (espani!="")    print "- spa: " , espani
      if (putonghan!="") print "- zho: " , putonghan

    } else {

      if (engli!="")     print "- engli: "     , engli
      if (espani!="")    print "- espani: "    , espani
      if (esperanti!="") print "- esperanti: " , esperanti
      if (fransi!="")    print "- fransi: "    , fransi
      if (polski!="")    print "- polski: "    , polski
      if (putonghan!="") print "- putonghan: " , putonghan
      if (rusi!="")      print "- rusi: "      , rusi
      if (suomi!="")     print "- suomi: "     , suomi

    }

    print ""

    if (loge_asle!=""){
      print "loge asle: ",loge_asle
      print ""
    }
  }
}

# ==============================================================

END { } # {{{1

# ==============================================================
# Change log {{{1

# 2019-01-02: Start. Create an Asciidoctor document from the original
  # data.
#
# 2019-01-03: Create also two of the input formats used by dictfmt in
  # order to create a difct format dictionary. Add Vim folding
  # markers. Fix output of "c5" format. Convert tabs to spaces.  Fix
  # expression.
#
# 2019-01-05: Fix typo in comment. Support and use optional ISO 639-2
  # language codes for the translations.
#
# 2019-01-09: Update date.
#
# 2019-01-14: Simplify the header added to the book.
#
# 2019-01-18: Improve the headers added to Asciidoctor and dict
  # formats.
