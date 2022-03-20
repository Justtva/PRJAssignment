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
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <link href="../css/index.css" rel="stylesheet" type="text/css"/>
        <%
            ArrayList<Product> products = (ArrayList<Product>) request.getAttribute("products");
        %>
        <script>

            function deleteProduct(id) {
                var result = confirm("Xác nhận xóa hàng!");
                if (result) {
                    window.location.href = 'delete?id=' + id;
                }
            }
        </script>
    </head>

    <body>
        <%@include file="include/navProductList.jsp"%>
        <div class="container">
            <table class="table table-hover">
                <thead class="table-primary fw-bold">           
                <tr>
                    <td>Mã số</td>
                    <td>Tên</td>
                    <td>Giá nhập</td>
                    <td>Giá bán</td>
                    <td>Đại lý</td>
                    <td>Ngày nhập</td>
                    <td>Hạn sử dụng</td>
                    <td>Số lượng còn</td>
                    <td></td>
                    <td></td>
                </tr>
                </thead>
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
                    <td><a href="update?id=<%=p.getId()%>">Sửa</td>
                    <td><a href="#" onclick="deleteProduct(<%=p.getId()%>)">Xóa</td>
                </tr>
                <%}%>
            </table>
        </div>

    </body>
</html>
