<%-- 
    Document   : productdetail
    Created on : Mar 13, 2022, 5:00:18 AM
    Author     : Bi
--%>

<%@page import="model.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%
            ArrayList<Product> products = (ArrayList<Product>) request.getAttribute("products");
        %>
    </head>
    <h1>KHO HÀNG</h1>
    <table>
        <tr><a href="../list"> Cửa hàng</tr>
        <tr><a href="../product/import">Nhập hàng</a></tr>
        <tr><a href="../listshipper">Đại lý</a></tr>
        <tr><a href="../product/detaillist">Kho hàng</a></tr>
    </table>
    <body>
        <table border="1px">
            <tr>
                <td>Mã số</td>
                <td>Tên</td>
                <td>Giá nhập</td>
                <td>Giá bán</td>
                <td>Đại lý</td>
                <td>Ngày nhập</td>
                <td>Hạn sử dụng</td>
                <td>Số lượng còn</td>

            </tr>
            <%for (Product p : products) {%>
            <tr>
                <td><%=p.getId()%></td>  
                <td><%=p.getName()%></td>     
                <td><%=p.getImport_price()%></td>
                <td><%=p.getSell_price()%></td>
                <td><a href="../shipper/view?id=<%=p.getShipper().getId()%>"><%=p.getShipper().getName()%></td>
                <td><%=p.getImportDate()%></td>
                <td><%=p.getExpireDate()%></td>
                <td><%=p.getQuantity()%></td>

            </tr>
            <%}%>
        </table>
    </body>
</html>
