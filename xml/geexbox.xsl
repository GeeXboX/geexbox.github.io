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
      Feel free to get inspiration from this site, as long as you leave
      this comment here.

      THIS PAGE WAS AUTOMATICALY GENERATED FROM TEMPLATES,
      USING AN XSLT PROCESSOR.
      VALID XHTML 1.1 AND CSS 2.0 PAGE.
    </xsl:comment>

    <head>
      <title>GeeXboX HomePage</title>
      <meta http-equiv="Content-language" content="en"/>
      <meta http-equiv="Content-Type" content="application/xhtml+xml; charset=ISO-8859-1"/>
      <meta name="description" content="GeeXboX Homepage : a free software media center for Linux"/>
      <meta name="dc.description" content="GeeXboX Homepage : a free software media center for Linux"/>
      <meta name="dc.subject" content="GeeXboX Homepage : a free software media center for Linux"/>
      <meta name="dc.title" content="GeeXboX Homepage"/>
      <meta name="author" content="Aurelien Jacobs, Benjamin Zores"/>
      <meta name="robots" content="index, follow"/>
      <meta name="keywords" content="computer, OS, Linux, distribution, embedded, multimedia, HTPC, home, theater, LiveCD, movie, audio, video, media, center, MPlayer, standalone, player, free, software, open, source, mpeg, mp3, divx, xvid, matroska, ogg, vorbis, AC3, DTS, VCD, DVD, CD, TV, tuner, TVOut, ATI, nVidia, DXR3, WiFi, PC, computer, buysbox, uClibc, geexbox, geexbox.org"/>
      <xsl:call-template name="stylesheet"/>
      <link rel="icon" type="images/png" href="../img/geexbox-icon.png"/>
      <script type="text/javascript" src="../style/styleswitcher.js">
        <xsl:comment>just to get the non-minimized form of the element</xsl:comment>
      </script>
      <script type="text/javascript" src="../style/pngfix.js">
        <xsl:comment>just to get the non-minimized form of the element</xsl:comment>
      </script>
      <script type="text/javascript" src="../style/toggle.js">
        <xsl:comment>just to get the non-minimized form of the element</xsl:comment>
      </script>
    </head>

    <body>
      <div id="page">

        <xsl:call-template name="banner"/>
        <xsl:call-template name="menu"/>
        <xsl:apply-templates select="node()"/>
        <xsl:call-template name="style"/>
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
  <div id="textbox">
    <div id="text">
      <h2>
        <xsl:if test="@label">
          <xsl:element name="a">
            <xsl:attribute name="id">
              <xsl:value-of select="@label"/>
            </xsl:attribute>
            <xsl:comment>just to get the non-minimized form of the element</xsl:comment>
          </xsl:element>
        </xsl:if>
        <xsl:value-of select="./content[@lang=$lang]/@title"/>
      </h2>
      <xsl:if test="./content[@lang=$lang]/node()">
        <div class="p">
          <xsl:apply-templates select="./content[@lang=$lang]/node()"/>
        </div>
      </xsl:if>
      <xsl:apply-templates select="./subsection"/>
    </div>
  </div>
</xsl:template>

<xsl:template match="subsection">
  <h4>
    <xsl:if test="@label">
      <xsl:element name="a">
        <xsl:attribute name="id">
          <xsl:value-of select="@label"/>
        </xsl:attribute>
        <xsl:comment>just to get the non-minimized form of the element</xsl:comment>
      </xsl:element>
    </xsl:if>
    <xsl:value-of select="./content[@lang=$lang]/@title"/>
  </h4>
  <xsl:if test="./content[@lang=$lang]/node()">
    <div class="p">
      <xsl:apply-templates select="./content[@lang=$lang]/node()"/>
    </div>
  </xsl:if>
  <xsl:apply-templates select="description"/>
  <xsl:apply-templates select="download"/>
  <xsl:apply-templates select="use"/>
</xsl:template>

<xsl:template match="description">
  <div id="dldesc">
    <div id="dldescicon">
      <xsl:element name="img">
        <xsl:attribute name="src">
          <xsl:value-of select="@img"/>
        </xsl:attribute>
        <xsl:attribute name="border">0</xsl:attribute>
      </xsl:element>
     </div>
     <div id="dldesctext">
       <xsl:apply-templates select="./node()"/>
     </div>
   </div>
</xsl:template>

<xsl:template match="download">
  <div id="download">
    <div id="dlplusminus">
      <xsl:element name="a">
        <xsl:attribute name="id">plus_<xsl:value-of select="@id"/></xsl:attribute>
        <xsl:attribute name="href">javascript:toggle('<xsl:value-of select="@id"/>','plus_<xsl:value-of select="@id"/>','minus_<xsl:value-of select="@id"/>')</xsl:attribute>
        <xsl:element name="img">
          <xsl:attribute name="src">
            <xsl:value-of select="@plus"/>
          </xsl:attribute>
          <xsl:attribute name="alt">plus</xsl:attribute>
          <xsl:attribute name="border">0</xsl:attribute>
        </xsl:element> 
      </xsl:element>

      <xsl:element name="a">
        <xsl:attribute name="id">minus_<xsl:value-of select="@id"/></xsl:attribute>
        <xsl:attribute name="style">display: none</xsl:attribute>
        <xsl:attribute name="href">javascript:toggle('<xsl:value-of select="@id"/>','minus_<xsl:value-of select="@id"/>','plus_<xsl:value-of select="@id"/>')</xsl:attribute>
        <xsl:element name="img">
          <xsl:attribute name="src">
            <xsl:value-of select="@minus"/>
          </xsl:attribute>
          <xsl:attribute name="alt">minus</xsl:attribute>
          <xsl:attribute name="border">0</xsl:attribute>
        </xsl:element> 
      </xsl:element>
    </div>
    <div id="dlfile">
      <b><xsl:value-of select="@title"/></b>

      <xsl:element name="div">
        <xsl:attribute name="id"><xsl:value-of select="@id"/></xsl:attribute>
        <xsl:attribute name="style">display: none</xsl:attribute>
        <xsl:apply-templates select="./node()"/>
        <xsl:call-template name="mirror"/>
      </xsl:element>
    </div>
  </div>
