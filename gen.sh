#!/bin/sh
# Generate html pages.
#  usage : ./gen.sh [param]
#    param : backend to use : sabcmd or xsltproc
#

if [ -z "$1" ]; then
  if [ -n "`which sabcmd`" ]; then
    BACKEND=sabcmd
  else
    BACKEND=xsltproc
  fi
else
  BACKEND=$1
fi


PAGES="index old start license screenshot requirements downloads buy doc controls generator hard faq links sponsors press mailing contact dev donate packages 404"
LANGS="en fr de"

for l in $LANGS; do
  mkdir -p $l

  case $BACKEND in
  sabcmd)

    for p in $PAGES; do
      sabcmd --batch-xsl xml/geexbox.xsl xml/$p.xml $l/$p.html \$filename=$p.html \$lang=$l
    done
    sabcmd --batch-xsl xml/atom.xsl xml/index.xml $l/news.xml \$date=`date "+%Y-%m-%dT%H:%M:%SZ"` \$lang=$l
    ;;
  
  xsltproc)

    for p in $PAGES; do
      xsltproc --stringparam filename $p.html --stringparam lang $l xml/geexbox.xsl xml/$p.xml > $l/$p.html
    done
    xsltproc --stringparam date "`date "+%Y-%m-%dT%H:%M:%SZ"`" --stringparam lang $l xml/geexbox.xsl xml/index.xml > $l/news.xml

    ;;
  esac
done
