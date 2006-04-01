#!/bin/sh

PAGES="index start license screenshot bugs requirements downloads buy doc hard faq links sponsors press mailing contact dev donate packages 404"
LANGS="en fr de"

for l in $LANGS; do
  mkdir -p $l
  if [ -n "`which sabcmd`" ]; then

    for p in $PAGES; do
      sabcmd --batch-xsl xml/geexbox.xsl xml/$p.xml $l/$p.html \$filename=$p.html \$lang=$l
    done
    sabcmd --batch-xsl xml/atom.xsl xml/index.xml $l/news.xml \$date=`date "+%Y-%m-%dT%H:%M:%SZ"` \$lang=$l

  else

    for p in $PAGES; do
      xsltproc --stringparam filename $p.html --stringparam lang $l xml/geexbox.xsl xml/$p.xml > $l/$p.html
    done
    xsltproc --stringparam date "`date "+%Y-%m-%dT%H:%M:%SZ"`" --stringparam lang $l xml/geexbox.xsl xml/index.xml > $l/news.xml

  fi
done
