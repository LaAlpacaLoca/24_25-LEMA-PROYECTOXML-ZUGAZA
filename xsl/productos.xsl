<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:variable name="tiendaXml" select="document('../xml/el_jardin_de_la_alpaca.xml')"/>
<xsl:template match="/">
<html>
    <head>
        <meta charset="UTF-8"/>
        <title>EL JARDÍN DE LA ALPACA</title>
        <link rel="stylesheet" href="../css/styles.css"/>
    </head>

    <body class="xsl">        
        <table> 
        <nav>       
        <caption>Todos los productos</caption>
        </nav>

            <tr>
                <th>Nombre</th>
                <th>Precio</th>
                <th>Ganancia</th>              
                <th>Marca</th>                
                <th>Imagen</th>
                <th>Stock</th>
                <th>Enlace</th>
            </tr>  
            <tbody>          
                <xsl:for-each select="$tiendaXml/tienda/productos/producto">
                    <tr>
                        <td><xsl:value-of select="nombre"/></td>
                        <td><xsl:value-of select="precio"/></td>
                        <td><xsl:value-of select="ganancia"/></td>
                        <td><xsl:value-of select="marca"/></td>
                        <td> 
                            <img src="{imagen}" alt ="imagen"><xsl:value-of select="nombre"/></img> 
                        </td>
                        <td><xsl:value-of select="stock"/></td>
                        <td>
                            <a target="blank" href="{enlace}">
                                <xsl:value-of select="nombre"/>
                            </a>
                        </td>
                    </tr>
                </xsl:for-each>
            </tbody>          
        </table>
    </body>

</html>

</xsl:template>
</xsl:stylesheet>