<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <!-- This XSL Stylesheet created by SharePoint Experts, Inc. -->
    <!-- http://sharepointexperience.com -->

    <xsl:output method="html" indent="yes"/>
    <!-- This template is the "wrapper" or "container" for the custom view. -->
    <xsl:template match="/">
        <!-- This is the actual wrapper element that will be emitted -->
        <style>
            .container{width:210px;height:140px;position:relative;margin:0 auto 40px;padding-bottom: 4em;-webkit-perspective:1000px;-moz-perspective:1000px;-o-perspective:1000px;perspective:1000px;}#carousel{width:100%;height:100%;position:absolute;-webkit-transform:translateZ( -288px );-moz-transform:translateZ( -288px );-o-transform:translateZ( -288px );transform:translateZ( -288px );-webkit-transform-style:preserve-3d;-moz-transform-style:preserve-3d;-o-transform-style:preserve-3d;transform-style:preserve-3d;-webkit-transition:1s;-moz-transition:1s;-o-transition:1s;transition:1s;}#carousel figure{display:block;position:absolute;width:186px;height:116px;left:10px;top:10px;border:2px solid black;line-height:116px;font-size:80px;font-weight:bold;color:white;text-align:center;}#carousel figure:nth-child(1):hover{-webkit-transform:rotateY( 0deg ) translateZ( 308px )}#carousel figure:nth-child(1){background:hsla( 0,100%,50%,0.8 )}#carousel figure:nth-child(2){background:hsla( 40,100%,50%,0.8 )}#carousel figure:nth-child(3){background:hsla( 80,100%,50%,0.8 )}#carousel figure:nth-child(4){background:hsla( 120,100%,50%,0.8 )}#carousel figure:nth-child(5){background:hsla( 160,100%,50%,0.8 )}#carousel figure:nth-child(6){background:hsla( 200,100%,50%,0.8 )}#carousel figure:nth-child(7){background:hsla( 240,100%,50%,0.8 )}#carousel figure:nth-child(8){background:hsla( 280,100%,50%,0.8 )}#carousel figure:nth-child(9){background:hsla( 320,100%,50%,0.8 )}#carousel figure:nth-child(1){-webkit-transform:rotateY( 0deg ) translateZ( 318px );-moz-transform:rotateY( 0deg ) translateZ( 288px );-o-transform:rotateY( 0deg ) translateZ( 288px );transform:rotateY( 0deg ) translateZ( 288px );}#carousel figure:nth-child(2){-webkit-transform:rotateY( 40deg ) translateZ( 288px );-moz-transform:rotateY( 40deg ) translateZ( 288px );-o-transform:rotateY( 40deg ) translateZ( 288px );transform:rotateY( 40deg ) translateZ( 288px );}#carousel figure:nth-child(3){-webkit-transform:rotateY( 80deg ) translateZ( 288px );-moz-transform:rotateY( 80deg ) translateZ( 288px );-o-transform:rotateY( 80deg ) translateZ( 288px );transform:rotateY( 80deg ) translateZ( 288px );}#carousel figure:nth-child(4){-webkit-transform:rotateY( 120deg ) translateZ( 288px );-moz-transform:rotateY( 120deg ) translateZ( 288px );-o-transform:rotateY( 120deg ) translateZ( 288px );transform:rotateY( 120deg ) translateZ( 288px );}#carousel figure:nth-child(5){-webkit-transform:rotateY( 160deg ) translateZ( 288px );-moz-transform:rotateY( 160deg ) translateZ( 288px );-o-transform:rotateY( 160deg ) translateZ( 288px );transform:rotateY( 160deg ) translateZ( 288px );}#carousel figure:nth-child(6){-webkit-transform:rotateY( 200deg ) translateZ( 288px );-moz-transform:rotateY( 200deg ) translateZ( 288px );-o-transform:rotateY( 200deg ) translateZ( 288px );transform:rotateY( 200deg ) translateZ( 288px );}#carousel figure:nth-child(7){-webkit-transform:rotateY( 240deg ) translateZ( 288px );-moz-transform:rotateY( 240deg ) translateZ( 288px );-o-transform:rotateY( 240deg ) translateZ( 288px );transform:rotateY( 240deg ) translateZ( 288px );}#carousel figure:nth-child(8){-webkit-transform:rotateY( 280deg ) translateZ( 288px );-moz-transform:rotateY( 280deg ) translateZ( 288px );-o-transform:rotateY( 280deg ) translateZ( 288px );transform:rotateY( 280deg ) translateZ( 288px );}#carousel figure:nth-child(9){-webkit-transform:rotateY( 320deg ) translateZ( 288px );-moz-transform:rotateY( 320deg ) translateZ( 288px );-o-transform:rotateY( 320deg ) translateZ( 288px );transform:rotateY( 320deg ) translateZ( 288px );}
        </style>
        <section class="container">
            <div id="carousel">
                <!-- This will tell the data view to look for the actual content
                and come back when it's done. -->
                <xsl:apply-templates/>
            </div>
        </section>
        <div id="buttons">
            <div id="carousel_back" data-delta="-1">[Back]</div>
            <div id="carousel_forward" data-delta="1">[Forward]</div>
        </div>
        <script>
            <![CDATA[
                /*jshint strict:false */
var init = function() {
    var carousel = document.getElementById('carousel'),
        pagers = document.querySelectorAll('#buttons div'),
        imageCount = carousel.children.length,
        delta = 0,
        btnBack = document.getElementById('carousel_back'),
        btnForward = document.getElementById('carousel_forward'),
        onButtonClick = function(e) {
            alert('yo');
            var step = parseInt(e.target.getAttribute('data-delta'));
            delta += (360 / imageCount) * step * -1;
            carousel.style['-webkit-transform'] = 'translateZ( -288px ) rotateY(' +
                delta + 'deg)';
            e.preventDefault();
        };
    btnBack.addEventListener('click', onButtonClick, false);
    btnForward.addEventListener('click', onButtonClick, false);
};
window.addEventListener('DOMContentLoaded', init, false);
            ]]>
        </script>
    <!-- end wrapper -->
</xsl:template>
<xsl:template match="/dsQueryResponse/Rows/Row">
    <!-- This markup is used for each item in the list -->
    <figure><img src="{@Title}"/></figure>
</xsl:template>
</xsl:stylesheet>