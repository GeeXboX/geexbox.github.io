#!/bin/sh

PAGES="index start screenshot bugs requirements downloads doc faq links press contact 404"
LANGS="en fr"

for l in $LANGS; do
  mkdir -p $l
  for p in $PAGES; do
    xsltproc --stringparam filename $p.html --stringparam lang $l xml/geexbox.xsl xml/$p.xml > $l/$p.html
  done
done
