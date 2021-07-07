<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:mmd="http://www.met.no/schema/mmd"
                version="1.0">
<xsl:output method="xml" omit-xml-declaration="no" indent="yes"/>
   <!-- Identity transform -->
   <xsl:template match="@* | node()">
      <xsl:copy>
         <xsl:apply-templates select="@* | node()"/>
      </xsl:copy>
   </xsl:template>

   <xsl:template match="mmd:abstract">
      <xsl:copy-of select="."/>
      <xsl:text>&#xa;  </xsl:text>
      <mmd:metadata_status>Active</mmd:metadata_status>
   </xsl:template>

   <xsl:template match="mmd:collection">
      <mmd:collection>ADC</mmd:collection>
      <xsl:text>&#xa;  </xsl:text>
      <mmd:last_metadata_update><!-- lagd til-->
         <xsl:text>&#xa;    </xsl:text>
         <mmd:update>
            <xsl:text>&#xa;      </xsl:text>
            <mmd:datetime>2021-07-06T12:00:00Z</mmd:datetime>
            <xsl:text>&#xa;      </xsl:text>
            <mmd:type>Major modification</mmd:type>
            <xsl:text>&#xa;      </xsl:text>
            <mmd:note>Converting from MMD-2 to MMD-3</mmd:note>
            <xsl:text>&#xa;      </xsl:text>
         </mmd:update>
         <xsl:text>&#xa;    </xsl:text>
      </mmd:last_metadata_update><!-- lagd til-->
   </xsl:template>

   <xsl:template match="mmd:access_constraint">
      <xsl:copy>
         <xsl:text>Open</xsl:text>
      </xsl:copy>
   </xsl:template>

   <xsl:template match="mmd:related_dataset">

   </xsl:template>
   



</xsl:stylesheet>