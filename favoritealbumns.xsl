<?xml version="1.0" encoding="ISO-8859-1"?>         
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">   
<xsl:output method="html"/>
   
<xsl:template match = "/">  
	<html>
		<!-- css styles -->
		<body>
			<h2>Some good albumns</h2>
				<table border="1">
					<caption>Albumns</caption>
					<thread>
						<tr bgcolor="#9acd32">
							<th>Title</th>
							<th>Artist</th>
							<th>Year Released</th>
							<th>Years Since Release</th>
							<th>Genre</th>
							<th>Wiki</th>
							<th>Cover</th>
						</tr>
					</thread>
					<tbody>
						<xsl:apply-templates select="library/albumn">
							<xsl:sort select="year" order="descending" />
						</xsl:apply-templates>
					</tbody>
				</table>
		</body>
	</html>
</xsl:template>

<xsl:template match="albumn">
	<tr>
		<xsl:apply-templates select="title"/>
		<xsl:apply-templates select="author"/>
		<xsl:apply-templates select="year"/>
		<xsl:apply-templates select="genre[@elements]"/>
		<xsl:apply-templates select="links/overview[@type='general']"/>
		<xsl:apply-templates select="images"/>
	</tr>
</xsl:template>

<xsl:template match="title">
	<td>
		<xsl:value-of select="."/>
	</td>
</xsl:template>

<xsl:template match="author">
	<td>
		<xsl:value-of select="."/>
	</td>
</xsl:template>

<xsl:template match="year">
	<td>
		<xsl:value-of select="."/>
	</td>
	<td>
		<xsl:value-of select="2018 - ."/>
	</td>
</xsl:template>

<xsl:template match="genre">
	<td>
			<xsl:value-of select="."/>
			<xsl:text>: </xsl:text>
			<xsl:value-of select="./@elements"/>
			<xsl:text>&#xa;</xsl:text> <!-- supposed to break line??? -->
	</td>
</xsl:template>

<xsl:template match="links/overview[@type='general']">
	<td>
		<a>
			<xsl:attribute name="href">
				<xsl:value-of select="./@url"/>
			</xsl:attribute>
			<xsl:value-of select="."/>
		</a>
	</td>
</xsl:template>

<xsl:template match="images">
	<td>
		<xsl:attribute name="href">
			<xsl:value-of select="image/@url"/>
		</xsl:attribute>
		<img>
			<xsl:attribute name="src">
				<xsl:value-of select="image/@url"/>
			</xsl:attribute>
		</img>
	</td>
</xsl:template>

</xsl:stylesheet>