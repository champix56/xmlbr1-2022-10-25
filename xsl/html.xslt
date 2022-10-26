<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet [
	<!ENTITY nbsp "&#160;">
]>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml">
	<xsl:output method="xml" encoding="UTF-8" indent="yes"/>
	<xsl:template match="/clients/client">
		<xsl:value-of select="destinataire"/>
		<br/>
		<xsl:value-of select="adr1"/>
		<br/>
		<xsl:value-of select="cp"/>&nbsp;
		<xsl:value-of select="ville"/>
	</xsl:template>
	<xsl:template name="total">
		<xsl:param name="nodes" select="."/>
		<tr>
			<th colspan="4">&nbsp;</th>
			<th style="text-align:right;">Total</th>
			<th style="">
				<xsl:value-of select="sum($nodes//stotligne)"/>
			</th>
		</tr>
	</xsl:template>
	<xsl:template match="ligne[not(surface)]/designation" priority="1">
		<td>
			<xsl:value-of select="."/> DES</td>
		<td>&nbsp;</td>
	</xsl:template>
	<xsl:template match="ligne/*">
		<td>
			<xsl:value-of select="."/>
		</td>
	</xsl:template>
	<xsl:template match="lignes/ligne">
		<tr>
			<xsl:apply-templates select="*"/>
		</tr>
	</xsl:template>
	<xsl:template match="facture/lignes">
		<table border="1">
			<thead>
				<tr>
					<th>ref</th>
					<th>design.</th>
					<th>surface</th>
					<th>€/U.</th>
					<th>quant.</th>
					<th>s-Total</th>
				</tr>
			</thead>
			<tbody>
				<xsl:apply-templates select="ligne"/>
				<xsl:call-template name="total"/>
			</tbody>
		</table>
	</xsl:template>
	<xsl:template match="@numfacture">
		<div style="border:1px solid black">
			<xsl:choose>
				<xsl:when test="contains(../@type,'evis')">Devis</xsl:when>
				<xsl:otherwise>Facture</xsl:otherwise>
			</xsl:choose>
		N° <xsl:value-of select="."/>
		</div>
	</xsl:template>
	<xsl:template match="facture">
		<div class="facture">
			<div class="emeteur">
				<xsl:value-of select="/factures/@rsets"/>
				<br/>
				<xsl:value-of select="/factures/@adr1ets"/>
				<br/>
				<xsl:value-of select="/factures/@cpets"/>                     &nbsp;                   <xsl:value-of select="/factures/@villeets"/>
			</div>
			<div class="destinataire">
				<!--<xsl:variable name="idc" select="@idclient"/>
				<xsl:variable name="docclient" select="document('../clients.xml')/clients/client[@id=$idc]"/>
				--><!--				<xsl:copy-of select="$docclient"/>--><!--
				<xsl:apply-templates select="$docclient"/>-->
			</div>
			<xsl:apply-templates select="@numfacture"/>
			<xsl:apply-templates select="lignes"/>
		</div>
	</xsl:template>
	<xsl:template match="/">
		<html xmlns="http://www.w3.org/1999/xhtml">
			<head>
				<title/>
			</head>
			<body>
				<table>
					<tbody>
						<xsl:call-template name="total">
							<xsl:with-param name="nodes" select="//facture[contains(@type,'evis')]"/>
						</xsl:call-template>
					</tbody>
				</table>
				<hr/>
				<xsl:apply-templates select="//facture"/>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
