<?xml version='1.0' encoding='UTF-8'?>

<xsl:stylesheet version="3.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:xs="http://www.w3.org/2001/XMLSchema"
	xmlns:fn="http://www.w3.org/2005/xpath-functions"
	xmlns:xdt="http://www.w3.org/2005/xpath-datatypes"
	xmlns:err="http://www.w3.org/2005/xqt-errors"
	exclude-result-prefixes="xs xdt err fn">
	<xsl:template match="/">
		<xsl:apply-templates select="mathml"/>
	</xsl:template>

	<xsl:template match="expression_type">
	</xsl:template>

	<xsl:template match="msub">
		<xsl:apply-templates select="mrow"/>
		<xsl:value-of select="mi/text()"/>
	</xsl:template>

	<xsl:template match="mn">
		<xsl:value-of select="/text()"/>
	</xsl:template>

	<xsl:template match="types">
		<xsl:apply-templates select="expression_type"/>
	</xsl:template>

	<xsl:template match="mo">
		<xsl:value-of select="/text()"/>
	</xsl:template>

	<xsl:template match="mtr">
		<xsl:apply-templates select="mtd"/>
	</xsl:template>

	<xsl:template match="mfrac">
		<xsl:apply-templates select="mrow"/>
		<xsl:value-of select="mn/text()"/>
	</xsl:template>
	
	<xsl:template match="expression">
		<xsl:apply-templates select="math"/>
	</xsl:template>

	<xsl:template match="mathml">
		<xsl:apply-templates select="types"/>
		<xsl:apply-templates select="math_expressions"/>
	</xsl:template>

	<xsl:template match="mspace">
	</xsl:template>

	<xsl:template match="munderover">
		<xsl:apply-templates select="mrow"/>
		<xsl:value-of select="mi/text()"/>
	</xsl:template>

	<xsl:template match="mtable">
		<xsl:apply-templates select="mtr"/>
	</xsl:template>

	<xsl:template match="msup">
		<xsl:apply-templates select="mrow"/>
		<xsl:value-of select="mn/text()"/>
	</xsl:template>

	<xsl:template match="mfenced">
		<xsl:apply-templates select="mtable"/>
		<xsl:apply-templates select="mfenced"/>
		<xsl:value-of select="mi/text()"/>
	</xsl:template>

	<xsl:template match="msqrt">
		<xsl:apply-templates select="mrow"/>
	</xsl:template>

	<xsl:template match="mroot">
		<xsl:apply-templates select="msup"/>
		<xsl:value-of select="mn/text()"/>
	</xsl:template>

	<xsl:template match="math">
		<xsl:apply-templates select="mspace"/>
		<xsl:apply-templates select="mrow"/>
	</xsl:template>

	<xsl:template match="mi">
		<xsl:value-of select="/text()"/>
	</xsl:template>

	<xsl:template match="mtd">
		<xsl:apply-templates select="msub"/>
		<xsl:value-of select="mn/text()"/>
	</xsl:template>

	<xsl:template match="mrow">
		<xsl:apply-templates select="msup"/>
		<xsl:apply-templates select="mfenced"/>
		<xsl:apply-templates select="msqrt"/>
		<xsl:apply-templates select="mroot"/>
		<xsl:apply-templates select="mfrac"/>
		<xsl:apply-templates select="mrow"/>
		<xsl:apply-templates select="munderover"/>
		<xsl:value-of select="mi/text()"/>
	</xsl:template>

	<xsl:template match="math_expressions">
		<xsl:apply-templates select="expression"/>
	</xsl:template>

</xsl:stylesheet>