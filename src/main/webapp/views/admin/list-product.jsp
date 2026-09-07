<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c"
    uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Quản lý sản phẩm</title>

<style>
    body {
        font-family: Arial, sans-serif;
        margin: 30px;
    }

    table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 20px;
    }

    th, td {
        border: 1px solid #ccc;
        padding: 10px;
        text-align: left;
    }

    th {
        background-color: #eee;
    }

    img {
        width: 80px;
        height: 80px;
        object-fit: cover;
    }

    .add {
        display: inline-block;
        margin-bottom: 10px;
        padding: 8px 15px;
        border: 1px solid #333;
        text-decoration: none;
    }

    a {
        margin-right: 10px;
    }
</style>

</head>

<body>

<h2>Quản lý sản phẩm</h2>

<a class="add"
   href="${pageContext.request.contextPath}/admin/product/add">
    Thêm sản phẩm
</a>

<table>

    <tr>
        <th>ID</th>
        <th>Tên sản phẩm</th>
        <th>Hình ảnh</th>
        <th>Giá</th>
        <th>Mô tả</th>
        <th>Category ID</th>
        <th>Thao tác</th>
    </tr>

    <c:forEach var="product" items="${productList}">

        <tr>

            <td>
                ${product.productId}
            </td>

            <td>
                ${product.productName}
            </td>

            <td>
                <c:if test="${not empty product.images}">
                    <img src="${product.images}">
                </c:if>
            </td>

            <td>
                ${product.price}
            </td>

            <td>
                ${product.description}
            </td>

            <td>
                ${product.cateId}
            </td>

            <td>

                <a href="${pageContext.request.contextPath}/admin/product/edit?id=${product.productId}">
                    Sửa
                </a>

                <a href="${pageContext.request.contextPath}/admin/product/delete?id=${product.productId}"
                   onclick="return confirm('Bạn có chắc muốn xóa sản phẩm này?');">
                    Xóa
                </a>

            </td>

        </tr>

    </c:forEach>

</table>

</body>
</html>