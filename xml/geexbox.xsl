<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="xml" encoding="UTF-8"
            doctype-public="-//W3C//DTD XHTML 1.1//EN"
            doctype-system="http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd"
            indent="yes"/>

<xsl:param name="lang">en</xsl:param>
<xsl:param name="filename"></xsl:param>

<xsl:template match="article">

  <html>
    <xsl:attribute name="xmlns">http://www.w3.org/1999/xhtml</xsl:attribute>
    <xsl:attribute name="xml:lang"><xsl:value-of select="$lang"/></xsl:attribute>

    <xsl:comment>
      This web site is (c) 2003-2006 Zores Benjamin
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
      <meta http-equiv="Content-Type" content="application/xhtml+xml; charset=UTF-8"/>
      <meta name="description" content="GeeXboX Homepage : a free software media center for Linux"/>
      <meta name="dc.description" content="GeeXboX Homepage : a free software media center for Linux"/>
      <meta name="dc.subject" content="GeeXboX Homepage : a free software media center for Linux"/>
      <meta name="dc.title" content="GeeXboX Homepage"/>
      <meta name="author" content="Aurelien Jacobs, Benjamin Zores"/>
      <meta name="robots" content="index, follow"/>
      <meta name="keywords" content="computer, OS, Linux, distribution, embedded, multimedia, HTPC, home, theater, LiveCD, movie, audio, video, media, center, MPlayer, standalone, player, free, software, open, source, mpeg, mp3, divx, xvid, matroska, ogg, vorbis, AC3, DTS, VCD, DVD, CD, TV, tuner, TVOut, ATI, nVidia, DXR3, WiFi, PC, buysbox, uClibc, geexbox, geexbox.org"/>
      <link rel="alternate" type="application/atom+xml" title="GeeXboX news feed">
        <xsl:attribute name="href">http://geexbox.org/<xsl:value-of select="$lang"/>/news.xml</xsl:attribute>
      </link>
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
        <xsl:apply-templates select="section"/>
        <xsl:call-template name="style"/>
        <xsl:call-template name="ours"/>

      </div>
    </body>
  </html>

</xsl:template>

<xsl:template match="define|content|lang-name|arch-name|size-name|src-type-name">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="use">
  <xsl:variable name="use-name"><xsl:value-of select="@name"/></xsl:variable>
  <xsl:apply-templates select="/article/define[@name=$use-name]"/>
</xsl:template>

<xsl:template match="section">
  <div id="textbox">
    <div id="text">
      <h2>
        <xsl:if test="@label">
          <a>
            <xsl:attribute name="id">
              <xsl:value-of select="@label"/>
            </xsl:attribute>
            <xsl:comment>just to get the non-minimized form of the element</xsl:comment>
          </a>
        </xsl:if>
        <xsl:value-of select="content[@lang=$lang]/@title"/>
      </h2>
      <xsl:if test="content[@lang=$lang]/node()">
        <div class="p">
          <xsl:apply-templates select="content[@lang=$lang]"/>
        </div>
      </xsl:if>
      <xsl:apply-templates select="subsection"/>
    </div>
  </div>
</xsl:template>

<xsl:template match="subsection">
  <h4>
    <xsl:if test="@label">
      <a>
        <xsl:attribute name="id">
          <xsl:value-of select="@label"/>
        </xsl:attribute>
        <xsl:comment>just to get the non-minimized form of the element</xsl:comment>
      </a>
    </xsl:if>
    <xsl:value-of select="content[@lang=$lang]/@title"/>
    <xsl:if test="@date">
      <xsl:choose>
        <xsl:when test="$lang='en'">
          (<xsl:value-of select="substring(@date,6,2)"/>/<xsl:value-of select="substring(@date,9,2)"/>/<xsl:value-of select="substring(@date,1,4)"/>)
        </xsl:when>
        <xsl:when test="$lang='fr'">
          (<xsl:value-of select="substring(@date,9,2)"/>/<xsl:value-of select="substring(@date,6,2)"/>/<xsl:value-of select="substring(@date,1,4)"/>)
        </xsl:when>
        <xsl:when test="$lang='de'">
          (<xsl:value-of select="substring(@date,6,2)"/>/<xsl:value-of select="substring(@date,9,2)"/>/<xsl:value-of select="substring(@date,1,4)"/>)
        </xsl:when>
      </xsl:choose>
    </xsl:if>
    ...
  </h4>
  <xsl:if test="content[@lang=$lang]/node()">
    <div class="p">
      <xsl:apply-templates select="content[@lang=$lang]"/>
    </div>
  </xsl:if>
  <xsl:apply-templates select="description"/>
  <xsl:apply-templates select="download"/>
  <xsl:apply-templates select="use"/>
