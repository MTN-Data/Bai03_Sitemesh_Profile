<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c"
    uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Chi tiết sản phẩm</title>

<style>
    body {
        font-family: Arial, sans-serif;
        margin: 30px;
    }

    .detail {
        width: 600px;
    }

    .detail img {
        width: 300px;
        height: 300px;
        object-fit: cover;
        margin-bottom: 20px;
    }

    .name {
        font-size: 26px;
        font-weight: bold;
    }

    .price {
        color: red;
        font-size: 22px;
        font-weight: bold;
        margin-top: 10px;
    }

    .description {
        margin-top: 20px;
        line-height: 1.6;
    }
</style>

</head>

<body>

<h2>Chi tiết sản phẩm</h2>

<div class="detail">

    <c:if test="${not empty product.images}">
        <img src="${product.images}"
             alt="${product.productName}">
    </c:if>

    <div class="name">
        ${product.productName}
    </div>

    <div class="price">
        ${product.price} VNĐ
    </div>

    <div class="description">
        ${product.description}
    </div>

    <p>
        Category ID: ${product.cateId}
    </p>

</div>

<br>

<a href="${pageContext.request.contextPath}/product">
    Quay lại danh sách sản phẩm
</a>

</body>
</html>