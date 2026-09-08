<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>

<%@ taglib prefix="c"
    uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">
<title>Sửa sản phẩm</title>

<link
    href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
    rel="stylesheet">

</head>

<body class="bg-light">

<div class="container py-5">

<div class="card shadow-sm mx-auto"
     style="max-width:800px;">

<div class="card-body p-4">

    <h2 class="mb-4">
        Sửa sản phẩm
    </h2>

    <form
        action="${pageContext.request.contextPath}/admin/product/edit"
        method="post"
        class="needs-validation"
        novalidate>

        <input
            type="hidden"
            name="productId"
            value="${product.productId}">

        <div class="mb-3">

            <label class="form-label">
                Tên sản phẩm
            </label>

            <input
                type="text"
                name="productName"
                class="form-control"
                value="${product.productName}"
                minlength="2"
                maxlength="150"
                pattern=".*\S.*"
                required>

            <div class="invalid-feedback">
                Tên sản phẩm phải có ít nhất 2 ký tự.
            </div>

        </div>

        <div class="mb-3">

            <label class="form-label">
                Hình ảnh
            </label>

            <input
                type="text"
                name="images"
                class="form-control"
                maxlength="255"
                value="${product.images}">

        </div>

        <div class="mb-3">

            <label class="form-label">
                Giá
            </label>

            <input
                type="number"
                name="price"
                class="form-control"
                value="${product.price}"
                min="0"
                max="9999999999"
                step="0.01"
                required>

            <div class="invalid-feedback">
                Giá phải lớn hơn hoặc bằng 0.
            </div>

        </div>

        <div class="mb-3">

            <label class="form-label">
                Mô tả
            </label>

            <textarea
                name="description"
                class="form-control"
                maxlength="1000"
                rows="4">${product.description}</textarea>

        </div>

        <div class="mb-4">

            <label class="form-label">
                Danh mục
            </label>

            <select
                name="cateId"
                class="form-select"
                required>

                <c:forEach
                    var="cate"
                    items="${cateList}">

                    <option
                        value="${cate.id}"
                        ${cate.id == product.cateId ? 'selected' : ''}>

                        ${cate.name}

                    </option>

                </c:forEach>

            </select>

            <div class="invalid-feedback">
                Vui lòng chọn danh mục.
            </div>

        </div>

        <div class="d-flex gap-2">

            <a
                href="${pageContext.request.contextPath}/admin/product/list"
                class="btn btn-outline-secondary">

                Quay lại

            </a>

            <button
                type="submit"
                class="btn btn-primary ms-auto">

                Cập nhật

            </button>

        </div>

    </form>

</div>
</div>
</div>

<script>

(() => {

    const form =
        document.querySelector('.needs-validation');

    form.addEventListener('submit', event => {

        if (!form.checkValidity()) {

            event.preventDefault();
            event.stopPropagation();

        }

        form.classList.add('was-validated');

    });

})();

</script>

</body>
</html>