function isBlanked(value) {
  return value === "" ? true : false;
}
function isValid(check_username, email, confirm_pswd, pswd, radio_checked) {
  return check_username === true &&
    email === true &&
    confirm_pswd === true &&
    pswd === true &&
    radio_checked === true
    ? true
    : false;
}
function isBetween(length, min, max) {
  return length > min && length < max;
}
function correct_username(st) {
  var count = 0;
  for (var i = 0; i < st.length; i++) {
    if (st.charAt(i) >= "a" && st.charAt(i) <= "z") count++;
    if (st.charAt(i) >= "A" && st.charAt(i) <= "Z") count++;
  }
  return count == st.length;
}
function checkUsername(usernameEl) {
  var valid = false;

  const min = 5,
    max = 25;

  const username = usernameEl.value;

  if (isBlanked(username)) {
    document.getElementById("feedback-username").style.color = "red";
    document.getElementById("feedback-username").textContent =
      "Username cannot be blank!";
  } else if (!isBetween(username.length, min, max)) {
    document.getElementById("feedback-username").style.color = "red";
    document.getElementById("feedback-username").textContent = "Username must be between " + min + " and " + max +  " characters!";
  } else if (!correct_username(username)) {
    document.getElementById("feedback-username").style.color = "red";
    document.getElementById("feedback-username").textContent =
      "Username must have only english characters!";
  } else {
    valid = true;
    document.getElementById("feedback-username").style.color = "green";
    document.getElementById("feedback-username").textContent = "Good!";
  }

  return valid;
}
function notTogether(st) {
  var n1, n2;
  n1 = st.indexOf("@");
  n2 = st.indexOf(".");
  if (Math.abs(n1 - n2) == 1) return false;
  return true;
}
function count_special_characters(st) 
{
  var count_shtrudel = 0;
  var count_dot = 0;

  for (var i = 0; i < st.length; i++) 
  {
    if (st.charAt(i) == "@") {
      count_shtrudel += 1;
    } else if (st.charAt(i) == ".") {
      count_dot += 1;
    }
    if (count_dot > 1 || count_shtrudel > 1) return false;
  }
  return true;
}
function correctEmail(st) {
  var count = 0;
  for (var i = 0; i < st.length; i++) {
    if (st.charAt(i) >= "a" && st.charAt(i) <= "z") count++;
    if (st.charAt(i) >= "0" && st.charAt(i) <= "9") count++;
    if (st.charAt(i) >= "A" && st.charAt(i) <= "Z") count++;
    if (
      st.charAt(i) == "." ||
      st.charAt(i) == "_" ||
      st.charAt(i) == "@" ||
      st.charAt(i) == "-"
    )
      count++;
  }
  if (count == st.length) return true;
  return false;
}

function notBeginEnd(st) {
  if (st.indexOf("@") == 0 || st.indexOf("@") == st.length - 1) return false;
  if (st.indexOf(".") == 0 || st.lastIndexOf(".") == st.length - 1)
    return false;
  return true;
}
function check_special(st) {
  return st.indexOf("@") != -1 && st.indexOf(".") != -1;
}

