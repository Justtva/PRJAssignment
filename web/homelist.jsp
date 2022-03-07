<%-- 
    Document   : homelist
    Created on : Mar 6, 2022, 2:57:12 AM
    Author     : Bi
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="model.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%
            ArrayList<Product> products = (ArrayList<Product>)request.getAttribute("products");
        %>
    </head>
    <body>
        <table border="1px">
            <tr>
                <td>Mã số</td>
                <td>Tên</td>
                <td>Giá nhập</td>
                <td>Giá bán</td>
                <td>Số lượng còn</td>

            </tr>
            <%for (Product p : products) {%>
            <tr>
                <td><%=p.getId()%></td>  
                <td><%=p.getName()%></td>     
                <td><%=p.getImport_price()%></td>
                <td><%=p.getSell_price()%></td>
                <td><%=p.getQuantity()%></td>
            </tr>
            <%}%>
        </table>
    </body>
</html>
