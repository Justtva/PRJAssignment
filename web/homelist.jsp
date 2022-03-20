<%-- 
    Document   : homelist
    Created on : Mar 6, 2022, 2:57:12 AM
    Author     : Bi
--%>

<%@page import="java.sql.Date"%>
<%@page import="model.OrderDetail"%>
<%@page import="model.Order"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <%@include file="include/header.jsp"%>

    <body>
        <%
            ArrayList<Product> products = (ArrayList<Product>) request.getAttribute("products");
            ArrayList<Order> orders = (ArrayList<Order>) request.getAttribute("orders");
            Order order = (Order) session.getAttribute("order");
            float dayEarning = 0;
            long millis = System.currentTimeMillis();
            String todaydate = new Date(millis).toString();
            for (Order o : orders) {
                if (o.getDate().toString().equals(todaydate)) {
                    dayEarning += o.getEarning();
                }
            }
            if (order == null) {
                order = new Order();
            }
            String message = (String) request.getAttribute("alertMsg");
        %>
        <%@include file="include/nav.jsp"%>
        <%if (message != null) {%>
        <script type="text/javascript">
            var msg = "<%=message%>";
            alert(msg);
        </script>
        <%}%>
        <div class="container">
            <div class="card mb-5 header-card">
                <div class="row">
                    <div class="card-body col-5 text-center">
                        <p>Tiền lãi trong ngày</p>
                        <h2><%=dayEarning%>k / 50k 
                        </h2>
                    </div>                       
                    <% if (dayEarning < 50) {%>
                    <div class="card_background col-7"><img src="img/IMG_0204.PNG" alt=""/></div>                                      
                    <%}else{%>
                    <div class="card_background col-7"><img src="img/IMG_0203 (1).PNG" alt=""/></div>  
                    <%}%>
                </div>
            </div>

            <div class="row">
                <div class="col-8">
                    <table class="table table-hover">
                        <thead class="table-primary fw-bold">
                            <tr>
                                <td>Mã số</td>
                                <td>Tên</td>
                                <td>Giá bán</td>
                                <td>Đại lý</td>
                                <td>Hạn sử dụng</td>
                                <td>Số lượng còn</td>
                                <td></td>
                            </tr>
                        </thead>
                        <tbody>
                            <%for (Product p : products) {%>
                            <tr>
                                <td><%=p.getId()%></td>  
                                <td><%=p.getName()%></td>     
                                <td><%=p.getSell_price()%></td>
                                <td><a href="shipper/view?id=<%=p.getShipper().getId()%>"><%=p.getShipper().getName()%></td>
                                <td><%=p.getExpireDate()%></td>
                                <td><%=p.getQuantity()%></td>
                                <td>
                                    <form action="product/cart" method="POST">
                                        <input type="hidden" value="<%=p.getId()%>" name="id"/>
                                        <button type="submit" class="btn btn-outline-dark">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-plus-circle" viewBox="0 0 16 16">
                                            <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                                            <path d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"/>
                                            </svg>
                                            Thêm
                                        </button>
                                    </form>
                                </td>
                                <%if (p.getExpireDate().toString().equals(todaydate)) {%>
                                <td>Hết hạn</td>
                                <%}%>
                            </tr>
                            <%}%>
                        </tbody>
                    </table>
                </div>

                <div class="col-4">
                    <%if (order.getDetails().size() != 0) {%>
                    <div class="sticky-top">
                        <table class="table table-hover">
                            <thead class="table-primary fw-bold">
                                <tr>
                                    <td>Tên</td>
                                    <td>Số lượng</td>
                                    <td>Giá</td>
                                    <td>Tổng cộng</td>
                                </tr>
                            </thead>
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
                        <div class="row mt-4">
                            <form action="confirmorder" class="col" method="POST">               
                                <button type="submit" class="col btn btn-primary">
                                    Thanh toán
                                </button>
                            </form>
                            <form action="cancelorder" class="col" method="POST">               
                                <button type="submit" class="col btn btn-outline-danger">
                                    Hủy hóa đơn
                                </button>
                            </form>
                        </div>
                    </div>

                </div>
            </div>


            <%}%>




            <%@include file="include/footer.jsp" %>
        </div>
    </body>
</html>
