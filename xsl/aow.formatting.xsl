<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns="http://www.w3.org/1999/xhtml" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:template match="p">
		<p><xsl:apply-templates /></p>
	</xsl:template>



	<!-- BIBLIOGRAPHY -->
	
	<bibl><editor n="Miles, Susan">Miles, Susan</editor>, ed.  <title level="a">"Mrs. Buell's Journal, 1877."</title>  <title level="j">Fort Concho and the South Plains Journal</title> <biblScope type="volume">22</biblScope> (<date value="1990">Autumn 1990</date>): <biblScope type="pages">109&#8211;126</biblScope>.</bibl>
	
	<xsl:template match="bibl[not(ancestor::p)]">
	<p class="biblItem">
		<xsl:apply-templates />
	</p>
	</xsl:template>

	<xsl:template match="bibl/title[@level='j']">
		<em><xsl:apply-templates /></em>
	</xsl:template>

	<xsl:template match="title[not(ancestor::bibl)]">
	    <em class="title">
       <xsl:apply-templates/>
	    </em>
	</xsl:template>

	<!-- LINKS -->

  <xsl:template match="ref[@n]">
  	<a href="{$BASE_HREF}{@n}"><xsl:apply-templates /></a>
  </xsl:template>


	<xsl:template match="persName[@rend='bio' and not(/TEI/@id='aow.ii.0001')]">
		<a href="{$BASE_HREF}biographies#{@key}" title="See Biography"><xsl:apply-templates /></a>
	</xsl:template>

	<xsl:template match="placeName[@rend='Military Post' and not(/TEI/@id='aow.iii.0001')]">
		<a href="{$BASE_HREF}military_posts#{@key}" title="See Fort Description"><xsl:apply-templates /></a>
	</xsl:template>
	
	<xsl:template match="div2[@type='bio' or @type='fort']">
	<div id="{@id}">
		<xsl:apply-templates />
	</div>
	</xsl:template>
	
	<xsl:template match="div2[@type='fort']/p/placeName[1]">
	<strong><xsl:apply-templates/></strong>
	</xsl:template>	

	
  <xsl:template match="figure">
  
 	 <div class="fig">
		<div class="image">
			<a href="{$BASE_HREF}images/medium/{@entity}.jpg">
			<img src="{$BASE_HREF}images/thumb/{@entity}.jpg" />
			</a>
		</div>
		<p><xsl:apply-templates /></p>
	</div>
  
  </xsl:template>

	<xsl:template match="body/head">
	<h2><xsl:apply-templates /></h2>
	</xsl:template>

	<xsl:template match="quote">
		<xsl:choose>
			<xsl:when test="ancestor::p">
				<span class="quoted">
					<xsl:apply-templates />
				</span>
			</xsl:when>
			<xsl:when test="descendant::p">
				<blockquote>
					<xsl:apply-templates />
				</blockquote>
			</xsl:when>
			<xsl:otherwise>
				<blockquote>
					<p>
						<xsl:apply-templates />
					</p>
				</blockquote>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template match="hi">
		<xsl:choose>
			<xsl:when test="./@rend='small caps'">
				<span class="smallcaps"><xsl:apply-templates /></span>
			</xsl:when>
			<xsl:when test="./@rend='underlined'">
				<em class="underline"><xsl:apply-templates /></em>
			</xsl:when>
			<xsl:when test="./@rend='italics'">
				<em class="italic"><xsl:apply-templates /></em>
			</xsl:when>
			<xsl:when test="./@rend='underlined 2x'">
				<em class="doubleUnderline"><xsl:apply-templates /></em>
			</xsl:when>
			<xsl:otherwise>
				<xsl:apply-templates />
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template match="lb">
		<br /><xsl:apply-templates />
	</xsl:template>


	
	<xsl:template match="head">
		<xsl:choose>
			<xsl:when test="parent::div1">
				<h1><xsl:apply-templates /></h1>
			</xsl:when>
			<xsl:when test="parent::div2">
				<h2><xsl:apply-templates /></h2>
			</xsl:when>
			<xsl:when test="parent::div3">
				<h3><xsl:apply-templates /></h3>
			</xsl:when>
			<xsl:when test="parent::div4">
				<h4><xsl:apply-templates /></h4>
			</xsl:when>
			<xsl:when test="parent::list">
				<h3 class="listHead"><xsl:apply-templates /></h3>
			</xsl:when>
			<xsl:otherwise>
				<em class="undefined"><xsl:apply-templates /></em>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	<xsl:template match="list">
		<xsl:if test="child::head">
			<xsl:apply-templates select="child::head" />
		</xsl:if>
		<ul>
		<xsl:if test="descendant::label"><xsl:attribute name="class">definitionList</xsl:attribute></xsl:if>
			<xsl:apply-templates select="./item | ./label" />
		</ul>
	</xsl:template>

	
	<xsl:template match="item">
			<li><xsl:apply-templates /></li>
	</xsl:template>

	<xsl:template match="item/label">
			<strong class="label"><xsl:apply-templates /></strong>
	</xsl:template>	
	
	
	<xsl:template match="epigraph">
		<blockquote class="epigraph">
			<xsl:choose>
				<xsl:when test="descendant::p">
					<xsl:apply-templates />
				</xsl:when>
				<xsl:otherwise>
					<p><xsl:apply-templates /></p>
				</xsl:otherwise>
			</xsl:choose>
		</blockquote>
	</xsl:template>
	
	<xsl:template match="q[@type='block']">
		<blockquote>
			<xsl:choose>
				<xsl:when test="descendant::p">
					<xsl:apply-templates />
				</xsl:when>
				<xsl:otherwise>
					<p><xsl:apply-templates /></p>
				</xsl:otherwise>
			</xsl:choose>
		</blockquote>
	</xsl:template>


	<!-- ADDITIONS, DELETIONS, AND EDITORIAL REMARKS -->
	
	<xsl:template match="del">
		<span class="stiked"><xsl:apply-templates /></span>
	</xsl:template>
	
	<!-- Finish for different rends -->
	<xsl:template match="add">
		<span class="addition"><xsl:apply-templates /></span>
	</xsl:template>
	
	<xsl:template match="pb[@rend]">
		<br/>
		<span class="editorial">&lt;<xsl:value-of select="./@rend" />&gt;</span>
		<br/>
		<xsl:apply-templates />
	</xsl:template>

	<xsl:template match="milestone[@unit]">
		<br/>
		<span class="editorial">&lt;<xsl:value-of select="./@unit" /><xsl:if test="@rend">, <xsl:value-of select="./@rend" /></xsl:if>&gt;</span>
		<br/>
		<xsl:apply-templates />
	</xsl:template>

	<xsl:template match="ed[@type]">
		<br/>
		<span class="editorial">&lt;<xsl:value-of select="./@type" />&gt;</span>
		<br/>
		<xsl:apply-templates />
	</xsl:template>

	<xsl:template match="delspan">
		[<xsl:apply-templates />]
	</xsl:template>

	<xsl:template match="gap[@reason]">
		<br/>
		<span class="editorial">&lt;<xsl:value-of select="./@reason" />&gt;</span>
		<br/>
		<xsl:apply-templates />
	</xsl:template>

	<xsl:template match="unclear">
		~<xsl:apply-templates />~
	</xsl:template>

  <xsl:template match="abbr">
  <abbr title="{./@expan}"><xsl:apply-templates /></abbr>  
  </xsl:template>

</xsl:stylesheet>