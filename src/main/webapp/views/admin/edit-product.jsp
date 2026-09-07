<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c"
    uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Sửa sản phẩm</title>

<style>
    body {
        font-family: Arial, sans-serif;
        margin: 30px;
    }

    form {
        width: 500px;
    }

    label {
        display: block;
        margin-top: 12px;
        margin-bottom: 5px;
    }

    input,
    textarea,
    select {
        width: 100%;
        padding: 8px;
        box-sizing: border-box;
    }

    textarea {
        height: 100px;
    }

    button {
        margin-top: 15px;
        padding: 10px 20px;
    }
</style>

</head>

<body>

<h2>Sửa sản phẩm</h2>

<form action="${pageContext.request.contextPath}/admin/product/edit"
      method="post">

    <input type="hidden"
           name="productId"
           value="${product.productId}">


    <label>Tên sản phẩm:</label>

    <input type="text"
           name="productName"
           value="${product.productName}"
           required>


    <label>Hình ảnh:</label>

    <input type="text"
           name="images"
           value="${product.images}">


    <label>Giá:</label>

    <input type="number"
           name="price"
           value="${product.price}"
           min="0"
           step="0.01"
           required>


    <label>Mô tả:</label>

    <textarea name="description">${product.description}</textarea>


    <label>Danh mục:</label>

    <select name="cateId" required>

        <c:forEach var="cate" items="${cateList}">

            <option value="${cate.id}"
                ${cate.id == product.cateId ? 'selected' : ''}>

                ${cate.name}

            </option>

        </c:forEach>

    </select>


    <button type="submit">
        Cập nhật
    </button>

</form>

<br>

<a href="${pageContext.request.contextPath}/admin/product/list">
    Quay lại danh sách
</a>

</body>
</html>