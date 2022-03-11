<%-- 
    Document   : homelist
    Created on : Mar 6, 2022, 2:57:12 AM
    Author     : Bi
--%>

<%@page import="model.OrderDetail"%>
<%@page import="model.Order"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%
            ArrayList<Product> products = (ArrayList<Product>) request.getAttribute("products");
            Order order = (Order) session.getAttribute("order");
            if (order == null) {
                order = new Order();
            }
        %>
    </head>
    <table>
        <tr><a href="product/import">Nhập hàng</a></tr>
        <tr><a href="listshipper">Đại lý</a></tr>
        <tr></tr>
    </table>
    
    <body>
        <table border="1px">
            <tr>
                <td>Mã số</td>
                <td>Tên</td>
                <td>Giá nhập</td>
                <td>Giá bán</td>
                <td>Ngày nhập hàng</td>
                <td>Hạn sử dụng</td>
                <td>Số lượng còn</td>

            </tr>
            <%for (Product p : products) {%>
            <tr>
                <td><%=p.getId()%></td>  
                <td><%=p.getName()%></td>     
                <td><%=p.getImport_price()%></td>
                <td><%=p.getSell_price()%></td>
                <td><%=p.getImportDate()%></td>
                <td><%=p.getExpireDate()%></td>
                <td><%=p.getQuantity()%></td>
                <td>
                    <form action="product/cart" method="POST">
                        <input type="hidden" value="<%=p.getId()%>" name="id"/>
                        <input type="submit" value="Thêm"/>
                    </form>
                </td>
            </tr>
            <%}%>
        </table>
        </br>
        <%if (order.getDetails().size()!=0) {%>     
        <table border="1px">
            <tr>
                <td>Name</td>
                <td>Quantity</td>
                <td>Price</td>
                <td>Total</td>

            </tr>
            <%for (OrderDetail od : order.getDetails()) {%>
            <tr>
                <td><%=od.getProduct().getName()%></td>
                <td><%=od.getQuantity()%></td>
                <td><%=od.getProduct().getSell_price()%></td>
                <td><%=od.getTotal()%></td>
            </tr>        
            <%}%>
            <tr>
                <td colspan ="3"></td>
                <td><%=order.getTotal()%></td>
            </tr>          
        </table>  
        <table>
            <tr>
                <td><form action="confirmorder" method="POST">               
                        <input type="submit" value="Thanh toán">
                    </form>
                </td>
                <td><form action="cancelorder" method="POST">               
                        <input type="submit" value="Hủy hóa đơn">
                    </form>              
                </td>
            </tr>
        </table>
        <%} else {%>
        Chưa có hàng nào!
        <%}%>
    </body>
</html>
