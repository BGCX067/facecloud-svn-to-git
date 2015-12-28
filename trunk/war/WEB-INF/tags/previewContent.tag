<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div style="height:800px;">
<div><h1><fmt:message key="preview.title" /></h1></div>
<div id="slot"></div>
<div>
	<h2><fmt:message key="preview.source" /></h2>
	<code><pre>
	var data = new Array();
	
	var i = 0;
	var id = 100007512282426;
	for(;i < 100; i++){
		var weight = 1;
		data[i] = new CloudData(id, "Testuser"+i, weight);
		id++;
	}
	
	var fc = new Facecloud(data);
	fc.setCloudWidth(400);
	fc.setCloudHeight(400);
	fc.setWeightMultiplicator(3);
	fc.setStyle("border: 1px solid black;");
	fc.setCssClass("cloud");
	fc.setRenderLinks(true);
	fc.render("slot");
	</pre></code>
</div>

</div>
<script src="js/facecloud.js"></script>

<script>
var data = new Array();

var i = 0;
var id = 100007512282426;
for(;i < 100; i++){
	var weight = 1;
	if(i%2==0){
		weight = 2;
	}
	if(i%3==0){
		weight = 3;
	}
	if(i%4==0){
		weight = 4;
	}
	if(i%5==0){
		weight = 5;
	}
	data[i] = new CloudData(id, "Testuser"+i, weight);
	id++;
}

var fc = new Facecloud(data);
fc.setCloudWidth(400);
fc.setCloudHeight(400);
fc.setWeightMultiplicator(3);
fc.setStyle("border: 1px solid black;");
fc.setCssClass("cloud");
fc.setRenderLinks(true);
fc.render("slot");
</script>