<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:output method="text" encoding="UTF-8" indent="no"/>

  <xsl:template match="/">
    {
      "services": [
        <xsl:for-each select="services/service">
          <xsl:sort select="name" data-type="text" order="ascending"/>
          {
            "id": "<xsl:value-of select="@id"/>",
            "type": "<xsl:value-of select="@type"/>",
            "typeDescription": "<xsl:choose>
              <xsl:when test="@type = 'poradenstvi'">Poradenská služba</xsl:when>
              <xsl:when test="@type = 'rehabilitace'">Rehabilitační péče</xsl:when>
              <xsl:when test="@type = 'diagnostika'">Diagnostická služba</xsl:when>
              <xsl:when test="@type = 'psychologie'">Psychologická péče</xsl:when>
              <xsl:otherwise>Jiný typ</xsl:otherwise>
            </xsl:choose>",
            "name": "<xsl:value-of select="name"/>",
            "category": "<xsl:value-of select="details/category"/>",
            "duration": {
              "value": "<xsl:value-of select="details/duration"/>",
              "unit": "<xsl:value-of select="details/duration/@unit"/>"
            },
            "price": {
              "value": "<xsl:value-of select="details/price"/>",
              "currency": "<xsl:value-of select="details/price/@currency"/>"
            },
            "specialist": {
              "name": "<xsl:value-of select="details/specialist/name"/>",
              "experience": {
                "years": "<xsl:value-of select="details/specialist/experience/@years"/>",
                "field": "<xsl:value-of select="details/specialist/experience"/>"
              }
            },
            "location": {
              "city": "<xsl:value-of select="details/location/city"/>",
              "street": "<xsl:value-of select="details/location/street"/>",
              "room": {
                "number": "<xsl:value-of select="details/location/room/@number"/>",
                "name": "<xsl:value-of select="details/location/room"/>"
              }
            }
          }<xsl:if test="position()!=last()">,</xsl:if>
        </xsl:for-each>
      ]
    }
  </xsl:template>

</xsl:stylesheet>
