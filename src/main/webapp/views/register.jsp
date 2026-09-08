<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">
<title>Đăng ký</title>

<link
    href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
    rel="stylesheet">

<style>

body {
    background: #f4f6f9;
}

.auth-wrapper {
    min-height: 100vh;
    display: flex;
    justify-content: center;
    align-items: center;
}

.auth-card {
    width: 100%;
    max-width: 480px;
    background: white;
    padding: 35px;
    border-radius: 14px;
    box-shadow: 0 8px 30px rgba(0,0,0,0.08);
}

</style>

</head>

<body>

<div class="auth-wrapper">

<div class="auth-card">

    <h2 class="text-center">
        Đăng ký tài khoản
    </h2>

    <p class="text-center text-muted mb-4">
        OTP kích hoạt sẽ được gửi đến email của bạn
    </p>

    <%
        String error =
            (String) request.getAttribute("error");

        if (error != null) {
    %>

    <div class="alert alert-danger">
        <%= error %>
    </div>

    <%
        }
    %>

    <form
        action="<%= request.getContextPath() %>/register"
        method="post"
        class="needs-validation"
        novalidate>

        <div class="mb-3">

            <label class="form-label">
                Họ và tên
            </label>

            <input
                type="text"
                name="fullName"
                class="form-control"
                minlength="2"
                maxlength="100"
                pattern=".*\S.*"
                placeholder="Nhập họ và tên"
                required>

            <div class="invalid-feedback">
                Họ tên phải có ít nhất 2 ký tự và không được chỉ chứa khoảng trắng.
            </div>

        </div>

        <div class="mb-3">

            <label class="form-label">
                Email
            </label>

            <input
                type="email"
                name="email"
                class="form-control"
                maxlength="150"
                placeholder="Nhập email"
                required>

            <div class="invalid-feedback">
                Vui lòng nhập email hợp lệ.
            </div>

        </div>

        <div class="mb-3">

            <label class="form-label">
                Mật khẩu
            </label>

            <input
                type="password"
                id="password"
                name="password"
                class="form-control"
                minlength="6"
                maxlength="100"
                placeholder="Nhập mật khẩu"
                required>

            <div class="invalid-feedback">
                Mật khẩu phải có ít nhất 6 ký tự.
            </div>

        </div>

        <div class="mb-3">

            <label class="form-label">
                Xác nhận mật khẩu
            </label>

            <input
                type="password"
                id="confirmPassword"
                class="form-control"
                minlength="6"
                maxlength="100"
                placeholder="Nhập lại mật khẩu"
                required>

            <div class="invalid-feedback">
                Mật khẩu xác nhận không khớp.
            </div>

        </div>

        <button
            type="submit"
            class="btn btn-primary w-100">

            Đăng ký

        </button>

    </form>

    <div class="text-center mt-3">

        Đã có tài khoản?

        <a href="<%= request.getContextPath() %>/login">
            Đăng nhập
        </a>

    </div>

</div>

</div>

<script>

(() => {

    'use strict';

    const form =
        document.querySelector('.needs-validation');

    const password =
        document.getElementById('password');

    const confirmPassword =
        document.getElementById('confirmPassword');

    function validatePassword() {

        if (
            confirmPassword.value !== password.value
        ) {

            confirmPassword.setCustomValidity(
                'Mật khẩu không khớp'
            );

        } else {

            confirmPassword.setCustomValidity('');

        }

    }

    password.addEventListener(
        'input',
        validatePassword
    );

    confirmPassword.addEventListener(
        'input',
        validatePassword
    );

    form.addEventListener('submit', event => {

        validatePassword();

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