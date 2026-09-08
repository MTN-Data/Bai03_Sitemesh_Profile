<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">
<title>Quên mật khẩu</title>

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
        Quên mật khẩu
    </h2>

    <p class="text-muted text-center mb-4">
        Nhập email để nhận mã OTP đặt lại mật khẩu
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
        action="<%= request.getContextPath() %>/forgot-password"
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
                placeholder="Nhập email đã đăng ký"
                required>

            <div class="invalid-feedback">
                Vui lòng nhập email hợp lệ.
            </div>

        </div>

        <button
            type="submit"
            class="btn btn-primary w-100">

            Gửi mã OTP

        </button>

    </form>

    <div class="text-center mt-3">

        <a href="<%= request.getContextPath() %>/login">
            ← Quay lại đăng nhập
        </a>

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