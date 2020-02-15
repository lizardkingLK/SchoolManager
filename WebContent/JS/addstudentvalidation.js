function validateAddStudent(form) {
	var addstudentnametxt = document.getElementById('addstudentnametxt');
	var addstudentgradeselect = document.getElementById('addstudentgradeselect');
	var addstudentbirthdatetxt = document.getElementById('addstudentbirthdatetxt');
	var addstudentphonetxt = document.getElementById('addstudentphonetxt');
	var addstudentaddresstxt = document.getElementById('addstudentaddresstxt');
	var messageName = document.getElementById('messageName');
	var messageGrade = document.getElementById('messageGrade');
	var messageBirthdate = document.getElementById('messageBirthdate');
	var messagePhone = document.getElementById('messagePhone');
	var messageAddress = document.getElementById('messageAddress');
	
	if(checkAddString(addstudentnametxt," *Enter Student's Name* ")) {
		if(checkAddSelection(addstudentgradeselect," *Select Grade of Student* ")) {
			if(checkAddString(addstudentbirthdatetxt," *Enter Student's birthdate* ")) {
				if(checkAddString(addstudentphonetxt," *Enter phone number* ")) {
					if(checkAddString(addstudentaddresstxt," *Enter home address* ")) {
						return true;
					}
				}
			}
		}
	}
	return false;
		
}

function checkAddString(inputText,message) {
	if(inputText == addstudentnametxt) {
		if(inputText.value.length == 0) {
			messageName.innerText = message;
			inputText.focus();
			inputText.scrollIntoView();
			return false;
		}
		else {
			messageName.innerText = "";
			return true;
		}
	}
	else if(inputText == addstudentbirthdatetxt) {
		if(inputText.value.length == 0) {
			messageBirthdate.innerText = message;
			inputText.focus();
			inputText.scrollIntoView();
			return false;
		}
		else {
			messageBirthdate.innerText = "";
			return true;
		}
	}
	else if(inputText == addstudentphonetxt) {
		if(inputText.value.length == 0) {
			messagePhone.innerText = message;
			inputText.focus();
			inputText.scrollIntoView();
			return false;
		}
		else {
			messagePhone.innerText = "";
			return true;
		}
	}
	else if(inputText == addstudentaddresstxt) {
		if(inputText.value.length == 0) {
			messageAddress.innerText = message;
			inputText.focus();
			inputText.scrollIntoView();
			return false;
		}
		else {
			messageAddress.innerText = "";
			return true;
		}
	}
}

function checkAddSelection(input, message) {
	if(input.value == "") {
		messageGrade.innerText = message;
		input.focus();
		input.scrollIntoView();
		return false;
	}
	else {
		messageGrade.innerText = "";
		return true;
	}
}

