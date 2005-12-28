<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="text" encoding="UTF-8"/>

<xsl:template match="/banner">
  <xsl:for-each select="langs/text"><xsl:value-of select="@lang"/>|</xsl:for-each>
</xsl:template>

</xsl:stylesheet>
