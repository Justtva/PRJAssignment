<%-- 
    Document   : login
    Created on : Mar 6, 2022, 2:34:46 AM
    Author     : Bi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="logins" method="post">
            Tên đăng nhập: <input type="text" name="username"/><br/>
            Mật khẩu: <input type="password" name="password"/><br/>
            <input type="submit" value="Đăng Nhập"/>
        </form>
    </body>
</html>
