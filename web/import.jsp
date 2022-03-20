<%-- 
    Document   : import
    Created on : Mar 12, 2022, 3:00:11 AM
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
        <link href="../css/index.css" rel="stylesheet" type="text/css"/>
        <!--<link href="css/nav.css" rel="stylesheet" type="text/css"/>-->
    </head>

    <body>
        <%@include file="include/navImport.jsp"%>
        <%
            ArrayList<Shipper> shippers = (ArrayList<Shipper>) request.getAttribute("shippers");
        %>
        <div class="container">
            <form action="../product/import" method="post" class="form row">
                <div class="mb-3">
                    <label for="pname" class="form-label">Tên hàng</label>
                    <input type="text" class="form-control" name="pname" id="pname" placeholder="">
                </div>
                <div class="mb-3">
                    <label for="quantity" class="form-label">Số lượng</label>
                    <input type="text" class="form-control" name="quantity" id="quantity" placeholder="">
                </div>
                <div class="mb-3">
                    <div class="row">
                        <div class="col">
                            <label for="import_price" class="form-label">Giá nhập</label>
                            <input type="text" class="form-control" name="import_price" placeholder="" id="import_price">
                        </div>
                        <div class="col">
                            <label for="sell_price" class="form-label">Giá bán</label>
                            <input type="text" class="form-control" name="sell_price" placeholder="" id="sell_price">
                        </div>
                    </div>
                </div>
                <div class="mb-3">
                    <label for="expired_date" class="form-label">Ngày nhập</label>
                    <input type="date" name="expired_date" class="form-control" id="expired_date" placeholder="">
                </div>
                <div class="mb-3">
                    <label for="sid" class="form-label">Người giao hàng</label>
                    <select name="sid" class="form-select" aria-label="Default select example">
                        <%for (Shipper s : shippers) {%>
                        <option value="<%=s.getId()%>"><%=s.getName()%></option>                  
                        <%}%>
                    </select>

                </div>
                <div class="col-12">
                    <button type="submit" class="btn btn-primary">Lưu</button>
                </div>
                <!--                Tên hàng:<input type="text" name="pname"></br>
                                Giá nhập:<input type="text" name="import_price"></br>
                                Số lượng:<input type="text" name="quantity"></br>
                                Giá bán:<input type="text" name="sell_price"></br>
                                Hạn sử dụng:<input type="date" name="expired_date"></br>
                                Người giao hàng: <select name="sid">
                
            </select>
            <input type="submit" value="Lưu">-->
            </form>
        </div>
    </body>
</html>
