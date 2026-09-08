<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">
<title>Thêm danh mục</title>

<link
    href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
    rel="stylesheet">

</head>

<body class="bg-light">

<div class="container py-5">

<div class="card shadow-sm mx-auto"
     style="max-width:700px;">

<div class="card-body p-4">

    <h2 class="mb-4">
        Thêm danh mục
    </h2>

    <form
        action="${pageContext.request.contextPath}/admin/category/add"
        method="post"
        enctype="multipart/form-data"
        class="needs-validation"
        novalidate>

        <div class="mb-3">

            <label class="form-label">
                Tên danh mục
            </label>

            <input
                type="text"
                name="name"
                class="form-control"
                minlength="2"
                maxlength="100"
                pattern=".*\S.*"
                required>

            <div class="invalid-feedback">
                Tên danh mục phải có ít nhất 2 ký tự.
            </div>

        </div>

        <div class="mb-4">

            <label class="form-label">
                Ảnh đại diện
            </label>

            <input
                type="file"
                name="icon"
                class="form-control"
                accept=".jpg,.jpeg,.png,.gif">

            <div class="form-text">
                Chỉ chọn JPG, JPEG, PNG hoặc GIF.
            </div>

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

                Nhập lại

            </button>

            <button
                type="submit"
                class="btn btn-primary ms-auto">

                Thêm danh mục

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