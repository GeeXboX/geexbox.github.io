<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:include href="geexbox.xsl"/>
<xsl:output method="xml"
            encoding="UTF-8"
            doctype-public="" doctype-system=""
            indent="yes"/>

<xsl:param name="date"/>

<xsl:template name="uri">http://geexbox.org/<xsl:value-of select="$lang"/>/</xsl:template>

<xsl:template match="article">
  <xsl:comment>
      This web site is (c) 2005-2006 Alexis Saettler
      HomePage for the GeeXboX Project (http://www.geexbox.org/)
      Feel free to get inspiration from this site, as long as you leave
      this comment here.

      THIS PAGE WAS AUTOMATICALY GENERATED FROM TEMPLATES,
      USING AN XSLT PROCESSOR.
      VALID ATOM 1.0 (See "related" link below).
  </xsl:comment>

  <feed>
    <xsl:attribute name="xmlns">http://www.w3.org/2005/Atom</xsl:attribute>
    <xsl:attribute name="xml:lang"><xsl:value-of select="$lang"/></xsl:attribute>
    <xsl:apply-templates select="section"/>
  </feed>
</xsl:template>

<xsl:template match="section">
  <title type="text">GeeXboX</title>
  <updated><xsl:value-of select="$date"/></updated>
  <id><xsl:call-template name="uri"/>news.xml</id>
  <author>
    <name>GeeXboX Team</name>
    <email>webmaster@geexbox.org</email>
    <uri>http://geexbox.org/</uri>
  </author>
  <link rel="self" type="application/atom+xml">
    <xsl:attribute name="href"><xsl:call-template name="uri"/>news.xml</xsl:attribute>
  </link>
  <link rel="alternate">
    <xsl:attribute name="hreflang"><xsl:value-of select="$lang"/></xsl:attribute>
    <xsl:attribute name="href"><xsl:call-template name="uri"/></xsl:attribute>
  </link>
  <link rel="related" title="Atom Feed Validator" hreflang="en">
    <xsl:attribute name="href">http://www.feedvalidator.org/check.cgi?url=<xsl:call-template name="uri"/>news.xml</xsl:attribute>
  </link>
  <subtitle type="text"><xsl:value-of select="content[@lang=$lang]/@title"/></subtitle>
  <icon>http://geexbox.org/img/geexbox-icon.png</icon>
  <logo>http://geexbox.org/img/logo-gx-small.png</logo>
  <rights> © 2005 GeeXboX Team </rights>
  <xsl:apply-templates select="subsection"/>
</xsl:template>

<xsl:template match="subsection">
  <entry>
    <title><xsl:value-of select="content[@lang=$lang]/@title"/></title>
    <id>tag:geexbox.org,<xsl:value-of select="@date"/>:/<xsl:value-of select="$lang"/>/<xsl:value-of select="@label"/></id>
    <link rel="alternate" type="text/html">
      <xsl:attribute name="href"><xsl:call-template name="uri"/>index.html#<xsl:value-of select="@label"/></xsl:attribute>
      <xsl:attribute name="title"><xsl:value-of select="content[@lang=$lang]/@title"/></xsl:attribute>
    </link>
    <updated><xsl:value-of select="@date"/>T00:00:00Z</updated>
    <xsl:apply-templates select="content[@lang=$lang]"/>
  </entry>
</xsl:template>

<xsl:template match="content">
  <content type="xhtml">
    <xsl:attribute name="xml:lang"><xsl:value-of select="@lang"/></xsl:attribute>
    <xhtml:div xmlns:xhtml="http://www.w3.org/1999/xhtml">
      <xsl:apply-templates/>
    </xhtml:div>
  </content>
</xsl:template>
</xsl:stylesheet>
