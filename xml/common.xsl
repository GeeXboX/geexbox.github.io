<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:param name="lang">en</xsl:param>
<xsl:param name="filename"></xsl:param>

<xsl:template match="define|content|lang-name|arch-name|size-name|src-type-name">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="use">
  <xsl:variable name="use-name"><xsl:value-of select="@name"/></xsl:variable>
  <xsl:apply-templates select="/article/define[@name=$use-name]"/>
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

<xsl:template match="libc" mode="raw">
  <xsl:param name="file"/>
  <xsl:if test="$file/libc">.<xsl:value-of select="$file/libc"/></xsl:if>
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
  <xsl:for-each select="$files/file[@type = $type]">
    <xsl:variable name="id">
      <xsl:if test="lang"><xsl:value-of select="lang"/>.</xsl:if>
      <xsl:if test="arch"><xsl:value-of select="arch"/>.</xsl:if>
      <xsl:if test="libc"><xsl:value-of select="libc"/>.</xsl:if>
      <xsl:if test="src-type"><xsl:value-of select="src-type"/>.</xsl:if>
      <xsl:value-of select="$type"/>
    </xsl:variable>
    <div class="download">
      <div class="dlplusminus">
        <a>
          <xsl:attribute name="href">javascript:toggle('<xsl:value-of select="$id"/>','plus.<xsl:value-of select="$id"/>','minus.<xsl:value-of select="$id"/>')</xsl:attribute>
          <img alt="[+]">
            <xsl:attribute name="id">plus.<xsl:value-of select="$id"/></xsl:attribute>
            <xsl:attribute name="src">
              <xsl:value-of select="$plus"/>
            </xsl:attribute>
          </img>
          <img alt="[-]" style="display: none">
            <xsl:attribute name="id">minus.<xsl:value-of select="$id"/></xsl:attribute>
            <xsl:attribute name="src">
              <xsl:value-of select="$minus"/>
            </xsl:attribute>
          </img>
        </a>
      </div>
      <div class="dlfile">
        <b>
          <xsl:apply-templates select="$title/node()">
            <xsl:with-param name="version" select="./version"/>
            <xsl:with-param name="file" select="."/>
          </xsl:apply-templates>
        </b>

        <div style="display: none">
          <xsl:attribute name="id"><xsl:value-of select="$id"/></xsl:attribute>
          <xsl:apply-templates select="$description/node()">
            <xsl:with-param name="version" select="./version"/>
            <xsl:with-param name="file" select="."/>
          </xsl:apply-templates>
          <xsl:call-template name="mirror">
            <xsl:with-param name="file">
              <xsl:apply-templates select="$file/node()" mode="raw">
                <xsl:with-param name="version" select="./version"/>
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
      <xsl:copy-of select="@media"/>
      <xsl:attribute name="title"><xsl:apply-templates/></xsl:attribute>
    </link>
  </xsl:for-each>
</xsl:template>

<xsl:template match="logo">
  <div id="logo">
    <a>
      <xsl:attribute name="href">
        <xsl:value-of select="@link"/>
      </xsl:attribute>
      <img><xsl:copy-of select="@src|@alt|@title"/></img>
    </a>
  </div>
</xsl:template>

<xsl:template match="/banner"><xsl:call-template name="banner"/></xsl:template>
<xsl:template name="banner">
  <xsl:variable name="banner" select="document('banner.xml')/banner"/>
  <xsl:apply-templates select="$banner/logo"/>
</xsl:template>

<xsl:template match="/menu"><xsl:call-template name="menu"/></xsl:template>
<xsl:template name="menu">
  <div id="menubox">
    <ul class="menu">
      <xsl:variable name="menu" select="document('menu.xml')/menu"/>
      <xsl:for-each select="$menu/item">
        <li>
          <xsl:value-of select="text[@lang=$lang]"/>
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
        </li>
      </xsl:for-each>
    </ul>
    <div id="endmenu">
      <img align="top" width="100%" height="10" src="../img/bottom_shadow.png" alt="bottom_shadow"/>
    </div>
  </div>
