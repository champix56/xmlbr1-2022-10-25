<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="text" encoding="UTF-8" indent="yes"/>
	<xsl:template match="/">date;idclient;somme
<xsl:for-each select="//facture">
<xsl:value-of select="@datefacture"/>;<xsl:value-of select="@idclient"/>;<xsl:value-of select="sum(.//stotligne)"/><xsl:text>
</xsl:text>
</xsl:for-each>	
	</xsl:template>
</xsl:stylesheet>
