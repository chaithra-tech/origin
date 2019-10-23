<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Insert title here</title>
     <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
     <script src="https://www.google.com/recaptcha/api.js?render=6Lcaeq8UAAAAADCIDtmDc4yYxrCbbkum1CbDNUnC"></script>
</head>
<body>
Sample login Example (try with username as "admin" and password as "admin" without quart ) <br> <br>
<form action="LoginController" method="post">
    Enter username :<input type="text" name="username"> <br>
    Enter password :<input type="password" name="password"><br>
    <input type="hidden" name="recaptcha" id="recaptcha">
    <input type="submit" id="btn-validate"  value="Login">
    <!--  input type="submit" id="btn-validate" onclick="checkRecaptcha();" value="Login"-->
</form>

<script>
	grecaptcha.ready(function() {
	    grecaptcha.execute('6Lcaeq8UAAAAADCIDtmDc4yYxrCbbkum1CbDNUnC', {action: 'homepage'}).then(function(token) {
	    alert("token :"+token); 
	       if(token){
	    	   var recaptcha  =  document.getElementById('recaptcha');
	    	   //alert("recaptcha "+recaptcha);
	    	   recaptcha.value = token;
	    	   alert("token 1:"+recaptcha.value); 
	    	 //  document.getElementById('recaptcha').value=token; 
	    	  //alert(document.getElementById('recaptcha').value);
	    	 
	       }
	    });
	});
	
	<% 
		/*String st="<script>document.writeln( document.getElementById('recaptcha').value)</script>";
	 	request.setAttribute("recaptchaToken", st);*/
	%>
	/*function checkRecaptcha() {
		alert("in checkRecaptcha"); 
		 var response = grecaptcha.getResponse();
		 alert("response"+response); 
	}*/
	/**$( '#btn-validate' ).click(function(){
		alert("in btn-validate"); 
		  var $captcha = $( '#recaptcha' );
		  alert(captcha); 
		   var   $response = grecaptcha.getResponse();
		  alert(response); 
		  if (response.length === 0) {
		    $( '.msg-error').text( "reCAPTCHA is mandatory" );
		    if( !$captcha.hasClass( "error" ) ){
		      $captcha.addClass( "error" );
		    }
		  } else {
		    $( '.msg-error' ).text('');
		    $captcha.removeClass( "error" );
		    alert( 'reCAPTCHA marked' );
		  }
		})*/
	/*function checkRecaptcha() {
		alert("in checkRecaptcha"); 
		console.log("in checkRecaptcha console"); 
		 var response = grecaptcha.getResponse();
		 alert(response); 
		    $.ajax({
		        type: "POST",
		        url: 'https://www.google.com/recaptcha/api/siteverify',
		        data: {"secret" : "6Lcaeq8UAAAAANLvtS8apEGLyZ8_B3s6ghMKqeJG", "response" : response, "remoteip":"localhost"},
		        contentType: 'application/x-www-form-urlencoded',
		        success: function(data) {
		        	alert(data); 
		        	console.log(data); 
		        },
		        failure: function (data) {
		        	alert("You are a spammer"); 
		            console.log('Captcha error');
		        }
		    });
	}*/
</script>

</body>
</html>