</xsl:template>

<xsl:template match="description">
  <div class="dldesc">
    <div class="dldescicon">
      <img alt="illustration of this download section">
        <xsl:attribute name="src"><xsl:value-of select="@img"/></xsl:attribute>
      </img>
     </div>
     <div class="dldesctext">
       <xsl:apply-templates/>
     </div>
   </div>
</xsl:template>

<xsl:template match="version">
  <xsl:param name="version"/>
  <xsl:value-of select="$version"/>
</xsl:template>
<xsl:template match="version" mode="raw">
  <xsl:param name="version"/>
  <xsl:value-of select="$version"/>
</xsl:template>

<xsl:template match="lang-names"/>
<xsl:template match="lang">
  <xsl:param name="file"/>
  <xsl:apply-templates select="/article/lang-names[@lang=$lang]/lang-name[@code=$file/lang]"/>
</xsl:template>
<xsl:template match="lang" mode="raw">
  <xsl:param name="file"/>
  <xsl:value-of select="$file/lang"/>
</xsl:template>

<xsl:template match="arch-names"/>
<xsl:template match="arch">
  <xsl:param name="file"/>
  <xsl:apply-templates select="/article/arch-names/arch-name[@code=$file/arch]"/>
</xsl:template>
<xsl:template match="arch" mode="raw">
  <xsl:param name="file"/>
  <xsl:value-of select="$file/arch"/>
</xsl:template>

<xsl:template match="size-names"/>
<xsl:template match="size">
  <xsl:param name="file"/>
  <xsl:choose>
    <xsl:when test="$file/size &lt; 1024">
      <xsl:value-of select="$file/size"/>
      <xsl:text> </xsl:text>
      <xsl:apply-templates select="/article/size-names[@lang=$lang]/size-name[@code='B']"/>
    </xsl:when>
    <xsl:when test="$file/size &lt; 1024*1024">
      <xsl:value-of select="round($file/size div 1024)"/>
      <xsl:text> </xsl:text>
      <xsl:apply-templates select="/article/size-names[@lang=$lang]/size-name[@code='K']"/>
    </xsl:when>
    <xsl:otherwise>
      <xsl:value-of select="round($file/size * 10 div (1024*1024)) div 10"/>
      <xsl:text> </xsl:text>
      <xsl:apply-templates select="/article/size-names[@lang=$lang]/size-name[@code='M']"/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template match="md5">
  <xsl:param name="file"/>
  <xsl:value-of select="$file/md5"/>
</xsl:template>

<xsl:template match="sha1">
  <xsl:param name="file"/>
  <xsl:value-of select="$file/sha1"/>
</xsl:template>

<xsl:template match="src-type-names"/>
<xsl:template match="src-type">
  <xsl:param name="file"/>
  <xsl:apply-templates select="/article/src-type-names[@lang=$lang]/src-type-name[@code=$file/src-type]"/>
</xsl:template>
<xsl:template match="src-type" mode="raw">
  <xsl:param name="file"/>
  <xsl:value-of select="$file/src-type"/>
</xsl:template>

<xsl:template match="src-ext">
  <xsl:param name="file"/>
  <xsl:value-of select="$file/src-ext"/>
</xsl:template>
<xsl:template match="src-ext" mode="raw">
  <xsl:param name="file"/>
  <xsl:value-of select="$file/src-ext"/>
</xsl:template>

