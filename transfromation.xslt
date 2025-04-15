<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    
    <xsl:output method="text"/>

    <xsl:template match="/">
        {
        "services": [
        <xsl:for-each select="data/service">
            <!-- Seřazení podle ceny -->
            <xsl:sort select="details/price" data-type="number" order="ascending"/>
            {
                "id": "<xsl:value-of select="id"/>",
                "name": "<xsl:value-of select="name"/>",
                "category": "<xsl:value-of select="details/category"/>",
                "price": {
                    "value": "<xsl:value-of select="details/price"/>",
                    "currency": "<xsl:value-of select="details/price/@currency"/>"
                },
                "duration": {
                    "value": "<xsl:value-of select="details/duration"/>",
                    "unit": "<xsl:value-of select="details/duration/@unit"/>"
                },
                "availability": "<xsl:value-of select="details/availability"/>",
                "priority": "<xsl:choose>
                    <xsl:when test="details/price &gt; 1000">Prémiová</xsl:when>
                    <xsl:otherwise>Standardní</xsl:otherwise>
                </xsl:choose>"
            }<xsl:if test="position()!=last()">,</xsl:if>
        </xsl:for-each>
        ]
        }
    </xsl:template>
</xsl:stylesheet>