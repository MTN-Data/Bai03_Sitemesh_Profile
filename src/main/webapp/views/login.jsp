<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">
<title>Đăng nhập</title>

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
    max-width: 460px;
    background: white;
    border-radius: 14px;
    padding: 35px;
    box-shadow: 0 8px 30px rgba(0,0,0,0.08);
}

</style>

</head>

<body>

<div class="auth-wrapper">

    <div class="auth-card">

        <h2 class="text-center mb-2">
            Đăng nhập
        </h2>

        <p class="text-muted text-center mb-4">
            Đăng nhập để tiếp tục sử dụng hệ thống
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
            action="<%= request.getContextPath() %>/login"
            method="post"
            class="needs-validation"
            novalidate>

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
                    Vui lòng nhập đúng định dạng email.
                </div>

            </div>

            <div class="mb-3">

                <label class="form-label">
                    Mật khẩu
                </label>

                <input
                    type="password"
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

            <button
                type="submit"
                class="btn btn-primary w-100">

                Đăng nhập

            </button>

        </form>

        <div class="text-center mt-3">

            <a href="<%= request.getContextPath() %>/forgot-password">
                Quên mật khẩu?
            </a>

            <span class="mx-2">|</span>

            <a href="<%= request.getContextPath() %>/register">
                Đăng ký tài khoản
            </a>

        </div>

    </div>

</div>

<script>

(() => {

    'use strict';

    const forms =
        document.querySelectorAll('.needs-validation');

    Array.from(forms).forEach(form => {

        form.addEventListener('submit', event => {

            if (!form.checkValidity()) {
                event.preventDefault();
                event.stopPropagation();
            }

            form.classList.add('was-validated');

        });

    });

})();

</script>

</body>
</html>