<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:variable name="tiendaXml" select="document('../xml/el_jardin_de_la_alpaca.xml')"/>
<xsl:variable name="iva" select="$tiendaXml/tienda/iva"/>
<xsl:template match="/">
<html>
    <head>
        <meta charset="UTF-8"/>
        <title>EL JARDÍN DE LA ALPACA - Servicios</title>
        <link rel="stylesheet" href="../css/styles.css"/>
    </head>

    <body class="xsl">     

        <nav class="menu">
            <p class="logo">EL JARDÍN DE LA ALPACA</p>
            <input type="checkbox" id="menu-toggle" />
            <label for="menu-toggle" class="menu-icon">&#9776;</label>
            <ul>
                <li><a href="../index.html">Página Principal</a></li>
                <li><a href="#">Servicios</a></li>
                <li><a href="productos.xml">Productos</a></li>
                <li><a href="todos.xml">Todos</a></li>
                <li><a href="separados.xml">Separados</a></li>
                <li><a href="../portfolio/contacto.html">Contacto</a></li>
            </ul>
        </nav>   

        <div class="contador">
            <p>Total de servicios disponibles: 
                <xsl:value-of select="count($tiendaXml/tienda/servicios/servicio)"/>
            </p>
        </div>

        <table> 
            <tr>
                <th>Nombre</th>
                <th>Precio</th>
                <th>Precio + IVA</th>  
                <th>Descuento</th>  
                <th>Ganancia</th>            
                <th>Imagen</th>
                <th>Enlace</th>
            </tr>  
            <tbody>          
                <xsl:for-each select="$tiendaXml/tienda/servicios/servicio">
                    <tr>
                        <td><xsl:value-of select="nombre"/></td>
                        <td><xsl:value-of select="precio"/></td>
                        <td><xsl:value-of select="precio + (precio * $iva div 100)"/></td>
                        <td><xsl:value-of select="concat(descuento, '%')"/></td>
                        <td><xsl:value-of select="ganancia"/></td>
                        <td> 
                            <img src="{imagen}" alt="{nombre}"/> 
                        </td>
                        <td>
                            <a target="_blank" href="{enlace}">
                                <xsl:value-of select="nombre"/>
                            </a>
                        </td>
                    </tr>
                </xsl:for-each>
            </tbody>          
        </table>

        <article>
            <h2>Descubre Nuestros Servicios en EL JARDÍN DE LA ALPACA</h2>
            <ul>
                <li><strong>Asesoría Personalizada:</strong> Nuestro equipo de expertos está listo para ayudarte a elegir los productos ideales para ti. Ya sea que busques comodidad, estilo o sostenibilidad, te orientamos para que encuentres lo mejor.</li>
                <li><strong>Asesoría en Cuidado de Lana de Alpaca:</strong> Además de vender productos, compartimos contigo los mejores consejos sobre cómo cuidar y mantener la lana de alpaca, para que aproveches todas sus ventajas a largo plazo.</li>
            </ul>
            <p>¡No te pierdas la oportunidad de disfrutar de la suavidad, durabilidad y sostenibilidad de la lana de alpaca! Nuestros servicios están pensados para ofrecerte la mejor calidad y atención, garantizando que cada experiencia con nosotros sea inolvidable.</p>
            <p>Visítanos y descubre por qué somos los expertos en todo lo relacionado con la lana de alpaca. Te esperamos con los brazos abiertos para ofrecerte lo mejor.</p>
        </article>


        <footer> 2025 Koldo, Unai, Nichita, Joshua, todos los derechos reservados.</footer>
    </body>
</html>

</xsl:template>
</xsl:stylesheet>
