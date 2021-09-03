<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">  

<xsl:template match="/">
  <html>
  <body>
  <h2>Books</h2>
  <table border="1">
    <tr bgcolor="#9acd32">
	  <th>Book ID</th>
	  <th>Category</th>
	  <th>Title</th>
      <th>Author</th>
      <th>Year</th>
	  <th>Price</th>
    </tr>
    <xsl:for-each select="bookstore/book">
		<xsl:sort select="title"/>
    <tr>
      <td><xsl:value-of select="@id"/></td>
	  <td>
		<xsl:value-of select="@category"/>
	  </td>
      <td><xsl:value-of select="title"/></td>
	  <td>
    <xsl:for-each select="author">
      <xsl:value-of select="."/><br/>
    </xsl:for-each>
	  </td>
	  <td><xsl:apply-templates select="year"/></td>
	  <td><xsl:value-of select="price"/></td>
    </tr>
    </xsl:for-each>
  </table>
  </body>
  </html>
</xsl:template>
<xsl:template match="year">
	<xsl:choose>
        <xsl:when test="year > 2014">
          <span bgcolor="#ff00ff">
          <xsl:value-of select="."/></span>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="."/>
        </xsl:otherwise>
    </xsl:choose>
</xsl:template>
</xsl:stylesheet>