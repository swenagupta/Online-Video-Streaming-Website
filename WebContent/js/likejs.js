

//Create a boolean variable to check for a valid Internet Explorer instance.
var xmlhttp = false;
//Check if we are using IE.
try {
//If the Javascript version is greater than 5.
xmlhttp = new ActiveXObject("Msxml2.XMLHTTP");
//alert ("You are using Microsoft Internet Explorer.");
} catch (e) {
//If not, then use the older active x object.
try {
//If we are using Internet Explorer.
xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
//alert ("You are using Microsoft Internet Explorer");
} catch (E) {
//Else we must be using a non-IE browser.
xmlhttp = false;
}
}
//If we are using a non-IE browser, create a javascript instance of the object.
if (!xmlhttp && typeof XMLHttpRequest != 'undefined') {
xmlhttp = new XMLHttpRequest();
//alert ("You are not using Microsoft Internet Explorer");
}
function makerequest(serverPage, objID)
{
var obj= document.getElementById(objID);
xmlhttp.open("GET",serverPage);
xmlhttp.onreadystatechange = function(){
if(xmlhttp.readyState == 4 && xmlhttp.status == 200)
{
obj.innerHTML=xmlhttp.responseText;
}
}
xmlhttp.send(null);
}


/*
function xmlhttpPost2(strURL) {
var xmlHttpReq = false;
var self = this;
// Mozilla/Safari
if (window.XMLHttpRequest) {
self.xmlHttpReq = new XMLHttpRequest();
}
// IE
else if (window.ActiveXObject) {
self.xmlHttpReq = new ActiveXObject("Microsoft.XMLHTTP");
}
self.xmlHttpReq.open('POST', strURL, true);
self.xmlHttpReq.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
self.xmlHttpReq.onreadystatechange = function() {
if (self.xmlHttpReq.readyState == 4) {
updatepage1(self.xmlHttpReq.responseText);
}
}
self.xmlHttpReq.send(getquerystring1());
}

function getquerystring1() {
var form = document.forms['form2'];
var desc = form.desc.value;
qstr = 'w=' + escape(desc); // NOTE: no '?' before querystring
return qstr;
}

function updatepage1(str){
document.getElementById("result1").innerHTML = str;
}
*/