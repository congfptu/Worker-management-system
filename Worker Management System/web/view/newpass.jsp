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
        <title>JSP Page</title>
        <link href="./css/login.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>


        <h2> Quản lí Công Trình</h2>
        <div class="login_form">
            <form action="getpass" method="post">
                <div class="imgcontainer">
                    <img src="../img/user.png" alt=""/>
                </div>

                <div class="container">
                    ${requestScope.mess}
                    <label for="newpass"><b>Username</b></label>
                    <input type="text" name="username" value="${requestScope.username}"readonly="" >
                    <label for="newpass"><b>New PassWord</b></label>
                    <input type="password" placeholder="Enter Password" name="password" required>
                    <label for="psw"><b>Confirm password</b></label>
                    <input type="password" placeholder="Confirm PassWord" name="passwordcf" required>        
                    <button type="submit">Submit</button>
                    <label>
                        <input type="checkbox" checked="checked" name="remember"> Remember me
                    </label>
                </div>

                <div class="container" style="background-color:#f1f1f1">
                    <a href="forgotPass.jsp">Forgot password?</a>
                </div>
            </form>
        </div>
    </body>
</html>