</xsl:template>

<xsl:template name="mirror">
  <xsl:variable name="full" select="@full"/>
  <xsl:variable name="file" select="@file"/>
  <xsl:variable name="mirrors" select="document('mirrors.xml')/mirrors"/>

  <div id="dltable">
    <xsl:for-each select="$mirrors/mirror[not($full) or $full != 'yes' or not(@partial) or @partial != 'yes']">
      <div>
        <xsl:attribute name="id">row<xsl:value-of select="(position()+1) mod 2"/></xsl:attribute>
        <xsl:element name="img">
          <xsl:attribute name="src">../img/flag-<xsl:value-of select="./country"/>.png</xsl:attribute>
          <xsl:attribute name="alt"><xsl:value-of select="./country"/></xsl:attribute>
        </xsl:element>
        <xsl:element name="a"><xsl:attribute name="href"><xsl:value-of select="./url"/>releases/<xsl:value-of select="$file"/></xsl:attribute><xsl:value-of select="./description"/></xsl:element>
      </div>
    </xsl:for-each>
  </div>
</xsl:template>

<xsl:template match="center">
  <div class="center">
    <xsl:apply-templates select="node()"/>
  </div>
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


<xsl:template match="/style"><xsl:call-template name="style"/></xsl:template>
<xsl:template name="style">
  <xsl:variable name="style" select="document('style.xml')/style"/>
  <div id="styles">
    <h4><xsl:value-of select="$style/content[@lang=$lang]/@title"/></h4>
    <ul>
      <xsl:for-each select="$style/stylesheet">
        <li>
          <xsl:element name="a">
            <xsl:attribute name="href">#</xsl:attribute>
            <xsl:attribute name="onclick">setActiveStyleSheet('<xsl:value-of select="."/>'); return false;</xsl:attribute>
            <xsl:value-of select="."/>
          </xsl:element>
        </li>
      </xsl:for-each>
    </ul>
  </div>
</xsl:template>

<xsl:template name="stylesheet">
  <xsl:variable name="style" select="document('style.xml')/style"/>
  <xsl:for-each select="$style/stylesheet">
    <xsl:element name="link">
      <xsl:attribute name="rel">
        <xsl:choose>
          <xsl:when test="@default='yes'">stylesheet</xsl:when>
          <xsl:otherwise>alternate stylesheet</xsl:otherwise>
        </xsl:choose>
      </xsl:attribute>
      <xsl:attribute name="type">text/css</xsl:attribute>
      <xsl:attribute name="href"><xsl:value-of select="@file"/></xsl:attribute>
      <xsl:attribute name="media"><xsl:value-of select="@media"/></xsl:attribute>
      <xsl:attribute name="title"><xsl:value-of select="."/></xsl:attribute>
    </xsl:element>
  </xsl:for-each>
</xsl:template>

<xsl:template match="/banner"><xsl:call-template name="banner"/></xsl:template>
<xsl:template name="banner">
  <xsl:variable name="banner" select="document('banner.xml')/banner"/>
  <div id="logo">
    <xsl:element name="a">
      <xsl:attribute name="href">
        <xsl:value-of select="$banner/logo/@link"/>
      </xsl:attribute>
      <xsl:element name="img">
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
  <div id="language">
    <ul>
      <xsl:for-each select="$banner/langs/text">
        <li>
          <xsl:element name="a">
            <xsl:attribute name="href">../<xsl:value-of select="@lang"/>/<xsl:value-of select="$filename"/></xsl:attribute>
            <xsl:value-of select="."/>
            <xsl:element name="img">
              <xsl:attribute name="src">
                <xsl:value-of select="@flag"/>
              </xsl:attribute>
              <xsl:attribute name="alt">(<xsl:value-of select="@lang"/>)</xsl:attribute>
            </xsl:element>
          </xsl:element>
        </li>
      </xsl:for-each>
    </ul>
  </div>
</xsl:template>

<xsl:template match="/menu"><xsl:call-template name="menu"/></xsl:template>
<xsl:template name="menu">
  <div id="menubox">
    <div id="menu">
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
    <xsl:attribute name="href">http://jigsaw.w3.org/css-validator/check/referer</xsl:attribute>
    <xsl:if test="@title">
      <xsl:attribute name="title"><xsl:value-of select="@title"/></xsl:attribute>
    </xsl:if>CSS2</xsl:element>
</xsl:template>


<xsl:template match="@*|node()">
  <xsl:copy>
    <xsl:apply-templates select="@*|node()"/>
  </xsl:copy>
</xsl:template>

</xsl:stylesheet>
