<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml" version="2.0" xmlns:saxon="http://saxon.sf.net/" xmlns:xhtml="http://www.w3.org/1999/xhtml" exclude-result-prefixes="saxon xhtml">
    
    <xsl:variable name="BASE_HREF">http://plainshumanities.unl.edu/army_officers_wives/</xsl:variable>
    <!--<xsl:variable name="BASE_HREF">http://localhost:8080/cocoon/army_officers_wives/</xsl:variable>-->
    
	<xsl:variable name="PROJECT_TITLE">Army Officer's Wives</xsl:variable>


    <!--
      Note about collation:
      This collation sets the default settings for comparisons in XPATH expressions to ignore case.
      When upgrading to Saxon 8.8 and up, the "default" attribute will not work and needs to be 
      replaced by a "default-collation" attribute on xsl: elements within the stylesheet.
      -->
      <saxon:collation name="english" lang="en-US" strength="primary" default="yes"/>

    
</xsl:stylesheet>
