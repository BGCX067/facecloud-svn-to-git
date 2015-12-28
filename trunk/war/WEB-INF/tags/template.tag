<%@ taglib prefix="rsc" tagdir="/WEB-INF/tags"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Facecloud</title>

<meta property="og:image" content="http://rscfacecloud.appspot.com/image/logo_1024x1024.png"/>
	<meta property="og:title" content="Red Staff Corp FaceCloud"/>
	<meta property="og:description" content="<fmt:message key="home.p1"/>" />

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="css/style.css"/>

<script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-50231705-1', 'facecloud.appspot.com');
  ga('send', 'pageview');

</script>

</head>
<body>
<div id="container">
  <div id="header"> <a href="index.jsp">Facecloud</a> </div>
  <div id="menu"> 
  	<a href="index.jsp"><fmt:message key="menu.home" /></a> &nbsp; &nbsp; &nbsp; &nbsp; 
  	<a href="function.jsp"><fmt:message key="menu.function" /></a> &nbsp; &nbsp; &nbsp; &nbsp; 
  	<a href="preview.jsp"><fmt:message key="menu.preview" /></a> &nbsp; &nbsp; &nbsp; &nbsp; 
  	<a href="contact.jsp"><fmt:message key="menu.contact" /></a> 
  </div>
  
  <div id="sidebar">
    <h1></h1>
    <script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
	<!-- Facecloud -->
	<ins class="adsbygoogle"
	     style="display:inline-block;width:120px;height:240px"
	     data-ad-client="ca-pub-6858754562565967"
	     data-ad-slot="6638160328"></ins>
	<script>
	(adsbygoogle = window.adsbygoogle || []).push({});
	</script>
  </div>
  
  <div id="main">
  	<jsp:doBody />
  	
  	<div style="width: 100%;text-align: center; padding:10px;display:inline;" id="demolike" class="fb-like"
				data-href="http://rscfacecloud.appspot.com/"
				data-send="true" data-layout="button_count" 
				data-show-faces="true">
	</div>
	<div id="fb-root"></div>
	<script>
	(function(d, s, id) {
		var js, fjs = d.getElementsByTagName(s)[0];
		if (d.getElementById(id))
			return;
		js = d.createElement(s);
		js.id = id;
		js.src = "//connect.facebook.net/hu_HU/all.js#xfbml=1&appId=510254319079852";
		fjs.parentNode.insertBefore(js, fjs);
	}(document, 'script', 'facebook-jssdk'));
	</script>
  </div>
  
  <div id="footer"> &copy;2014 Red Staff Corp. &nbsp;<span class="separator">|</span></div>
</div>
</html>