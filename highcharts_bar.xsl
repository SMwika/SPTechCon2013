<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" indent="yes"/>
    <xsl:param name="titleYAxis">Y-Axis</xsl:param>
    <xsl:param name="chartType">column</xsl:param>
    <xsl:param name="chartTitle">The Chart</xsl:param>
    <xsl:param name="chartSubtitle">The Subtitle</xsl:param>
    <xsl:param name="chartSeriesName">The Series</xsl:param>
    <xsl:param name="seriesField">PercentComplete.</xsl:param>
    <xsl:param name="seriesPercent" select="true()"/>
    <xsl:param name="categoryField">Title</xsl:param>
    <xsl:template match="/">
        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
        <script src="http://code.highcharts.com/highcharts.js"></script>
        <div id="container" style="min-width: 400px; height: 400px; margin: 0 auto"/>

        <script type="text/javascript">
            $(function () {
                $('#container').highcharts({
                    chart: {
                        type: '<xsl:value-of select="$chartType"/>'
                    },
                    title: {
                        text: '<xsl:value-of select="$chartTitle"/>'
                    },
                    subtitle: {
                        text: '<xsl:value-of select="$chartSubtitle"/>'
                    },
                    <xsl:call-template name="outputXAxis"/>
                    ,
        yAxis: {
            title: {
                text: '<xsl:value-of select="$titleYAxis"/>'
            }
        },
        <xsl:call-template name="plotOptions"/>
        ,
        series:[ {
            name: '<xsl:value-of select="$chartSeriesName"/>',
            data:[
                  <xsl:apply-templates select="/dsQueryResponse/Rows/Row" mode="series"/>
                  
                  
            ]
        }]
    });
});
        </script>



    </xsl:template>



    <xsl:template name="outputXAxis"> xAxis: { categories:[<xsl:apply-templates
            select="/dsQueryResponse/Rows/Row" mode="categories"/>] } </xsl:template>

    <xsl:template name="plotOptions">
        <xsl:choose>
            <xsl:when test="$chartType='column'"> plotOptions: { column: { pointPadding: 0.2,
                borderWidth: 0 } } </xsl:when>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="Row" mode="categories">
        <xsl:apply-templates select="./@*" mode="findattr">
            <xsl:with-param name="attr" select="$categoryField"/>
            <xsl:with-param name="wrap">&apos;</xsl:with-param>
        </xsl:apply-templates>
        <xsl:if test="position()!=last()">,</xsl:if>
    </xsl:template>

    <xsl:template match="Row" mode="series">
        <xsl:apply-templates select="./@*" mode="findattr">
            <xsl:with-param name="attr" select="$seriesField"/>
        </xsl:apply-templates>
        <xsl:if test="position()!=last()">,</xsl:if>
    </xsl:template>

    <xsl:template match="@*" mode="findattr">
        <xsl:param name="attr"/>
        <xsl:param name="wrap"/>
        <xsl:if test="name(.)=$attr">
            <xsl:value-of select="concat($wrap,.,$wrap)"/>
        </xsl:if>
    </xsl:template>

</xsl:stylesheet>
