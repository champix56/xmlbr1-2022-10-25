<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<xsl:template match="/">
		<fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">
			<!--formats de papier-->
			<fo:layout-master-set>
				<fo:simple-page-master master-name="a4Portrait" page-height="297mm" page-width="21cm">
					<fo:region-body margin-top="1cm"/>
					<fo:region-before extent="1cm"/>
				</fo:simple-page-master>
			</fo:layout-master-set>
			<!--du/des sequences-->
			<xsl:call-template name="sommaire"/>
			<fo:page-sequence master-reference="a4Portrait">
				<fo:static-content flow-name="xsl-region-before">
					<fo:block text-align="center" font-weight="900" font-size="7mm" color="tomato">
						<xsl:value-of select="/photos/titre"/>
					</fo:block>
				</fo:static-content>
				<fo:flow flow-name="xsl-region-body">
					<fo:block>
						<xsl:apply-templates select="//page"/>
					</fo:block>
				</fo:flow>
			</fo:page-sequence>
		</fo:root>
	</xsl:template>
	<xsl:template match="page">
		<fo:block break-before="page" id="page-{position()}">
			<fo:table>
				<fo:table-body>
					<fo:table-row>
						<xsl:for-each select=".//image[position() &lt;= 2]">
							<fo:table-cell>
								<fo:block text-align="center">
									<fo:external-graphic src="{@path}{@href}" scaling="uniform" content-height="98mm" content-width="98mm"/>
									<fo:block/>
									<xsl:value-of select="."/>
								</fo:block>
							</fo:table-cell>
						</xsl:for-each>
					</fo:table-row>
					<xsl:if test="count(.//image)>2">
						<fo:table-row>
							<xsl:for-each select=".//image[position()>2]">
								<fo:table-cell>
									<fo:block text-align="center">
										<fo:external-graphic src="{@path}{@href}" scaling="uniform" content-height="98mm" content-width="98mm"/>
										<fo:block/>
										<xsl:value-of select="."/>
									</fo:block>
								</fo:table-cell>
							</xsl:for-each>
						</fo:table-row>
					</xsl:if>
				</fo:table-body>
			</fo:table>
		</fo:block>
	</xsl:template>
	<xsl:template name="sommaire">
		<fo:page-sequence master-reference="a4Portrait">
			<fo:flow flow-name="xsl-region-body">
				<fo:block>
					<fo:list-block>
						<xsl:apply-templates select="//page" mode="sommaire"/>
					</fo:list-block>
				</fo:block>
			</fo:flow>
		</fo:page-sequence>
	</xsl:template>
	<xsl:template match="page" mode="sommaire">
		<fo:list-item>
			<fo:list-item-label>
				<fo:block/>
			</fo:list-item-label>
			<fo:list-item-body>
				<fo:block>
					<fo:basic-link internal-destination="page-{position()}">
						<xsl:for-each select=".//image">
							<xsl:value-of select="@href"/>, </xsl:for-each>
						<fo:page-number-citation ref-id="page-{position()}"/>
					</fo:basic-link>
				</fo:block>
			</fo:list-item-body>
		</fo:list-item>
	</xsl:template>
</xsl:stylesheet>
