<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>

<%@ taglib prefix="c"
    uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">
<title>Chỉnh sửa danh mục</title>

<link
    href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
    rel="stylesheet">

<style>

.category-image {
    width: 150px;
    height: 130px;
    object-fit: contain;
    border: 1px solid #ddd;
    border-radius: 8px;
}

</style>

</head>

<body class="bg-light">

<div class="container py-5">

<div class="card shadow-sm mx-auto"
     style="max-width:750px;">

<div class="card-body p-4">

    <h2 class="mb-4">
        Chỉnh sửa danh mục
    </h2>

    <form
        action="${pageContext.request.contextPath}/admin/category/edit"
        method="post"
        enctype="multipart/form-data"
        class="needs-validation"
        novalidate>

        <input
            type="hidden"
            name="id"
            value="${category.id}">

        <div class="mb-3">

            <label class="form-label">
                Tên danh mục
            </label>

            <input
                type="text"
                name="name"
                class="form-control"
                value="${category.name}"
                minlength="2"
                maxlength="100"
                pattern=".*\S.*"
                required>

            <div class="invalid-feedback">
                Tên danh mục phải có ít nhất 2 ký tự.
            </div>

        </div>

        <c:if test="${not empty category.icon}">

            <div class="mb-3">

                <div class="mb-2">
                    Ảnh hiện tại
                </div>

                <img
                    class="category-image"
                    src="${pageContext.request.contextPath}/image?fname=${category.icon}">

            </div>

        </c:if>

        <div class="mb-4">

            <label class="form-label">
                Chọn ảnh mới
            </label>

            <input
                type="file"
                name="icon"
                class="form-control"
                accept=".jpg,.jpeg,.png,.gif">

        </div>

        <div class="d-flex gap-2">

            <a
                href="${pageContext.request.contextPath}/admin/category/list"
                class="btn btn-outline-secondary">

                Quay lại

            </a>

            <button
                type="reset"
                class="btn btn-outline-warning">

                Reset

            </button>

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