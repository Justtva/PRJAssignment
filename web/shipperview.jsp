<%-- 
    Document   : shipperview
    Created on : Mar 13, 2022, 4:43:03 AM
    Author     : Bi
--%>

<%@page import="model.Shipper"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%
        Shipper s = (Shipper)request.getAttribute("shipper");
        %>
    </head>
    <h1>CÔNG TY GIAO HÀNG <%=s.getName()%></h1>
    <body>
        Mã số: <%=s.getId()%></br>
        Tên công ty: <%=s.getName()%></br>
        Số điện thoại: <%=s.getNumber()%></br>
        Địa chỉ: <%=s.getAddress()%>
    </body>
</html>
