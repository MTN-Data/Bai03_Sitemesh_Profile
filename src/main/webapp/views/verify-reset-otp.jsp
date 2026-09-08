<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">
<title>Xác nhận OTP</title>

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
    align-items: center;
    justify-content: center;
}

.auth-card {
    width: 100%;
    max-width: 440px;
    padding: 35px;
    background: white;
    border-radius: 14px;
    box-shadow: 0 8px 30px rgba(0,0,0,0.08);
}

.otp-input {
    text-align: center;
    font-size: 28px;
    letter-spacing: 8px;
}

</style>

</head>

<body>

<div class="auth-wrapper">

<div class="auth-card">

    <h2 class="text-center">
        Xác nhận OTP
    </h2>

    <p class="text-muted text-center mb-4">
        Nhập mã OTP được gửi tới email để tiếp tục
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
        action="<%= request.getContextPath() %>/verify-reset-otp"
        method="post"
        class="needs-validation"
        novalidate>

        <div class="mb-3">

            <input
                type="text"
                name="otp"
                class="form-control otp-input"
                inputmode="numeric"
                maxlength="6"
                minlength="6"
                pattern="[0-9]{6}"
                placeholder="000000"
                required>

            <div class="invalid-feedback text-center">
                OTP phải gồm đúng 6 chữ số.
            </div>

        </div>

        <button
            type="submit"
            class="btn btn-success w-100">

            Xác nhận OTP

        </button>

    </form>

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