<xsl:template match="download">
  <xsl:variable name="type" select="@type"/>
  <xsl:variable name="full" select="@full"/>
  <xsl:variable name="title" select="title"/>
  <xsl:variable name="description" select="description"/>
  <xsl:variable name="file" select="file"/>
  <xsl:variable name="plus" select="@plus"/>
  <xsl:variable name="minus" select="@minus"/>
  <xsl:variable name="files" select="document('files.xml')/files"/>
  <xsl:variable name="version" select="$files/@current_version"/>
  <xsl:for-each select="$files/file[@type = $type]">
    <xsl:variable name="id">
      <xsl:if test="lang"><xsl:value-of select="lang"/>.</xsl:if>
      <xsl:if test="arch"><xsl:value-of select="arch"/>.</xsl:if>
      <xsl:if test="src-type"><xsl:value-of select="src-type"/>.</xsl:if>
      <xsl:value-of select="$type"/>
    </xsl:variable>
    <div class="download">
      <div class="dlplusminus">
        <a>
          <xsl:attribute name="id">plus.<xsl:value-of select="$id"/></xsl:attribute>
          <xsl:attribute name="href">javascript:toggle('<xsl:value-of select="$id"/>','plus.<xsl:value-of select="$id"/>','minus.<xsl:value-of select="$id"/>')</xsl:attribute>
          <img alt="[+]">
            <xsl:attribute name="src">
              <xsl:value-of select="$plus"/>
            </xsl:attribute>
          </img>
        </a>

        <a>
          <xsl:attribute name="id">minus.<xsl:value-of select="$id"/></xsl:attribute>
          <xsl:attribute name="style">display: none</xsl:attribute>
          <xsl:attribute name="href">javascript:toggle('<xsl:value-of select="$id"/>','minus.<xsl:value-of select="$id"/>','plus.<xsl:value-of select="$id"/>')</xsl:attribute>
          <img alt="[-]">
            <xsl:attribute name="src">
              <xsl:value-of select="$minus"/>
            </xsl:attribute>
          </img>
        </a>
      </div>
      <div class="dlfile">
        <b>
          <xsl:apply-templates select="$title/node()">
            <xsl:with-param name="version" select="$version"/>
            <xsl:with-param name="file" select="."/>
          </xsl:apply-templates>
        </b>

        <div style="display: none">
          <xsl:attribute name="id"><xsl:value-of select="$id"/></xsl:attribute>
          <xsl:apply-templates select="$description/node()">
            <xsl:with-param name="version" select="$version"/>
            <xsl:with-param name="file" select="."/>
          </xsl:apply-templates>
          <xsl:call-template name="mirror">
            <xsl:with-param name="file">
              <xsl:apply-templates select="$file/node()" mode="raw">
                <xsl:with-param name="version" select="$version"/>
                <xsl:with-param name="file" select="."/>
              </xsl:apply-templates>
            </xsl:with-param>
            <xsl:with-param name="full" select="$full"/>
          </xsl:call-template>
        </div>
      </div>
    </div>
  </xsl:for-each>
</xsl:template>

<xsl:template name="mirror">
  <xsl:param name="file"/>
  <xsl:param name="full"/>
  <xsl:variable name="mirrors" select="document('mirrors.xml')/mirrors"/>

  <div class="dltable">
    <xsl:apply-templates select="$mirrors/mirror[not($full) or $full != 'yes' or not(@partial) or @partial != 'yes']">
      <xsl:with-param name="file" select="$file"/>
    </xsl:apply-templates>
  </div>
</xsl:template>
<xsl:template match="mirror">
  <xsl:param name="file"/>
  <div>
    <xsl:attribute name="class">row<xsl:value-of select="(position()+1) mod 2"/></xsl:attribute>
    <img>
      <xsl:attribute name="src">../img/flag-<xsl:value-of select="country"/>.png</xsl:attribute>
      <xsl:attribute name="alt"><xsl:value-of select="country"/></xsl:attribute>
    </img>
    <a>
      <xsl:attribute name="href"><xsl:value-of select="url"/>releases/<xsl:value-of select="$file"/></xsl:attribute>
      <xsl:value-of select="description"/>
    </a>
  </div>
</xsl:template>

<xsl:template match="center">
  <div class="center">
    <xsl:apply-templates/>
  </div>
</xsl:template>

<xsl:template match="page">
  <xsl:variable name="page" select="@name"/>
  <xsl:variable name="menu" select="document('menu.xml')/menu"/>
  <a>
    <xsl:attribute name="href">
      <xsl:value-of select="$menu/item/subitem[@name=$page]/@url"/>
    </xsl:attribute>
    <xsl:value-of select="$menu/item/subitem[@name=$page]/text[@lang=$lang]"/>
  </a>
</xsl:template>


<xsl:template match="/style"><xsl:call-template name="style"/></xsl:template>
<xsl:template name="style">
  <xsl:variable name="style" select="document('style.xml')/style"/>
  <div id="styles">
    <h4><xsl:value-of select="$style/content[@lang=$lang]/@title"/></h4>
    <ul>
      <xsl:for-each select="$style/stylesheet">
        <li>
          <a href="#">
            <xsl:attribute name="onclick">setActiveStyleSheet('<xsl:apply-templates/>'); return false;</xsl:attribute>
            <xsl:apply-templates/>
          </a>
        </li>
      </xsl:for-each>
    </ul>
  </div>
