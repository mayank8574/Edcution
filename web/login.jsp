<%
session.setAttribute("uid",null);
if(session.getAttribute("msg")==null)
    {
        session.setAttribute("msg","");
        
        
     }  
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title> Login Form </title>
  <link rel="stylesheet" href="login\style.css">
  <style>
    .error {
	color: #ff0000;
	font-style: italic;
	font-weight: bold;

	text-align: left;
      }
   </style>

</head>
<body>
  <div class="wrapper">
    <form action="Login" method="post"  name="form" >
      <h2>Login</h2>
      <h3 align="center" class="error"><%=(String)session.getAttribute("msg")%></h3>
        <div class="input-field">
        <input type="text" name="email" id="email" required>
        <label>Enter your email</label>
      </div>
      <div class="input-field">
        <input type="password" name="password" id="password" required>
        <label>Enter your password</label>
      </div>
      <div class="forget">
        <label for="remember">
          <input type="checkbox" id="remember">
          <p>Remember me</p>
        </label>
        <a href="">Forgot password?</a>
      </div>
      <button type="submit">Log In</button>
      <div class="register">
        <p>Don't have an account? <a href="#">Register</a></p>
      </div>
    </form>
  </div>
</body>
</html>
<%
    session.setAttribute("msg",null);
%>
