var loader = document.getElementById("loader"); 

window.onprogress = function() {
	loader.hidden = false;
};

window.onload = function() {
	loader.hidden = true;
};