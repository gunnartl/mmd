<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:mmd="http://www.met.no/schema/mmd"
                xmlns:str="http://exslt.org/strings"
                version="1.0">
<xsl:output method="xml" omit-xml-declaration="no" indent="yes"/>
   <!-- Identity transform -->
   <xsl:template match="@* | node()">
      <xsl:copy>
         <xsl:apply-templates select="@* | node()"/>
      </xsl:copy>
      <xsl:if test="not(mmd:metadata_status)">
            <xsl:copy-of select="mmd:abstract"/>
            <xsl:text>&#xa;</xsl:text>
            <mmd:metadata_status>Active</mmd:metadata_status>
      </xsl:if>
   </xsl:template>
   
   <xsl:template match="/">
      <xsl:if test="not(mmd:metadata_status)">
            <xsl:copy-of select="mmd:abstract"/>
            <xsl:text>&#xa;</xsl:text>
            <mmd:metadata_status>Active</mmd:metadata_status>
      </xsl:if>
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
   <xsl:template match="mmd:iso_topic_category">
      <xsl:element name ="mmd:iso_topic_category">
         <xsl:choose>
            <xsl:when test=". ='ClimatologyMeteorologyAtmosphere'">
               <xsl:text>climatologyMeteorologyAtmosphere</xsl:text>
            </xsl:when>
            <xsl:otherwise>
               <xsl:value-of select="."/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:element>
   </xsl:template>

   <xsl:template match="mmd:resource">
      <xsl:element name= "mmd:resource">
         <xsl:value-of select="str:replace(.,'http:','https:')"/>
      </xsl:element>
   </xsl:template>

   <xsl:template match="mmd:related_dataset">

   </xsl:template>
   



</xsl:stylesheet>