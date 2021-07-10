<%-- 
    Document   : login.jsp
    Created on : Mar 9, 2021, 2:00:53 PM
    Author     : congfptu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Website Chấm Công</title>
  <link href="./css/login.css" rel="stylesheet" type="text/css"/>
</head>
<body>

<h2> Quản lí Công Trình</h2>
<div class="login_form">
<form action="login" method="post">
  <div class="imgcontainer">
    <img src="img/user.png" alt=""/>
  </div>

  <div class="container">
    <p class="text-danger">${requestScope.mess}</p>
    <label for="uname"><b>Username</b></label>
    <input type="text" placeholder="Enter Username" name="username" required>
    <label for="psw"><b>Password</b></label>
    <input type="password" placeholder="Enter Password" name="password" required>
    <button type="submit">Login</button>
    <label>
      <input type="checkbox" checked="checked" name="remember"> Remember me
    </label>
  </div>

  <div class="container" style="background-color:#f1f1f1">
     <a href="forgotpassword">Forgot password?</a>
  </div>
</form>
</div>
</body>
</html>
