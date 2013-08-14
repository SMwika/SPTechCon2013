<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <!-- This XSL Stylesheet created by SharePoint Experts, Inc. -->
    <!-- http://sharepointexperience.com -->

    <xsl:output method="html" indent="yes"/>
    <!-- This template is the "wrapper" or "container" for the custom view. -->

    <xsl:template match="/">
    	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
    	<script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/jquery-ui.min.js"></script>
    	<link rel="stylesheet" type="text/css" href="//ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/themes/ui-lightness/jquery-ui.min.css"/>
        <!-- This is the actual wrapper element that will be emitted -->
        <div class="accordion">
            <!-- This will tell the data view to look for the actual content
            and come back when it's done. -->
            <xsl:apply-templates/>
        </div>
        <script>
        	$('.accordion').accordion();
        </script>
        <!-- end wrapper -->
    </xsl:template>
    <xsl:template match="/dsQueryResponse/Rows/Row">
        <!-- This markup is used for each item in the list -->
       <h3><xsl:value-of select="@Title"/></h3>
       <xsl:value-of select="@Body" disable-output-escaping="yes"/>
  </xsl:template>
</xsl:stylesheet>