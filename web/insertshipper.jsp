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
        <script src="../js/pagger.js" type="text/javascript"></script>
        <link href="../css/pagger.css" rel="stylesheet" type="text/css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <link href="../css/index.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <%@include file="include/navInsertShipper.jsp"%>
        <div class="container">
            <form action="../shipper/insert" method="post" class="form row">
                <div class="mb-3">
                    <div class="row">
                        <div class="col-3">
                            <label for="id" class="form-label">Mã số</label>
                            <input type="text" class="form-control" name="id" placeholder="" id="id">
                        </div>
                        <div class="col-9">
                            <label for="name" class="form-label">Tên người giao hàng</label>
                            <input type="text" class="form-control" name="name" placeholder="" id="name">
                        </div>
                    </div>
                </div> 
                
                <div class="mb-3">
                    <label for="number" class="form-label">Số điện thoại</label>
                    <input type="text" class="form-control" name="number" id="number" placeholder="">
                </div>
                <div class="mb-3">
                    <label for="address" class="form-label">Địa chỉ</label>
                    <input type="text" class="form-control" name="address" id="address" placeholder="">
                </div>
                           
                <div class="col-12">
                    <button type="submit" class="btn btn-primary">Lưu</button>
                </div>
<!--            <form action="../shipper/insert" method="post">
                Mã số:<input type="text" name="id"></br>
                Tên người giao hàng:<input type="text" name="name"></br>
                Số điện thoại:<input type="text" name="number"></br>
                Địa chỉ:<input type="text" name="address"></br>
                <input type="submit" value="Thêm">
            </form>-->
        </div>
    </body>
</html>
