<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions" xmlns:cfdi="http://www.sat.gob.mx/cfd/3" xmlns:tfd="http://www.sat.gob.mx/TimbreFiscalDigital">
	<!-- Con el siguiente método se establece que la salida deberá ser en texto -->
	<xsl:output method="text" version="1.0" encoding="UTF-8" indent="no"/>
	<xsl:template name="Requerido">
		<xsl:param name="valor"/>|<xsl:call-template name="ManejaEspacios">
			<xsl:with-param name="s" select="$valor"/>
		</xsl:call-template>
	</xsl:template>
	<!-- Normalizador de espacios en blanco -->
	<xsl:template name="ManejaEspacios">
		<xsl:param name="s"/>
		<xsl:value-of select="normalize-space(string($s))"/>
	</xsl:template>
	<!-- Aquí iniciamos el procesamiento de la cadena original con su | inicial y el terminador || -->
	<xsl:template match="/cfdi:Comprobante">|<xsl:apply-templates select="cfdi:Complemento/tfd:TimbreFiscalDigital"/>||</xsl:template>
	<!--  Aquí iniciamos el procesamiento de los datos incluidos en el comprobante -->
	<xsl:template match="tfd:TimbreFiscalDigital">
		<!-- Iniciamos el tratamiento de los atributos del Timbre-->		
		<xsl:call-template name="Requerido">
			<xsl:with-param name="valor" select="./@version"/>
		</xsl:call-template>
		<xsl:call-template name="Requerido">
			<xsl:with-param name="valor" select="./@UUID"/>
		</xsl:call-template>
		<xsl:call-template name="Requerido">
			<xsl:with-param name="valor" select="./@FechaTimbrado"/>
		</xsl:call-template>
		<xsl:call-template name="Requerido">
			<xsl:with-param name="valor" select="./@selloCFD"/>
		</xsl:call-template>
		<xsl:call-template name="Requerido">
			<xsl:with-param name="valor" select="./@noCertificadoSAT"/>
		</xsl:call-template>
	</xsl:template>
</xsl:stylesheet>
