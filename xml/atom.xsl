<?xml version="1.0" encoding="iso-8859-1"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="xml"
            encoding="iso-8859-1"
            indent="yes"/>

<xsl:param name="lang">en</xsl:param>
<xsl:param name="date"/>

<xsl:template name="uri">http://geexbox.org/<xsl:value-of select="$lang"/>/news.xml</xsl:template>

<xsl:template match="section">

  <xsl:comment>
      This web site is (c) 2005 Alexis Saettler
      HomePage for the GeeXboX Project (http://www.geexbox.org/)
      Feel free to get inspiration from this site, as long as you leave
      this comment here.

      THIS PAGE WAS AUTOMATICALY GENERATED FROM TEMPLATES,
      USING AN XSLT PROCESSOR.
      VALID ATOM 1.0.
  </xsl:comment>

  <xsl:element name="feed">
    <xsl:attribute name="xmlns">http://www.w3.org/2005/Atom</xsl:attribute>
    <xsl:attribute name="xml:lang"><xsl:value-of select="$lang"/></xsl:attribute>

    <title type="text">GeeXboX</title>
    <updated><xsl:value-of select="$date"/></updated>
    <id><xsl:call-template name="uri"/></id>
    <author>
      <name>GeeXboX Team</name>
      <email>webmaster@geexbox.org</email>
      <uri>http://geexbox.org/</uri>
    </author>
    <xsl:element name="link">
      <xsl:attribute name="rel">self</xsl:attribute>
      <xsl:attribute name="type">application/atom+xml</xsl:attribute>
      <xsl:attribute name="href"><xsl:call-template name="uri"/></xsl:attribute>
    </xsl:element>
    <xsl:element name="link">
      <xsl:attribute name="rel">alternate</xsl:attribute>
      <xsl:attribute name="hreflang"><xsl:value-of select="$lang"/></xsl:attribute>
      <xsl:attribute name="href">http://www.geexbox.org/<xsl:value-of select="$lang"/>/</xsl:attribute>
    </xsl:element>
    <subtitle type="text"><xsl:value-of select="./content[@lang=$lang]/@title"/></subtitle>
    <icon>http://geexbox.org/img/geexbox-icon.png</icon>
    <logo>http://geexbox.org/img/logo-gx-small.png</logo>
    <rights> © 2005 GeeXboX Team </rights>

    <xsl:apply-templates select="subsection"/>

  </xsl:element>
</xsl:template>


<xsl:template match="subsection">
  <entry>
    <title><xsl:value-of select="./content[@lang=$lang]/@title"/></title>
    <id>tag:geexbox.org,<xsl:value-of select="@date"/>:/<xsl:value-of select="$lang"/>/<xsl:value-of select="@label"/></id>
    <xsl:element name="link">
      <xsl:attribute name="rel">alternate</xsl:attribute>
      <xsl:attribute name="href">http://geexbox.org/<xsl:value-of select="$lang"/>/index.html#<xsl:value-of select="@label"/></xsl:attribute>
      <xsl:attribute name="type">text/html</xsl:attribute>
      <xsl:attribute name="title"><xsl:value-of select="./content[@lang=$lang]/@title"/></xsl:attribute>
    </xsl:element>
    <updated><xsl:value-of select="@date"/>T00:00:00Z</updated>
    <xsl:apply-templates select="./content[@lang=$lang]"/>
  </entry>
</xsl:template>

<xsl:template match="content">
  <xsl:element name="content">
    <xsl:attribute name="type">xhtml</xsl:attribute>
    <xsl:attribute name="xml:lang"><xsl:value-of select="@lang"/></xsl:attribute>
    <xsl:attribute name="xml:base">http://geexbox.org/<xsl:value-of select="@lang"/>/index.html#<xsl:value-of select="../@label"/></xsl:attribute>
    <xhtml:div xmlns:xhtml="http://www.w3.org/1999/xhtml">
      <xsl:apply-templates/>
    </xhtml:div>
  </xsl:element>
</xsl:template>

<xsl:template match="article">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="define"/>

<xsl:template match="use">
  <xsl:variable name="use-name"><xsl:value-of select="@name"/></xsl:variable>
  <xsl:apply-templates select="/article/define[@name=$use-name]/node()"/>
</xsl:template>

<xsl:template match="page">
  <xsl:element name="a">
    <xsl:variable name="page" select="@name"/>
    <xsl:variable name="menu" select="document('menu.xml')/menu"/>
    <xsl:attribute name="href">
      <xsl:value-of select="$menu/item/subitem[@name=$page]/@url"/>
    </xsl:attribute>
    <xsl:value-of select="$menu/item/subitem[@name=$page]/text[@lang=$lang]"/>
  </xsl:element>
</xsl:template>

<xsl:template match="@*|node()">
  <xsl:copy>
    <xsl:apply-templates select="@*|node()"/>
  </xsl:copy>
</xsl:template>

</xsl:stylesheet>
