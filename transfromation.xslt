<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="html" encoding="UTF-8" indent="yes"/>

    <!-- Hlavní šablona -->
    <xsl:template match="/services">
        <html>
            <head>
                <title>Nabídka služeb</title>
                <style>
                    body { font-family: Arial; background: #f7f7f7; padding: 2em; }
                    .service { background: white; border-radius: 10px; padding: 1em; margin-bottom: 1em; box-shadow: 0 2px 5px rgba(0,0,0,0.1); }
                    h2 { margin-top: 0; }
                    .details { margin-top: 0.5em; color: #444; }
                    .location { font-style: italic; color: #666; }
                </style>
            </head>
            <body>
                <h1>Nabídka zdravotních služeb</h1>

                <xsl:for-each select="service">
                    <div class="service">
                        <h2><xsl:value-of select="name"/></h2>
                        <div class="details">
                            <strong>Kategorie:</strong> <xsl:value-of select="details/category"/><br/>
                            <strong>Cena:</strong> <xsl:value-of select="details/price"/> <xsl:value-of select="details/price/@currency"/><br/>
                            <strong>Doba trvání:</strong> <xsl:value-of select="details/duration"/> <xsl:value-of select="details/duration/@unit"/><br/>
                            <strong>Dostupnost:</strong> <xsl:value-of select="details/availability"/><br/>
                            <strong>Specializace:</strong> <xsl:value-of select="details/specialization"/><br/>
                            <strong>Hodnocení:</strong> <xsl:value-of select="details/rating"/> / 5<br/>
                            <div class="location">
                                <xsl:value-of select="details/location/street"/>, <xsl:value-of select="details/location/city"/>
                            </div>
                        </div>
                    </div>
                </xsl:for-each>
            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>