</xsl:template>

<xsl:template name="stylesheet">
  <xsl:variable name="style" select="document('style.xml')/style"/>
  <xsl:for-each select="$style/stylesheet">
    <link type="text/css">
      <xsl:attribute name="rel">
        <xsl:choose>
          <xsl:when test="@default='yes'">stylesheet</xsl:when>
          <xsl:otherwise>alternate stylesheet</xsl:otherwise>
        </xsl:choose>
      </xsl:attribute>
      <xsl:attribute name="href"><xsl:value-of select="@file"/></xsl:attribute>
      <xsl:attribute name="media"><xsl:value-of select="@media"/></xsl:attribute>
      <xsl:attribute name="title"><xsl:apply-templates/></xsl:attribute>
    </link>
  </xsl:for-each>
</xsl:template>

<xsl:template match="/banner"><xsl:call-template name="banner"/></xsl:template>
<xsl:template name="banner">
  <xsl:variable name="banner" select="document('banner.xml')/banner"/>
  <div id="logo">
    <a>
      <xsl:attribute name="href">
        <xsl:value-of select="$banner/logo/@link"/>
      </xsl:attribute>
      <img>
        <xsl:attribute name="src">
          <xsl:value-of select="$banner/logo/@src"/>
        </xsl:attribute>
        <xsl:attribute name="alt">
          <xsl:value-of select="$banner/logo/@alt"/>
        </xsl:attribute>
        <xsl:attribute name="title">
          <xsl:value-of select="$banner/logo/@title"/>
        </xsl:attribute>
      </img>
    </a>
  </div>
  <div id="language">
    <ul>
      <xsl:for-each select="$banner/langs/text">
        <li>
          <a>
            <xsl:attribute name="href">../<xsl:value-of select="@lang"/>/<xsl:value-of select="$filename"/></xsl:attribute>
            <xsl:apply-templates/>
            <img>
              <xsl:attribute name="src">
                <xsl:value-of select="@flag"/>
              </xsl:attribute>
              <xsl:attribute name="alt">(<xsl:value-of select="@lang"/>)</xsl:attribute>
            </img>
          </a>
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
        <div>
          <xsl:attribute name="id"><xsl:value-of select="@id"/></xsl:attribute>
          <h2><xsl:value-of select="text[@lang=$lang]"/></h2>
          <ul>
          <xsl:for-each select="subitem">
            <li>
              <a>
                <xsl:attribute name="href">
                  <xsl:value-of select="@url"/>
                </xsl:attribute>
                <xsl:value-of select="text[@lang=$lang]"/>
              </a>
            </li>
          </xsl:for-each>
          </ul>
        </div>
      </xsl:for-each>
    </div>
  </div>
</xsl:template>

<xsl:template match="/ours"><xsl:call-template name="ours"/></xsl:template>
<xsl:template name="ours">
  <div id="ours">
    <xsl:apply-templates select="document('ours.xml')/ours/content[@lang=$lang]/node()"/>
    <xsl:call-template name="atom"/>
  </div>
</xsl:template>

<xsl:template name="atom">
  &#160;
  <xsl:variable name="atom" select="document('atom.xml')/atom"/>
  <a>
    <xsl:attribute name="href">http://geexbox.org/<xsl:value-of select="$lang"/>/news.xml</xsl:attribute>
    <xsl:attribute name="title">
      <xsl:value-of select="$atom/langs/text[@lang=$lang]"/>
    </xsl:attribute>
    <img><xsl:copy-of select="$atom/logo/@*"/></img>
  </a>
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
  <a href="http://validator.w3.org/check/referer">
    <xsl:if test="@title">
      <xsl:attribute name="title"><xsl:value-of select="@title"/></xsl:attribute>
    </xsl:if>XHTML 1.1</a>
</xsl:template>

<xsl:template match="css">
  <a href="http://jigsaw.w3.org/css-validator/check/referer">
    <xsl:if test="@title">
      <xsl:attribute name="title"><xsl:value-of select="@title"/></xsl:attribute>
    </xsl:if>CSS2</a>
</xsl:template>


<xsl:template match="@*|node()">
  <xsl:copy>
    <xsl:apply-templates select="@*|node()"/>
  </xsl:copy>
</xsl:template>

</xsl:stylesheet>
