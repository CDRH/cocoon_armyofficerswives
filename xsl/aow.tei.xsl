<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" encoding="utf-8"/>
    

    
    <xsl:include href="aow.globals.xsl"/>
    <xsl:include href="aow.formatting.xsl"/>

    
    <xsl:template match="/">
        <html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><xsl:value-of select="//title[@level='m' and @type='main']" /></title>
<meta http-equiv="Content-type" content="text/html; charset=utf-8" />

<link href="{$BASE_HREF}css/reset.css" rel="stylesheet" type="text/css" />
<link href="{$BASE_HREF}css/layout.css" rel="stylesheet" type="text/css" />
<link href="{$BASE_HREF}css/aow.css" rel="stylesheet" type="text/css" />

<xsl:comment>[if IE 6]&#x3E;
&#x3C;link href="<xsl:value-of select="$BASE_HREF" />css/ie.css" rel="stylesheet" type="text/css" /&#x3E;
&#x3C;![endif]</xsl:comment>

</head>
<body>

  <div id="page_margins">
	  
	  	<div class="header">
		<a href="{$BASE_HREF}"><img src="../web-images/header2.jpg" /></a>
		</div>

    <div id="main">

	     <div id="col1">
	<div class="list">
		<xsl:call-template name="genMenu" />
	</div>
	
	<div class="listlow">
	<ul class="lowermenu">
		<li><h1>Context</h1></li>
		<li><a href="{$BASE_HREF}biographies">The Women</a></li>
		<li><a href="{$BASE_HREF}military_posts">Military Posts</a></li>
		<li><h1>About the Project</h1></li>
		<li><a href="{$BASE_HREF}bibliography">Bibliography</a></li>
		<li><a href="{$BASE_HREF}lesson_plans">Lesson Plans</a></li>
	</ul>
	</div>
	
	
      </div>
      <div id="col3">
        <div id="col3_content" class="clearfix">
		
<div class="content">


            <xsl:apply-templates select="//text"/>

</div>
		
        </div>

        
      </div>

    </div>

  </div>
  	<!--<div class="ne"><img src="../web-images/ne.jpg" /></div>-->

  <div class="footer">
  <h4><!--<span class="fig"><span class="hidden"><span class="ne"></span></span></span>-->
  	
	<a href="{$BASE_HREF}about/methodology">Methodology</a> | 
	<a href="{$BASE_HREF}about/acknowledgements">Acknowledgements</a> | 
	<a href="{$BASE_HREF}about/barbara_handy-marchello">About the Author</a></h4>
  	<h4><a href="http://www.unl.edu">University of Nebraska-Lincoln</a>, <a href="http://cdrh.unl.edu">Center for Digital Research in the Humanities</a> </h4>
  	<img src="{$BASE_HREF}web-images/unl_logo.gif" class="right" /> 
</div>