</xsl:template>

<xsl:template match="/infobar"><xsl:call-template name="infobar"/></xsl:template>
<xsl:template name="infobar">
  <div id="infobar">
    <xsl:variable name="releases" select="document('releases.xml')/releases"/>
    <xsl:for-each select="$releases/release">
      <a>
        <xsl:attribute name="href">
          <xsl:value-of select="url"/>
        </xsl:attribute>
        <xsl:attribute name="class">
          <xsl:value-of select="@type"/>
        </xsl:attribute>

        <strong><xsl:value-of select="title"/></strong>
        <em><xsl:value-of select="type"/></em>
        <em><xsl:value-of select="version"/></em>
      </a>
    </xsl:for-each>

    <div id="side_projects">
      <xsl:variable name="projects" select="document('sideprojects.xml')/projects"/>
      <h1><xsl:value-of select="$projects/@title"/></h1>
      <xsl:for-each select="$projects/project">
        <a>
          <xsl:attribute name="href">
            <xsl:value-of select="@url"/>
          </xsl:attribute>
          <xsl:value-of select="@name"/>
        </a>
        <br/>
      </xsl:for-each>
    </div>

    <div id="ohloh_stats">
      <script type="text/javascript" src="http://www.ohloh.net/p/480683/widgets/project_partner_badge.js"></script>
    </div>

    <div id="donate">
      <a href="donate.html">
        <img src="http://www.paypal.com/en_US/i/btn/x-click-butcc-donate.gif" alt="Donate" title="Make payments with PayPal - it's fast, free and secure!"/>
      </a>
    </div>

    <div id="adsense_v">
<!-- Google AdSense -->
<xsl:text disable-output-escaping="yes"><![CDATA[
<script type="text/javascript"><!--
google_ad_client = "pub-8177632591767420";
google_ad_slot = "1442020070";
google_ad_width = 160;
google_ad_height = 600;
//-->
</script>
<script type="text/javascript"
src="http://pagead2.googlesyndication.com/pagead/show_ads.js">
</script>
]]></xsl:text>
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

<xsl:template match="email">
  <xsl:call-template name="email">
    <xsl:with-param name="id" select="@id"/>
    <xsl:with-param name="title" select="node()"/>
  </xsl:call-template>
</xsl:template>
<xsl:template name="email">
  <xsl:param name="id"/>
  <xsl:param name="title"/>
  <xsl:variable name="emails" select="document('emails.xml')/emails"/>
  <xsl:choose>
    <xsl:when test="$emails/email[@id=$id]">
      <!-- The <a> tag is made in hand, to keep real format of address mail -->
      <xsl:text disable-output-escaping="yes"><![CDATA[<a href="mailto:]]></xsl:text>
      <xsl:value-of select="$emails/email[@id=$id]/address/node()" disable-output-escaping="yes"/>
      <xsl:text disable-output-escaping="yes"><![CDATA[">]]></xsl:text>
      <!-- <a> -->
        <xsl:choose>
          <xsl:when test="$title">
            <xsl:value-of select="$title"/>
          </xsl:when>
          <xsl:otherwise>
            <xsl:apply-templates select="$emails/email[@id=$id]/content"/>
          </xsl:otherwise>
        </xsl:choose>
      <!-- </a> -->
      <xsl:text disable-output-escaping="yes"><![CDATA[</a>]]></xsl:text>
    </xsl:when>
    <xsl:otherwise>
      <xsl:value-of select="$title"/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template match="webmaster">
  <xsl:call-template name="email">
    <xsl:with-param name="id">webmaster</xsl:with-param>
  </xsl:call-template>
</xsl:template>

<xsl:template match="users">
  <b>
  <xsl:call-template name="email">
    <xsl:with-param name="id">users</xsl:with-param>
  </xsl:call-template>
  </b>
</xsl:template>

<xsl:template match="devel">
  <b>
  <xsl:call-template name="email">
    <xsl:with-param name="id">devel</xsl:with-param>
  </xsl:call-template>
  </b>
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
