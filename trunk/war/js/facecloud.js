/* Copyright (c) 2014 Red Staff Corp */


/*******************************CloudData object start*********************************/

/**
 * SimpleCloudData object represents an entry in the Facebook cloud.
 * Each entry has Facebook id, and Facebook name, but the Facebook name is not required.
 * It is possible to define the weight variable. 
 * If the Facebook name is definied, it will be displayed as the title of the profile image.
 * If the weight is defined the profile image will be enlarged by the weight.
 */

CloudData.prototype.id = null;
CloudData.prototype.name = null;
CloudData.prototype.weight = 0;

/**
 * Constructor with Facebook id, Facebook name and weight.
 */
function CloudData(id, name, weight){
	this.id = id;
	if(typeof name != 'undefined' && name != null){
		this.name = name;
	}
	
	if(typeof weight != 'undefined' && weight != null){
		this.weight = weight;
	}
}


/*******************************CloudData object end*********************************/


/**
 * Facecloud object
 */
Facecloud.prototype.data = new Array();
Facecloud.prototype.maxWeight = 3;
Facecloud.prototype.weightMultiplicator = 2;

Facecloud.prototype.cloudWidth = 400;
Facecloud.prototype.cloudHeight = 400;

Facecloud.prototype.style = "";
Facecloud.prototype.cssClass = null;

Facecloud.prototype.renderLinks = false;

function Facecloud(data){
	this.data = data;
}

Facecloud.prototype.setData = function(data){
	this.data = data;
};

/**
 * Set the max weight what displayable in the cloud. Every weight what is higher than maxWeight will be equals the maxWeight.
 * @param maxWeight
 */
Facecloud.prototype.setMaxWeight = function(maxWeight){
	this.maxWeight = maxWeight;
};

/**
 * The weightMultiplicator determines the scale for the weight.<br/>
 * for example: weight = 2, weightMultiplicator = 5<br/>
 * the image size will be set: origin size + 2*5 px;
 * @param multiplicator
 */
Facecloud.prototype.setWeightMultiplicator = function(multiplicator){
	this.weightMultiplicator = multiplicator;
};

/**
 * Set the width of the cloud.
 * @param cloudWidth
 */
Facecloud.prototype.setCloudWidth = function(cloudWidth){
	this.cloudWidth = cloudWidth;
};

/**
 * Set the height of the cloud.
 * @param cloudHeight
 */
Facecloud.prototype.setCloudHeight = function(cloudHeight){
	this.cloudHeight = cloudHeight;
};

/**
 * Set the style attribute of the main cloud div element.
 * @param style
 */
Facecloud.prototype.setStyle = function(style){
	this.style = style;
};

/**
 * If the renderLink is true, the cloud renders all the profile image as a link to the Facebook user profile page.
 * @param renderLinks
 */
Facecloud.prototype.setRenderLinks = function(renderLinks){
	this.renderLinks = renderLinks;
};

/**
 * Set the class attribute of the main cloud div element.
 * @param style
 */
Facecloud.prototype.setCssClass = function(cssClass){
	this.cssClass = cssClass;
};

Facecloud.prototype.render = function(slot){
	this.style = this.style+"width:"+this.cloudWidth+"px; height:"+this.cloudHeight+"px;";
	document.getElementById(slot).setAttribute('style', this.style);
	if(this.cssClass != null){
		document.getElementById(slot).setAttribute('class', this.cssClass);
	}
	
	var content = "";
	
	var offsets = this.getPosition(document.getElementById(slot));
	var topOffset = offsets.y;
	var leftOffset = offsets.x;
	
	
	for (var i = 0; i < this.data.length; i++) {
	    var fbUser = this.data[i];
		
		var weight = fbUser.weight;
	    if(weight > this.maxWeight){
	    	weight = this.maxWeight;
	    }
	    
	    var toppx = Math.floor(Math.random() * this.cloudHeight) + topOffset;
		var leftpx = Math.floor(Math.random() * this.cloudWidth) + leftOffset;
	    
		var imgWidth = 30+(weight*this.weightMultiplicator);
		var imgHeight = 30+(weight*this.weightMultiplicator);
		
		//check and correct boundary overflow
		var rightOveflow = (this.cloudWidth+leftOffset) - (leftpx+imgWidth);
		if(rightOveflow < 0){
			leftpx += rightOveflow;
		}
		
		var bottomOveflow = (this.cloudHeight+topOffset) - (toppx+imgHeight);
		if(bottomOveflow < 0){
			toppx += bottomOveflow;
		}
		
		
	    content += "<div class='cloudTag' style='position:absolute; top:" + toppx + "px; left:"
		+ leftpx + "px; z-index:" + weight + "'>";
	    
	    if(this.renderLinks){
	    	content += "<a target='_BLANK' href='https://facebook.com/"+fbUser.id+"'>";
	    }
	    
	    var altPart = fbUser.name != null?(" title='"+fbUser.name+"'"):"";
	    
	    content += "<img "+altPart+" width='"+imgWidth+"px' height='"+imgHeight+"px' src='http://graph.facebook.com/"
		+ fbUser.id + "/picture'/>";
	    
	    if(this.renderLinks){
	    	content += "</a>";
	    }
	    
	    content += "</div>";
	}
	
	document.getElementById(slot).innerHTML = content;
};

/**
 * Determines the real absolute positions of the main cloud div element in the DOM.</br>
 * All of the profile images will be calculated from these base positions.
 * @param element
 * @returns {___anonymous5250_5279}
 */
Facecloud.prototype.getPosition = function (element) {
    var xPosition = 0;
    var yPosition = 0;
  
    while(element) {
        xPosition += (element.offsetLeft - element.scrollLeft + element.clientLeft);
        yPosition += (element.offsetTop - element.scrollTop + element.clientTop);
        element = element.offsetParent;
    }
    
    return { x: xPosition, y: yPosition };
};

