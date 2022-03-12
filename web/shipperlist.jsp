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
        <%
            ArrayList<Shipper> shippers = (ArrayList<Shipper>) request.getAttribute("shippers");
        %>
    <h1>ĐẠI LÝ</h1>
    <table>
        <tr><a href="../list"> Cửa hàng</tr>
            <tr><a href="product/import">Nhập hàng</a></tr>
            <tr><a href="listshipper">Đại lý</a></tr>
            <tr><a href="product/detaillist">Kho hàng</a></tr>   
    </table>
    <a href="shipper/insert">Thêm giao hàng mới</a>

</head>
<body>

    <table border="1px">
        <tr>
            <td>Mã số</td>
            <td>Tên</td>
            <td>Số điện thoại</td>
            <td>Địa chỉ</td>
        </tr>
        <%for (Shipper s : shippers) {%>
        <tr>
            <td><%=s.getId()%></td>
            <td><%=s.getName()%></td>
            <td><%=s.getNumber()%></td>
            <td><%=s.getAddress()%></td>
        </tr>
        <%}%>   
    </table>
</body>
</html>
