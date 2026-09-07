<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c"
    uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">
<title>Chỉnh sửa danh mục</title>

<style>

body {
    margin: 0;
    font-family: Arial, sans-serif;
    background: #f5f5f5;
}

.container {
    width: 85%;
    margin: 40px auto;
    background: white;
    border: 1px solid #ddd;
}

.panel-title {
    background: #f5f5f5;
    border-bottom: 1px solid #ddd;
    padding: 18px 25px;
    font-size: 22px;
}

.form-content {
    padding: 35px 28px 25px;
}

h1 {
    font-size: 34px;
    font-weight: normal;
    margin: 10px 0 15px;
}

label {
    display: block;
    font-size: 20px;
    font-weight: bold;
    margin: 12px 0 8px;
}

.text-input {
    width: 100%;
    height: 48px;
    padding: 10px 15px;
    font-size: 20px;
    border: 1px solid #ccc;
    border-radius: 5px;
}

.category-image {
    width: 145px;
    height: 130px;
    object-fit: contain;
    margin: 25px 0 5px;
}

.file-input {
    font-size: 17px;
}

.buttons {
    margin-top: 20px;
}

button {
    padding: 11px 22px;
    font-size: 18px;
    border-radius: 5px;
    cursor: pointer;
}

.edit-button {
    background: white;
    border: 1px solid #ccc;
}

.reset-button {
    background: #0b9bd7;
    border: 1px solid #0b9bd7;
    color: white;
}

</style>

</head>


<body>

<div class="container">

    <div class="panel-title">
        Chỉnh sửa danh mục
    </div>

    <div class="form-content">

        <h1>
            Danh mục:
        </h1>

        <form
            action="${pageContext.request.contextPath}/admin/category/edit"
            method="post"
            enctype="multipart/form-data">

            <input
                type="hidden"
                name="id"
                value="${category.id}">


            <label>
                Tên danh sách:
            </label>

            <input
                class="text-input"
                type="text"
                name="name"
                value="${category.name}"
                required>


            <c:if test="${not empty category.icon}">

                <div>

                    <img
                        class="category-image"
                        src="${pageContext.request.contextPath}/image?fname=${category.icon}">

                </div>

            </c:if>


            <label>
                Ảnh đại diện
            </label>

            <input
                class="file-input"
                type="file"
                name="icon">


            <div class="buttons">

                <button
                    class="edit-button"
                    type="submit">
                    Edit
                </button>

                <button
                    class="reset-button"
                    type="reset">
                    Reset
                </button>

            </div>

        </form>

    </div>

</div>

</body>
</html>