function checkEmail(emailEl) {
  var valid = false;
  const email = emailEl.value;
  if (isBlanked(email)) {
    document.getElementById("feedback-email").style.color = "red";
    document.getElementById("feedback-email").textContent =
      "Email cannot be blank!";
  } else if (!count_special_characters(email)) {
    document.getElementById("feedback-email").style.color = "red";
    document.getElementById("feedback-email").textContent =
      "email cant have more then one @ or .";
  } else if (!check_special(email)) {
    document.getElementById("feedback-email").style.color = "red";
    document.getElementById("feedback-email").textContent =
      "email need to have one @ and .";
  } else if (!notBeginEnd(email)) {
    document.getElementById("feedback-email").style.color = "red";
    document.getElementById("feedback-email").textContent =
      "Email cannot end or strat with a . or a @";
  } else if (!correctEmail(email)) {
    document.getElementById("feedback-email").style.color = "red";
    document.getElementById("feedback-email").textContent =
      "Email contains restricted characters!";
  } else if (!notTogether(email)) {
    document.getElementById("feedback-email").style.color = "red";
    document.getElementById("feedback-email").textContent =
      "email cant have @ and . together!";
  } else {
    valid = true;
    document.getElementById("feedback-email").textContent = "Good!";
    document.getElementById("feedback-email").style.color = "green";
  }

  return valid;
}
function contains_a_number(password) {
  const regex = /\d/;

  // Check if string contians numbers
  const doesItHaveNumber = regex.test(password);
  return doesItHaveNumber;
}
function contains_special_character(password) {
  var format = /[!@#$%^&*()_+\-=\[\]{};':"\\|,.<>\/?]+/;
  return format.test(password);
}
function checkPassword(passwordEl) {
  var valid = false;
  const password = passwordEl.value;
  if (isBlanked(password)) {
    document.getElementById("feedback-password").style.color = "red";
    document.getElementById("feedback-password").textContent =
      "Password cannot be blank!";
  } else if (password.length < 8) {
    document.getElementById("feedback-password").style.color = "red";
    document.getElementById("feedback-password").textContent =
      "Password length needs to be at least 8 chracters!";
  } else if (!contains_a_number(password)) {
    document.getElementById("feedback-password").style.color = "red";
    document.getElementById("feedback-password").textContent =
      "password needs to have at least one number!";
  } else if (!contains_special_character(password)) {
    document.getElementById("feedback-password").style.color = "red";
    document.getElementById("feedback-password").textContent =
      "password needs to have at least one special character!";
  } else {
    valid = true;
    document.getElementById("feedback-password").style.color = "green";
    document.getElementById("feedback-password").textContent = "Good!";
  }
  return valid;
}

function checkConfirmPassword(passwordEl, confirmPasswordEl) {
  var valid = false;

  // check confirm password
  const confirmPassword = confirmPasswordEl.value;
  const password = passwordEl.value;

  if (isBlanked(confirmPassword)) {
    document.getElementById("feedback-confirm-password").style.color = "red";
    document.getElementById("feedback-confirm-password").textContent =
      "Please enter the password again!";
  } else if (password !== confirmPassword) {
    document.getElementById("feedback-confirm-password").style.color = "red";
    document.getElementById("feedback-confirm-password").textContent =
      "The password does not match!";
  } else {
    valid = true;
    document.getElementById("feedback-confirm-password").style.color = "green";
    document.getElementById("feedback-confirm-password").textContent = "Good!";
  }

  return valid;
}
function checkButtons(input_type, lable_name, feedback_message) {
  var buttons = document.querySelectorAll(input_type);
  for (var i = 0; i < buttons.length; i++) {
    if (buttons[i].checked) 
    {
      document.getElementById(lable_name).textContent = "Good!";
      document.getElementById(lable_name).style.color = "green";
      return true;
    };
  }
  document.getElementById(lable_name).style.color = "red";
  document.getElementById(lable_name).textContent = feedback_message;
  return false;
}
//this is the main function
document.querySelector("form").addEventListener("submit", function (event) {
  const usernameEl = document.getElementById("username");
  const emailEl = document.getElementById("email");
  const passwordEl = document.getElementById("password");
  const confirmPasswordEl = document.getElementById("confirm-password");
  var check_username = checkUsername(usernameEl);
  var email = checkEmail(emailEl);
  var pswd = checkPassword(passwordEl);
  var confirm_pswd = checkConfirmPassword(passwordEl, confirmPasswordEl);
  var radio_checked = checkButtons(
    "input[type=radio]",
    "feedback-time-period",
    "you need to choose an option!"
  );

  if (!isValid(check_username, email, pswd, confirm_pswd, radio_checked)) 
       event.preventDefault();
  
});

document.querySelector(".cancelbtn").addEventListener("click", function () {
  document.getElementById("feedback-username").textContent = null;
  document.getElementById("feedback-email").textContent = null;
  document.getElementById("feedback-password").textContent = null;
  document.getElementById("feedback-confirm-password").textContent = null;
  document.getElementById("username").value = null;
  document.getElementById("email").value = null;
  document.getElementById("password").value = null;
  document.getElementById("confirm-password").value = null;
  disableRadioButtons("input[type=radio]", "feedback-time-period");
});
function disableRadioButtons(input_type, label_name) {
  var buttons = document.querySelectorAll(input_type);
  for (var i = 0; i < buttons.length; i++) buttons[i].checked = false;
  document.getElementById(label_name).innerHTML = null;
};
