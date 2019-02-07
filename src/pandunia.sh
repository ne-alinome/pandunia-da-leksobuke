#!/bin/sh

# pandunia

# A dict wrapper to search the Pandunia dictionary.

# This file is part of the project
# _pandunia da lekse buke_
# (http://ne.alinome.net)

# By Marcos Cruz (programandala.net), 2019


# Usage
#
# Copy or link this file to a directory in your path, with your name
# of choice, e.g.  <~/bin/pandunia>, <~/.local/bin/pandunia> or
# </usr/local/bin/pandunia>.

# Change log
#
# 2019-01-11: First version, only for the main dictionary.
# 2019-02-07: Search all Pandunia dictionaries installed.

dictionaries=$(\
  dict -D | \
  grep "\<pandunia\>" --ignore-case |\
  sed -e "s/\s*\(\S\+\) .*/\1/"
  )

for dictionary in $dictionaries
do
  dict -d $dictionary $*
done
