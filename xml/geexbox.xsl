<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:include href="common.xsl"/>
<xsl:output method="xml" encoding="UTF-8"
            doctype-public="-//W3C//DTD XHTML 1.1//EN"
            doctype-system="http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd"
            indent="yes"/>

<xsl:template match="article">

  <html>
    <xsl:attribute name="xmlns">http://www.w3.org/1999/xhtml</xsl:attribute>
    <xsl:attribute name="xml:lang"><xsl:value-of select="$lang"/></xsl:attribute>

    <xsl:comment>
      This web site is (c) 2003-2009 Zores Benjamin
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
      <meta name="keywords" content="computer, OS, Linux, distribution, embedded, multimedia, HTPC, home, theater, LiveCD, movie, audio, video, media, center, MPlayer, standalone, player, free, software, open, source, mpeg, mp3, divx, xvid, matroska, ogg, vorbis, AC3, DTS, VCD, DVD, CD, TV, tuner, TVOut, ATI, nVidia, DXR3, WiFi, PC, UPnP, DLNA, h264, avc, vc1, hdtv, enna, busybox, uClibc, geexbox, geexbox.org"/>
      <link rel="alternate" type="application/atom+xml" title="GeeXboX news feed">
        <xsl:attribute name="href">http://geexbox.org/<xsl:value-of select="$lang"/>/news.xml</xsl:attribute>
      </link>
      <xsl:call-template name="stylesheet"/>
      <link rel="icon" type="images/png" href="../img/geexbox-icon.png"/>

      <!-- compliance patch for microsoft browsers
              http://code.google.com/p/ie7-js/
              http://ie7-js.googlecode.com/svn/version/2.0(beta)/IE8.js
        -->
      <xsl:text disable-output-escaping="yes"><![CDATA[
        <!--[if lt IE 8]>
          <script src="../style/IE8.js" type="text/javascript"></script>
        <![endif]-->]]>
      </xsl:text>

      <!-- Google Analytics stats -->
      <script type="text/javascript">
        var gaJsHost = (("https:" == document.location.protocol) ? "https://ssl." : "http://www.");
        document.write(unescape("%3Cscript src='" + gaJsHost + "google-analytics.com/ga.js' type='text/javascript'%3E%3C/script%3E"));
      </script>
      <script type="text/javascript">
        var pageTracker = _gat._getTracker("UA-3497964-1");
        pageTracker._initData();
        pageTracker._trackPageview();
      </script>

      <script type="text/javascript" src="../style/styleswitcher.js">
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
      <div class="spacer"><xsl:comment>spacer</xsl:comment></div>
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


</xsl:stylesheet>
