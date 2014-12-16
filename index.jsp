<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <title>Varna</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <!-- Place favicon.ico and apple-touch-icon.png in the root directory -->

        <link rel="stylesheet" href="css/normalize.css">
				<link rel="stylesheet" media="screen" href="plugin/bootstrap/css/bootstrap.min.css">
				<link rel="stylesheet" href="plugin/bootstrap/css/bootstrap-responsive.min.css">
				<link rel="stylesheet" href="plugin/font-awesome/css/font-awesome.min.css">
				<!--[if IE 7]>
					<link rel="stylesheet" href="plugin/font-awesome/css/font-awesome-ie7.min.css">
				<![endif]-->
        <link rel="stylesheet" href="css/main.css">
        <script src="js/vendor/modernizr-2.6.2.min.js"></script>
    </head>
    <body>
        <!--[if lt IE 7]>
            <p class="chromeframe">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> or <a href="http://www.google.com/chromeframe/?redirect=true">activate Google Chrome Frame</a> to improve your experience.</p>
        <![endif]-->

<!--==========================================================================
     Header Unit (LOGO & Slogan)
    ==========================================================================-->
<div class="row-fluid">
	<div class="span12 slogan text-center">
		<img class="logo" src="image/logo.png" alt="logo">
		<h1>Hey!<br> 
		<small>Welcome to AApay！</small></h1>
	</div>
</div>


<!--==========================================================================
			Information Unit
				-In these (two) information balloons you have to tell (in a simple way)
					like "what are your app going to do/change?"
    ==========================================================================-->

<div class="row-fluid">

	<div class="span4 info-container left">
		<div class="hero-unit info">
			<h2>Questions</h2>
			<p>你还在为AA买单而苦恼吗？</p>
			<p>你还在为请客没钱而担忧吗？</p>
			<p>你还在为朋友有借无还而辗转反侧吗？</p>
			<p>......</p>
		</div>
	</div>

<!--==========================================================================
			App Showcase
				-You developed your app only for android ? Now we have 2 mobile devices
				 instead of one, you can simply select the device by commenting out
				 the unnecessary one.

		==========================================================================-->
    
	<!--<div class="span4 text-center" style="margin-top:-5%;"><img src="image/iwhite.png" alt="iphone white"></div>-->
	<div class="span4 text-center" style="margin-top:-5%;"><img src="image/s4_Template.png" alt="iphone white" width="364" height="671"></div>
	
	
	<!--==========================================================================-->
	
	
	<div class="span4 info-container right">
		<div class="hero-unit info">
  		<h2>Answer!</h2>
  		<p>赶快加入到AApay的队伍中来吧！这里有你意想不到的惊喜：</p>
  		<p>AA付款；</p>
  		<p>创建活动；</p>
  		<p>邀请好友；</p>
  		<p>金额分配；</p>
  		<p>.....</p>
		</div>
	</div>

</div>


<!--==========================================================================
     Connect your app with url to store.
    ==========================================================================-->

<div class="row-fluid">
	<div class="span12 text-center" style="margin-top:4%;">
	  <div align="center"><a href="Login.jsp"><img src="image/app-store.png" alt="App store" width="17%" height="55" class="span2 offset4" style="margin-right:2%;" align="middle"></a></div>
	</div>
</div>



<!--==========================================================================
     Social Network Unit
    ==========================================================================-->

<div class="row-fluid">
	<div class="span12 text-center" style="margin-top:5%;">
			<a class="social" href="#"><i class="icon-twitter icon-2x"></i></a>
			<a class="social" href="#"><i class="icon-google-plus icon-2x"></i></a>
			<a class="social" href="#"><i class="icon-facebook icon-2x"></i></a>
	</div>
</div>


<!--==========================================================================
     Footer Unit
    ==========================================================================-->

<footer>
	<div class="row-fluid footer">
		<div class="span12">
			<p class="copyright text-right">&nbsp;</p>
		</div>
	</div>
</footer>


<!--==========================================================================
     Javascript Unit
				-connect your Google Analytics account easily.
    ==========================================================================-->
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
        <script>window.jQuery || document.write('<script src="js/vendor/jquery-1.9.1.min.js"><\/script>')</script>
        <script src="js/plugins.js"></script>
				<script src="plugin/bootstrap/js/bootstrap.min.js"></script>
        <script src="js/main.js"></script>

        <!-- Google Analytics: change UA-XXXXX-X to be your site's ID. -->
<!--
        <script>
            var _gaq=[['_setAccount','UA-XXXXX-X'],['_trackPageview']];
            (function(d,t){var g=d.createElement(t),s=d.getElementsByTagName(t)[0];
            g.src='//www.google-analytics.com/ga.js';
            s.parentNode.insertBefore(g,s)}(document,'script'));
        </script>
-->

    </body>
</html>
