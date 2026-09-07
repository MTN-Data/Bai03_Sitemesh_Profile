<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>

<%@ taglib prefix="c"
    uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Thông tin cá nhân</title>

<link
    href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
    rel="stylesheet">

<style>

body {
    background-color: #f4f6f9;
}

.profile-card {
    max-width: 760px;
    margin: 45px auto;
    border: none;
    border-radius: 12px;
}

.profile-title {
    font-weight: 700;
    color: #222;
}

.avatar {
    width: 150px;
    height: 150px;
    border-radius: 50%;
    object-fit: cover;
    border: 4px solid white;
    box-shadow: 0 3px 12px rgba(0, 0, 0, 0.15);
}

.avatar-empty {
    width: 150px;
    height: 150px;
    border-radius: 50%;

    background-color: #e2e8f0;

    display: flex;
    align-items: center;
    justify-content: center;

    margin: auto;

    font-size: 55px;
}

.form-label {
    font-weight: 500;
}

.form-control {
    min-height: 46px;
}

.button-group {
    display: flex;
    gap: 12px;
    margin-top: 25px;
}

.button-group .btn {
    flex: 1;
    padding: 11px;
    font-weight: 600;
}

.btn-home {
    background: white;
    border: 1px solid #cbd5e1;
    color: #334155;
}

.btn-home:hover {
    background: #f1f5f9;
    color: #111827;
    border-color: #94a3b8;
}

.btn-update {
    background: #2563eb;
    color: white;
    border: none;
}

.btn-update:hover {
    background: #1d4ed8;
    color: white;
}

</style>

</head>

<body>

<div class="container">

    <div class="card shadow profile-card">

        <div class="card-body p-4 p-md-5">

            <h2 class="text-center mb-4 profile-title">
                THÔNG TIN CÁ NHÂN
            </h2>

            <c:if test="${param.success == '1'}">

                <div class="alert alert-success">
                    Cập nhật thông tin thành công.
                </div>

            </c:if>

            <c:if test="${not empty error}">

                <div class="alert alert-danger">
                    ${error}
                </div>

            </c:if>

            <div class="text-center mb-4">

                <c:choose>

                    <c:when test="${not empty user.images}">

                        <img
                            src="${pageContext.request.contextPath}/${user.images}"
                            class="avatar"
                            alt="Ảnh đại diện">

                    </c:when>

                    <c:otherwise>

                        <div class="avatar-empty">
                            👤
                        </div>

                    </c:otherwise>

                </c:choose>

            </div>

            <form
                action="${pageContext.request.contextPath}/profile"
                method="post"
                enctype="multipart/form-data"
                class="needs-validation"
                novalidate>

                <div class="mb-3">

                    <label class="form-label">
                        Email
                    </label>

                    <input
                        type="email"
                        class="form-control"
                        value="${user.email}"
                        disabled>

                </div>

                <div class="mb-3">

                    <label class="form-label">
                        Họ và tên
                    </label>

                    <input
                        type="text"
                        name="fullName"
                        class="form-control"
                        value="${user.fullName}"
                        minlength="2"
                        maxlength="100"
                        required>

                    <div class="invalid-feedback">
                        Vui lòng nhập họ và tên.
                    </div>

                </div>

                <div class="mb-3">

                    <label class="form-label">
                        Số điện thoại
                    </label>

                    <input
                        type="text"
                        name="phone"
                        class="form-control"
                        value="${user.phone}"
                        pattern="0[0-9]{9}"
                        maxlength="10">

                    <div class="invalid-feedback">
                        Số điện thoại phải gồm 10 số và bắt đầu bằng 0.
                    </div>

                </div>

                <div class="mb-3">

                    <label class="form-label">
                        Ảnh đại diện
                    </label>

                    <input
                        type="file"
                        name="images"
                        class="form-control"
                        accept=".jpg,.jpeg,.png,.gif">

                    <div class="form-text">
                        Chọn JPG, JPEG, PNG hoặc GIF. Tối đa 5MB.
                    </div>

                </div>

                <div class="button-group">

                    <a
                        href="${pageContext.request.contextPath}/home"
                        class="btn btn-home">

                        ← Quay lại trang chủ

                    </a>

                    <button
                        type="submit"
                        class="btn btn-update">

                        Cập nhật thông tin

                    </button>

                </div>

            </form>

        </div>

    </div>

</div>

<script
    src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js">
</script>

<script>

(() => {

    'use strict';

    const forms =
        document.querySelectorAll('.needs-validation');

    Array.from(forms).forEach(form => {

        form.addEventListener(
            'submit',
            event => {

                if (!form.checkValidity()) {

                    event.preventDefault();
                    event.stopPropagation();

                }

                form.classList.add('was-validated');

            },
            false
        );

    });

})();

</script>

</body>

</html>