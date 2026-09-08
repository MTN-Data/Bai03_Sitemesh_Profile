<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">
<title>Đặt lại mật khẩu</title>

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
        Đặt lại mật khẩu
    </h2>

    <p class="text-muted text-center mb-4">
        Tạo mật khẩu mới cho tài khoản của bạn
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
        action="<%= request.getContextPath() %>/reset-password"
        method="post"
        class="needs-validation"
        novalidate>

        <div class="mb-3">

            <label class="form-label">
                Mật khẩu mới
            </label>

            <input
                type="password"
                id="password"
                name="password"
                class="form-control"
                minlength="6"
                maxlength="100"
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
                name="confirmPassword"
                class="form-control"
                minlength="6"
                maxlength="100"
                required>

            <div class="invalid-feedback">
                Hai mật khẩu phải giống nhau.
            </div>

        </div>

        <button
            type="submit"
            class="btn btn-primary w-100">

            Đổi mật khẩu

        </button>

    </form>

</div>

</div>

<script>

(() => {

    const form =
        document.querySelector('.needs-validation');

    const password =
        document.getElementById('password');

    const confirm =
        document.getElementById('confirmPassword');

    function checkPassword() {

        if (password.value !== confirm.value) {

            confirm.setCustomValidity(
                'Mật khẩu không khớp'
            );

        } else {

            confirm.setCustomValidity('');

        }

    }

    password.addEventListener(
        'input',
        checkPassword
    );

    confirm.addEventListener(
        'input',
        checkPassword
    );

    form.addEventListener('submit', event => {

        checkPassword();

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