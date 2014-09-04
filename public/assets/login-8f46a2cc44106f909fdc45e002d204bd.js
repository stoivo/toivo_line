var submit_score = {username: false, epost: false, password: false}

function checkPasswordMatch() {
  var password = $("#password").val();
  var confirmPassword = $("#confirm_password").val();

  if (password != confirmPassword) {
    $("#divCheckPasswordMatch").html("Passwords do not match!");
    submit_score["password"] = false
  } else {
    $("#divCheckPasswordMatch").html("Passwords match.");
    submit_score["password"] = true
  }
  if (password.length < 3 || password.length > 30) {
    $("#divCheckPasswordMatch").html("Passwords have to be longer than 4, and less than 30");
    submit_score["password"] = false
  }
  show_hide_submit()
}
function checkEpost() {
    var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    if (re.test($("#user_epost").val())) {
      submit_score.epost = true
    } else {
      submit_score.epost = false
    }
    show_hide_submit()
}
function checkUsername() {
  var length_of_username = $('#user_username').val().length
  if (length_of_username >= 3 && length_of_username <= 26) {
    submit_score.username = true
  } else {
    submit_score.username = false
  }
  show_hide_submit()
}

function show_hide_submit(){
    if (submit_score.username && submit_score.epost && submit_score.password) {
      $('#submit_button').show()
    } else{
      $('#submit_button').hide()
    }
  }

$(document).ready(function () {
  $("#password").change(function() { checkPasswordMatch() })
  $("#confirm_password").change(function() { checkPasswordMatch() })
  $("#user_epost").change(function() { checkEpost() })
  $("#user_username").change(function() { checkUsername() })
});

