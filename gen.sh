#!/bin/sh
# Generate html pages.
#  usage : ./gen.sh

PAGES="index old start license screenshot downloads buy doc controls generator hard faq links sponsors press mailing contact dev donate packages 404"
LANGS="en"

rm -rf public
mkdir -p public

for l in $LANGS; do
    mkdir -p $l

    for p in $PAGES; do
        xsltproc --stringparam filename $p.html --stringparam lang $l xml/geexbox.xsl xml/$p.xml > $l/$p.html
    done
    xsltproc --stringparam date "`date "+%Y-%m-%dT%H:%M:%SZ"`" --stringparam lang $l xml/geexbox.xsl xml/index.xml > $l/news.xml
    cp -rf $l/* public
done

cp -rf img style public

