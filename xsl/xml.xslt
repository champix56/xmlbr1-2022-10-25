<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
	<xsl:template match="facture[@type='Devis' or @type='devis']">
		<devis/>
	</xsl:template>
	<xsl:template match="facture">
		<facture>
			<prixMoyenArticle>
				<xsl:value-of select="sum(.//stotligne) div count (.//stotligne)"/>
			</prixMoyenArticle>
		</facture>
	</xsl:template>
	<xsl:template match="/">
		<facturation>
			<xsl:apply-templates select="//facture"/>
		</facturation>
	</xsl:template>
</xsl:stylesheet>
