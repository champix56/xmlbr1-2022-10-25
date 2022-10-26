<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="xml" encoding="UTF-8" indent="yes"/>
	<xsl:template match="/">
		<html xmlns="http://www.w3.org/1999/xhtml" >
			<head>
				<title></title>
			</head>
			<body>
				<div class="facture">
					<div class="emeteur"></div>
					<div class="destinataire"></div>
					<div class="num"></div>
					<table>
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
							<tr>
								<th></th>
							</tr>
						</tbody>
					</table>
				</div>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
