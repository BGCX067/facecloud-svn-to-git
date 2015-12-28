<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="2.0"
    xmlns:atom="http://www.w3.org/2005/Atom"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output encoding="utf-8" indent="no" method="html" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd" />
	
    <!-- supress default text node output 
    <xsl:template match="text()"/>-->

	<xsl:template match="*"/>

	<xsl:template match="atom:feed">
	    
	    <xsl:apply-templates/>
  	</xsl:template>

    <xsl:template match="atom:entry">
	    <a href="{atom:link/@href}">
	    	<h2><xsl:value-of select="atom:title" disable-output-escaping="yes" /></h2>
	    </a>
	
	    <xsl:value-of select="atom:content" disable-output-escaping="yes"/>
    </xsl:template>
</xsl:stylesheet>