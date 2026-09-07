<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c"
    uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Thêm sản phẩm</title>

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

    .error {
        color: red;
    }
</style>

</head>

<body>

<h2>Thêm sản phẩm</h2>

<c:if test="${not empty error}">
    <p class="error">${error}</p>
</c:if>

<form action="${pageContext.request.contextPath}/admin/product/add"
      method="post">

    <label>Tên sản phẩm:</label>

    <input type="text"
           name="productName"
           required>


    <label>Hình ảnh:</label>

    <input type="text"
           name="images"
           placeholder="Nhập đường dẫn hoặc URL hình ảnh">


    <label>Giá:</label>

    <input type="number"
           name="price"
           min="0"
           step="0.01"
           required>


    <label>Mô tả:</label>

    <textarea name="description"></textarea>


    <label>Danh mục:</label>

    <select name="cateId" required>

        <option value="">
            -- Chọn danh mục --
        </option>

        <c:forEach var="cate" items="${cateList}">

            <option value="${cate.id}">
                ${cate.name}
            </option>

        </c:forEach>

    </select>


    <button type="submit">
        Thêm sản phẩm
    </button>

</form>

<br>

<a href="${pageContext.request.contextPath}/product">
    Quay lại danh sách sản phẩm
</a>

</body>
</html>