<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="text" encoding="UTF-8" indent="no"/>

  <xsl:template match="/">
    <xsl:text>{ "services": [</xsl:text>
    <xsl:for-each select="services/service">
      <xsl:sort select="name"/>
      <xsl:if test="position() &gt; 1">,</xsl:if>
      <xsl:text>{</xsl:text>
        <xsl:text>"id": "</xsl:text><xsl:value-of select="@id"/><xsl:text>",</xsl:text>
        <xsl:text>"type": "</xsl:text><xsl:value-of select="@type"/><xsl:text>",</xsl:text>
        <xsl:text>"name": "</xsl:text><xsl:value-of select="name"/><xsl:text>",</xsl:text>
        <xsl:text>"category": "</xsl:text><xsl:value-of select="details/category"/><xsl:text>",</xsl:text>
        <xsl:text>"duration": { "value": "</xsl:text><xsl:value-of select="details/duration"/><xsl:text>", "unit": "</xsl:text><xsl:value-of select="details/duration/@unit"/><xsl:text>" },</xsl:text>
        <xsl:text>"price": { "value": "</xsl:text><xsl:value-of select="details/price"/><xsl:text>", "currency": "</xsl:text><xsl:value-of select="details/price/@currency"/><xsl:text>" },</xsl:text>
        <xsl:text>"specialist": {</xsl:text>
          <xsl:text>"name": "</xsl:text><xsl:value-of select="details/specialist/name"/><xsl:text>",</xsl:text>
          <xsl:text>"email": "</xsl:text><xsl:value-of select="details/specialist/email"/><xsl:text>",</xsl:text>
          <xsl:text>"phone": "</xsl:text><xsl:value-of select="details/specialist/phone"/><xsl:text>",</xsl:text>
          <xsl:text>"available": </xsl:text><xsl:choose>
            <xsl:when test="details/specialist/available = 'true'">true</xsl:when>
            <xsl:otherwise>false</xsl:otherwise>
          </xsl:choose><xsl:text>,</xsl:text>
          <xsl:text>"language": "</xsl:text><xsl:value-of select="details/specialist/language"/><xsl:text>",</xsl:text>
          <xsl:text>"experience": { "years": "</xsl:text><xsl:value-of select="details/specialist/experience/@years"/><xsl:text>", "field": "</xsl:text><xsl:value-of select="details/specialist/experience"/><xsl:text>" }</xsl:text>
        <xsl:text>},</xsl:text>
        <xsl:text>"location": {</xsl:text>
          <xsl:text>"city": "</xsl:text><xsl:value-of select="details/location/city"/><xsl:text>",</xsl:text>
          <xsl:text>"street": "</xsl:text><xsl:value-of select="details/location/street"/><xsl:text>",</xsl:text>
          <xsl:text>"room": { "number": "</xsl:text><xsl:value-of select="details/location/room/@number"/><xsl:text>", "name": "</xsl:text><xsl:value-of select="details/location/room"/><xsl:text>" }</xsl:text>
        <xsl:text>}</xsl:text>
      <xsl:text>}</xsl:text>
    </xsl:for-each>
    <xsl:text>]}</xsl:text>
  </xsl:template>
</xsl:stylesheet>