</body>
</html>

        
    </xsl:template>
    
    
    <xsl:template match="div1[@type='file references']">
    <p>
		<xsl:if test=".//xptr[@type='prev']">
			<xsl:variable name="prevlink" select="(tokenize(.//xptr[@type='prev']/@n, '\.'))[3]" />
			<a href="{if ($prevlink = '0001') then 'index.html' else concat('p', $prevlink)}" style="margin-right:10px">Previous</a>
		</xsl:if>
		<xsl:if test=".//xptr[@type='next']">
			<a href="p{(tokenize(.//xptr[@type='next']/@n, '\.'))[3]}">Next</a>
		</xsl:if>  
    </p>
    </xsl:template>
	
	
	
  <xsl:template name="genMenu">
	
	<xsl:variable name="section" select="(tokenize(/TEI/@id, '\.'))[2]" />
	<xsl:variable name="subSection" select="(tokenize(/TEI/@id, '\.'))[3]" />

	<ul class="mainmenu">
				<li>
					<h3><a href="{$BASE_HREF}">Home</a></h3>
				</li>
  		<li class="{if ($section = 'iv') then 'selected' else 'hidden'}"><h3><a href="{$BASE_HREF}daily_life/">Daily Life</a></h3>
  			<xsl:if test="$section = 'iv'">
			<ul>
				<li>
					<xsl:if test="$subSection='0001'"><xsl:attribute name="class">current</xsl:attribute></xsl:if>
					<a href="{$BASE_HREF}daily_life/">Introduction</a>
				</li>
				<li>
					<xsl:if test="$subSection='0002'"><xsl:attribute name="class">current</xsl:attribute></xsl:if>
					<a href="{$BASE_HREF}daily_life/p0002">Daily life in a Great Plains Military Post</a>
				</li>
				<li>
					<xsl:if test="$subSection='0003'"><xsl:attribute name="class">current</xsl:attribute></xsl:if>
					<a href="{$BASE_HREF}daily_life/p0003">Climate and Environment</a>
				</li>
				<li>
					<xsl:if test="$subSection='0004'"><xsl:attribute name="class">current</xsl:attribute></xsl:if>
					<a href="{$BASE_HREF}daily_life/p0004">Procuring Food and Clothing</a>
				</li>
				<li>
					<xsl:if test="$subSection='0005'"><xsl:attribute name="class">current</xsl:attribute></xsl:if>
					<a href="{$BASE_HREF}daily_life/p0005">Church and School</a>
				</li>
				<li>
					<xsl:if test="$subSection='0006'"><xsl:attribute name="class">current</xsl:attribute></xsl:if>
					<a href="{$BASE_HREF}daily_life/p0006">Conclusion</a>
				</li>
    		</ul>
			</xsl:if>
  		</li>
  		<li class="{if ($section = 'v') then 'selected' else 'hidden'}"><h3><a href="{$BASE_HREF}family_life/">Family Life</a></h3>
			<xsl:if test="$section = 'v'">
			<ul>
				<li>
					<xsl:if test="$subSection='0001'"><xsl:attribute name="class">current</xsl:attribute></xsl:if>
					<a href="{$BASE_HREF}family_life/">Introduction</a>
				</li>
				<li>
					<xsl:if test="$subSection='0002'"><xsl:attribute name="class">current</xsl:attribute></xsl:if>
					<a href="{$BASE_HREF}family_life/p0002">The Army Marriage</a>
				</li>
				<li>
					<xsl:if test="$subSection='0003'"><xsl:attribute name="class">current</xsl:attribute></xsl:if>
					<a href="{$BASE_HREF}family_life/p0003">Raising Children on the Great Plains</a>
				</li>
				<li>
					<xsl:if test="$subSection='0004'"><xsl:attribute name="class">current</xsl:attribute></xsl:if>
					<a href="{$BASE_HREF}family_life/p0004">Best Friends, Other Women, and Gentlemen</a>
				</li>
				<li>
					<xsl:if test="$subSection='0005'"><xsl:attribute name="class">current</xsl:attribute></xsl:if>
					<a href="{$BASE_HREF}family_life/p0005">Conclusion</a>
				</li>
    		</ul>
			</xsl:if>
		</li>
		<li class="{if ($section = 'vi') then 'selected' else 'hidden'}"><h3><a href="{$BASE_HREF}rank_and_class/">Rank and Class</a></h3>
			<xsl:if test="$section = 'vi'">
			<ul>
				<li>
					<xsl:if test="$subSection='0001'"><xsl:attribute name="class">current</xsl:attribute></xsl:if>
					<a href="{$BASE_HREF}rank_and_class/">Introduction</a>
				</li>
				<li>
					<xsl:if test="$subSection='0002'"><xsl:attribute name="class">current</xsl:attribute></xsl:if>
					<a href="{$BASE_HREF}rank_and_class/p0002">Fashion</a></li>
				<li>
					<xsl:if test="$subSection='0003'"><xsl:attribute name="class">current</xsl:attribute></xsl:if>
					<a href="{$BASE_HREF}rank_and_class/p0003">Cooks and Household Servants</a></li>
				<li>
					<xsl:if test="$subSection='0004'"><xsl:attribute name="class">current</xsl:attribute></xsl:if>
					<a href="{$BASE_HREF}rank_and_class/p0004">Middle Class Reform</a></li>
				<li>
					<xsl:if test="$subSection='0005'"><xsl:attribute name="class">current</xsl:attribute></xsl:if>
					<a href="{$BASE_HREF}rank_and_class/p0005">Claiming Nature on the Great Plains</a></li>
				<li>
					<xsl:if test="$subSection='0006'"><xsl:attribute name="class">current</xsl:attribute></xsl:if>
					<a href="{$BASE_HREF}rank_and_class/p0006">Entertaining</a></li>
				<li>
					<xsl:if test="$subSection='0007'"><xsl:attribute name="class">current</xsl:attribute></xsl:if>
					<a href="{$BASE_HREF}rank_and_class/p0007">Female Grenadiers</a></li>
    		</ul>
			</xsl:if>
		</li>
		<li class="{if ($section = 'vii') then 'selected' else 'hidden'}"><h3><a href="{$BASE_HREF}indians/">Indians</a></h3>
			<xsl:if test="$section = 'vii'">
			<ul>
				<li>
					<xsl:if test="$subSection='0001'"><xsl:attribute name="class">current</xsl:attribute></xsl:if>
					<a href="{$BASE_HREF}indians/">Introduction</a></li>
				<li>
					<xsl:if test="$subSection='0002'"><xsl:attribute name="class">current</xsl:attribute></xsl:if>
					<a href="{$BASE_HREF}indians/p0002">The Indian</a></li>
				<li>
					<xsl:if test="$subSection='0003'"><xsl:attribute name="class">current</xsl:attribute></xsl:if>
					<a href="{$BASE_HREF}indians/p0003">Women, Racism, and Gender</a></li>
				<li>
					<xsl:if test="$subSection='0004'"><xsl:attribute name="class">current</xsl:attribute></xsl:if>
					<a href="{$BASE_HREF}indians/p0004">The Quest for Indian Male Objects</a></li>
				<li>
					<xsl:if test="$subSection='0005'"><xsl:attribute name="class">current</xsl:attribute></xsl:if>
					<a href="{$BASE_HREF}indians/p0005">Women and Children</a></li>
				<li>
					<xsl:if test="$subSection='0006'"><xsl:attribute name="class">current</xsl:attribute></xsl:if>
					<a href="{$BASE_HREF}indians/p0006">War</a></li>
				<li>
					<xsl:if test="$subSection='0007'"><xsl:attribute name="class">current</xsl:attribute></xsl:if>
					<a href="{$BASE_HREF}indians/p0007">Federal Indian Policy</a></li>
				<li>
					<xsl:if test="$subSection='0008'"><xsl:attribute name="class">current</xsl:attribute></xsl:if>
					<a href="{$BASE_HREF}indians/p0008">Conclusion</a></li>
    		</ul>
			</xsl:if>
		</li>
	</ul>
	
	</xsl:template>
	

</xsl:stylesheet>
