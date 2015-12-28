<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/xml" prefix="x"%>

		<ul>
			<li>E-mail: <a target="_BLANK" href="mailto:mail.redstaffcorp@gmail.com">mail.redstaffcorp@gmail.com</a></li>
			<li><fmt:message key="contact.bugreport" />: <a target="_BLANK" href="https://code.google.com/p/facecloud/">https://code.google.com/p/facecloud/</a></li>
			<li><fmt:message key="contact.facebook" />: <a target="_BLANK" href="https://www.facebook.com/Redstaffcorp">https://www.facebook.com/Redstaffcorp</a></li>
		</ul>
		
		<h1><fmt:message key="products" /></h1>
		
		<c:set var="socketExceptionVariable" /> 
		<c:forEach  begin="1" end="3"  var="i">
   			<c:if test="${socketExceptionVariable != null}">
   			<c:catch var="socketExceptionVariable">
    			<c:import var="feed" url="http://rscfeeds.appspot.com/rscrssfeeds/atom?channel=1440015"  charEncoding="UTF-8"  />
			</c:catch>
			</c:if>
		</c:forEach>
		
		
    	<c:import url="feed.xsl" var="xslt"  charEncoding="UTF-8"/>
		<x:transform xml="${feed}" xslt="${xslt}" /> 
    	
    	<div class="rscfeeds"><fmt:message key="rscfeeds" /></div>