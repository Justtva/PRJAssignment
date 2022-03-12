<%-- 
    Document   : insertshipper
    Created on : Mar 13, 2022, 4:25:07 AM
    Author     : Bi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <h1>NHẬP THÊM ĐẠI LÝ</h1>
    <body>
        <form action="../shipper/insert" method="post">
            Mã số:<input type="text" name="id"></br>
            Tên người giao hàng:<input type="text" name="name"></br>
            Số điện thoại:<input type="text" name="number"></br>
            Địa chỉ:<input type="text" name="address"></br>
            <input type="submit" value="Thêm">
        </form>
    </body>
</html>
