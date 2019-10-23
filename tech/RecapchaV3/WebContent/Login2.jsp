<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Insert title here</title>
     <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
      <script src="https://www.google.com/recaptcha/api.js?render=put your site key here"></script>
</head>
<body>
Sample login Example (try with username as "admin" and password as "admin" without quart ) <br> <br>
<form id="comment_form" action="LoginController" method="post">
    Enter username :<input type="text" name="username"> <br>
    Enter password :<input type="password" name="password"><br>
    <div class="g-recaptcha" data-sitekey="6Lcaeq8UAAAAADCIDtmDc4yYxrCbbkum1CbDNUnC"></div>
    <input type="submit" value="Login">
</form>

<script>
       // when form is submit
    $('#comment_form').submit(function() {
        // we stoped it
        event.preventDefault();
        var email = $('#email').val();
        var comment = $("#comment").val();
        // needs for recaptacha ready
        grecaptcha.ready(function() {
            // do request for recaptcha token
            // response is promise with passed token
            grecaptcha.execute('6Lcaeq8UAAAAADCIDtmDc4yYxrCbbkum1CbDNUnC', {action: 'create_comment'}).then(function(token) {
                // add token to form
                $('#comment_form').prepend('<input type="hidden" name="g-recaptcha-response" value="' + token + '">');
                    $.post("form.php",{email: email, comment: comment, token: token}, function(result) {
                            console.log(result);
                            if(result.success) {
                                    alert('Thanks for posting comment.')
                            } else {
                                    alert('You are spammer ! Get the @$%K out.')
                            }
                    });
            });;
        });
  });
  </script>

</body>
</html>