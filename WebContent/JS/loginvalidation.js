function validateLogin(form) {
	var logintypeselect = document.getElementById("logintypeselect");
	var usernametxt = document.getElementById("usernametxt");
	var passwordtxt = document.getElementById("passwordtxt");
	var messageboxA = document.getElementById("messageboxA");
	var messageboxB = document.getElementById("messageboxB");
	var messageboxC = document.getElementById("messageboxC");
	var messageboxD = document.getElementById("messageboxD");
	var loader = document.getElementById("loader");
	
	messageboxD.innerText = "";
	loader.hidden = true;
	
	if(checkUserType(logintypeselect," Please select your login type ")) {
		if(checkCredentials(usernametxt," Please enter a valid User ID ")) {
			if(checkCredentials(passwordtxt," Please enter a valid Password ")) {
				return true;
			}
		}
	}
	
	return false;
}

function checkUserType(input, message) {
	if(input.value == "") {
		messageboxA.innerText = message;
		input.focus();
		input.scrollIntoView();
		return false;
	}
	else {
		messageboxA.innerText = "";
		return true;
	}
}

function checkCredentials(inputText, message) {
	if(inputText == usernametxt) {
		if(inputText.value.length == 0) {
			messageboxB.innerText = message;
			inputText.focus();
			inputText.scrollIntoView();
			return false;
		}
		else {
			messageboxB.innerText = "";
			return true;
		}
	}
	if(inputText == passwordtxt) {
		if(inputText.value.length == 0) {
			messageboxC.innerText = message;
			inputText.focus();
			inputText.scrollIntoView();
			return false;
		}
		else {
			messageboxC.innerText = "";
			return true;
		}
	}
	return true;
}