<?xml version="1.0" encoding="iso-8859-1"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="xml" encoding="iso-8859-1"
            doctype-public="-//W3C//DTD XHTML 1.1//EN"
            doctype-system="http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd"
            indent="yes"/>

<xsl:param name="lang">en</xsl:param>
<xsl:param name="filename"></xsl:param>

<xsl:template match="/article">

  <html>
    <xsl:comment>
      This web site is (c) 2003 Zores Benjamin
      HomePage for the GeeXboX Project (http://www.geexbox.org/)
      Design from the OpenWeb Group (http://www.openweb.eu.org/)
      Feel free to get inspiration from this site, as soon as you leave
      this comment here.

      THIS PAGE WAS AUTOMATICALY GENERATED FROM TEMPLATES,
      USING AN XSLT PROCESSOR.
      VALID XHTML 1.1 AND CSS 2.0 PAGE.
    </xsl:comment>

    <head>
      <title>GeeXboX HomePage</title>
      <meta http-equiv="Content-language" content="en"/>
      <link rel="stylesheet" type="text/css" href="../style.css"/>
      <link rel="icon" type="images/png" href="../img/geexbox-icon.png"/>
    </head>

    <body>
      <div id="page">        

        <xsl:call-template name="banner"/>
        <xsl:apply-templates select="node()"/>

        <xsl:call-template name="menu"/>
        <xsl:call-template name="ours"/>

      </div>        
    </body>
  </html>

</xsl:template>

<xsl:template match="define"></xsl:template>

<xsl:template match="use">
  <xsl:variable name="use-name"><xsl:value-of select="@name"/></xsl:variable>
  <xsl:apply-templates select="/article/define[@name=$use-name]/node()"/>
</xsl:template>

<xsl:template match="section">
  <div id="text">
    <h2><xsl:value-of select="./content[@lang=$lang]/@title"/></h2>
    <xsl:if test="./content[@lang=$lang]/node()">
      <p><xsl:apply-templates select="./content[@lang=$lang]/node()"/></p>
    </xsl:if>
    <xsl:apply-templates select="./subsection"/>
  </div>
</xsl:template>

<xsl:template match="subsection">
  <h4><xsl:value-of select="./content[@lang=$lang]/@title"/></h4>
  <xsl:if test="./content[@lang=$lang]/node()">
    <p><xsl:apply-templates select="./content[@lang=$lang]/node()"/></p>
  </xsl:if>
</xsl:template>

<xsl:template match="center">
  <p class="center">
    <xsl:apply-templates select="node()"/>
  </p>
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


<xsl:template match="/banner"><xsl:call-template name="banner"/></xsl:template>
<xsl:template name="banner">
  <xsl:variable name="banner" select="document('banner.xml')/banner"/>
  <div id="title">
    <div id="language">
      <xsl:for-each select="$banner/langs/text">
        <xsl:element name="a">
          <xsl:attribute name="href">../<xsl:value-of select="@lang"/>/<xsl:value-of select="$filename"/></xsl:attribute>
          <xsl:value-of select="."/>
        </xsl:element><br/>
      </xsl:for-each>
    </div>
    <xsl:element name="a">
      <xsl:attribute name="href">
        <xsl:value-of select="$banner/logo/@link"/>
      </xsl:attribute>
      <xsl:element name="img">
        <xsl:attribute name="class">logo</xsl:attribute>
        <xsl:attribute name="src">
          <xsl:value-of select="$banner/logo/@src"/>
        </xsl:attribute>
        <xsl:attribute name="alt">
          <xsl:value-of select="$banner/logo/@alt"/>
        </xsl:attribute>
        <xsl:attribute name="title">
          <xsl:value-of select="$banner/logo/@title"/>
        </xsl:attribute>
      </xsl:element>
    </xsl:element>
  </div>
</xsl:template>

<xsl:template match="/menu"><xsl:call-template name="menu"/></xsl:template>
<xsl:template name="menu">
  <div id="menus">
    <div id="sectionmenus">
      <xsl:variable name="menu" select="document('menu.xml')/menu"/>
      <xsl:for-each select="$menu/item">
        <xsl:element name="div">
          <xsl:attribute name="id"><xsl:value-of select="@id"/></xsl:attribute>
          <h2><xsl:value-of select="./text[@lang=$lang]"/></h2>
          <ul>
          <xsl:for-each select="./subitem">
            <li>
              <xsl:element name="a">
                <xsl:attribute name="href">
                  <xsl:value-of select="@url"/>
                </xsl:attribute>
                <xsl:value-of select="./text[@lang=$lang]"/>
              </xsl:element>
            </li>
          </xsl:for-each>
          </ul>
        </xsl:element>
      </xsl:for-each>
    </div>
  </div>
</xsl:template>

<xsl:template match="/ours"><xsl:call-template name="ours"/></xsl:template>
<xsl:template name="ours">
  <div id="ours">
    <xsl:apply-templates select="document('ours.xml')/ours/content[@lang=$lang]/node()"/>
  </div>
</xsl:template>


<xsl:template match="webmaster">
  <a href="mailto:webmaster@geexbox.org">Webmaster</a>
</xsl:template>

<xsl:template match="users">
  <a href="mailto:users@geexbox.org"><b>users@geexbox.org</b></a>
</xsl:template>

<xsl:template match="devel">
  <a href="mailto:devel@geexbox.org"><b>devel@geexbox.org</b></a>
</xsl:template>

<xsl:template match="xhtml">
  <xsl:element name="a">
    <xsl:attribute name="href">http://validator.w3.org/check/referer</xsl:attribute>
    <xsl:if test="@title">
      <xsl:attribute name="title"><xsl:value-of select="@title"/></xsl:attribute>
    </xsl:if>XHTML 1.1</xsl:element>
</xsl:template>

<xsl:template match="css">
  <xsl:element name="a">
    <xsl:attribute name="href">http://jigsaw.w3.org/css-validator/</xsl:attribute>
    <xsl:if test="@title">
      <xsl:attribute name="title"><xsl:value-of select="@title"/></xsl:attribute>
    </xsl:if>CSS2</xsl:element>
</xsl:template>

<xsl:template match="openweb">
  <xsl:element name="a">
    <xsl:attribute name="href">http://openweb.eu.org/</xsl:attribute>
    <xsl:if test="@title">
      <xsl:attribute name="title"><xsl:value-of select="@title"/></xsl:attribute>
    </xsl:if>OpenWeb Group</xsl:element>
</xsl:template>


<xsl:template match="@*|node()">
  <xsl:copy>
    <xsl:apply-templates select="@*|node()"/>
  </xsl:copy>
</xsl:template>

</xsl:stylesheet>
