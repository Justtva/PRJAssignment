<%-- 
    Document   : shipperlist
    Created on : Mar 9, 2022, 4:34:57 AM
    Author     : Bi
--%>

<%@page import="model.Shipper"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <link href="css/index.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <%
            ArrayList<Shipper> shippers = (ArrayList<Shipper>) request.getAttribute("shippers");
        %>
        <%@include file="include/navShipper.jsp"%>

        <div class="container">          
            <table class="table table-hover">
                <thead class="table-primary fw-bold">
                <tr>
                    <td>Mã số</td>
                    <td>Tên</td>
                    <td>Số điện thoại</td>
                    <td>Địa chỉ</td>
                </tr>
                </thead>
                <%for (Shipper s : shippers) {%>
                <tr>
                    <td><%=s.getId()%></td>
                    <td><%=s.getName()%></td>
                    <td><%=s.getNumber()%></td>
                    <td><%=s.getAddress()%></td>
                </tr>
                <%}%>   
            </table>
            <a href="shipper/insert" class="btn btn-primary">
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-plus-circle" viewBox="0 0 16 16">
                <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                <path d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"/>
                </svg>
                Thêm giao hàng mới
            </a>
        </div>
    </body>
</html>
