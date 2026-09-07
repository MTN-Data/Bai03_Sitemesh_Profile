<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Thêm danh mục</title>
</head>

<body>

<h2>Thêm danh mục</h2>

<form
    action="${pageContext.request.contextPath}/admin/category/add"
    method="post"
    enctype="multipart/form-data">

    <p>
        <label>Tên danh mục:</label>

        <input
            type="text"
            name="name"
            required>
    </p>

    <p>
        <label>Ảnh đại diện:</label>

        <input
            type="file"
            name="icon">
    </p>

    <button type="submit">
        Thêm
    </button>

    <button type="reset">
        Hủy
    </button>

</form>

<br>

<a href="${pageContext.request.contextPath}/admin/category/list">
    Quay lại
</a>

</body>

</html>