function validateUpdateStudent(form) {
	var updatestudentnametxt = document.getElementById('updatestudentnametxt');
	var updatestudentgradeselect = document.getElementById('updatestudentgradeselect');
	var updatestudentbirthdatetxt = document.getElementById('updatestudentbirthdatetxt');
	var updatestudentphonetxt = document.getElementById('updatestudentphonetxt');
	var updatestudentaddresstxt = document.getElementById('updatestudentaddresstxt');
	var messageupdateName = document.getElementById('messageupdateName');
	var messageupdateGrade = document.getElementById('messageupdateGrade');
	var messageupdateBirthdate = document.getElementById('messageupdateBirthdate');
	var messageupdatePhone = document.getElementById('messageupdatePhone');
	var messageupdateAddress = document.getElementById('messageupdateAddress');
	
	if(checkUpdateString(updatestudentnametxt," *Enter Student's Name* ")) {
		if(checkUpdateSelection(updatestudentgradeselect," *Select Grade of Student* ")) {
			if(checkUpdateString(updatestudentbirthdatetxt," *Enter Student's birthdate* ")) {
				if(checkUpdateString(updatestudentphonetxt," *Enter phone number* ")) {
					if(checkUpdateString(updatestudentaddresstxt," *Enter home address* ")) {
						return true;
					}
				}
			}
		}
	}
	return false;
}

function checkUpdateString(inputText,message) {
	if(inputText == updatestudentnametxt) {
		if(inputText.value.length == 0) {
			messageupdateName.innerText = message;
			inputText.focus();
			inputText.scrollIntoView();
			return false;
		}
		else {
			messageupdateName.innerText = "";
			return true;
		}
	}
	if(inputText == updatestudentbirthdatetxt) {
		if(inputText.value.length == 0) {
			messageupdateBirthdate.innerText = message;
			inputText.focus();
			inputText.scrollIntoView();
			return false;
		}
		else {
			messageupdateBirthdate.innerText = "";
			return true;
		}
	}
	if(inputText == updatestudentphonetxt) {
		if(inputText.value.length == 0) {
			messageupdatePhone.innerText = message;
			inputText.focus();
			inputText.scrollIntoView();
			return false;
		}
		else {
			messageupdatePhone.innerText = "";
			return true;
		}
	}
	if(inputText == updatestudentaddresstxt) {
		if(inputText.value.length == 0) {
			messageupdateAddress.innerText = message;
			inputText.focus();
			inputText.scrollIntoView();
			return false;
		}
		else {
			messageupdateAddress.innerText = "";
			return true;
		}
	}
}

function checkUpdateSelection(input, message) {
	if(input.value == "") {
		messageupdateGrade.innerText = message;
		input.focus();
		input.scrollIntoView();
		return false;
	}
	else {
		messageupdateGrade.innerText = "";
		return true;
	}
}