<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:variable name="tiendaXml" select="document('../xml/el_jardin_de_la_alpaca.xml')"/>
<xsl:variable name="iva" select="$tiendaXml/tienda/iva"/>
<xsl:template match="/">
<html>
    <head>
        <meta charset="UTF-8"/>
        <title>EL JARDÍN DE LA ALPACA</title>
        <link rel="stylesheet" href="../css/styles.css"/>
    </head>

    <body class="xsl">     

        <nav class="menu">
            <p class="logo">EL JARDÍN DE LA ALPACA</p>
            <input type="checkbox" id="menu-toggle" />
            <label for="menu-toggle" class="menu-icon">&#9776;</label>
            <ul>
                <li><a href="../index.html">Página Principal</a></li>
				<li><a href="servicios.xml">Servicios</a></li>
				<li><a href="#">Productos</a></li>
				<li><a href="../portfolio/contacto.html">Contacto</a></li>
            </ul>
        </nav>   

        <div class="contador">
            <p>Total de productos en el catálogo: 
                <xsl:value-of select="count($tiendaXml/tienda/productos/producto)"/>
            </p>
        </div>

            
        <table> 

            <tr>
                <th>Nombre</th>
                <th>Precio</th>
                <th>Precio + IVA</th>  
                <th>Precio + IVA - Descuento</th>            
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
                        <td><xsl:value-of select="precio + (precio * $iva div 100)"/></td>
                        <td><xsl:value-of select="precio + (precio * $iva div 100) - (precio * (descuento div 100))"/></td>
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
        <footer> 2025 Koldo, Unai, Nichita, Joshua, todos los derechos reservados.</footer>
    </body>

</html>

</xsl:template>
</xsl:stylesheet>