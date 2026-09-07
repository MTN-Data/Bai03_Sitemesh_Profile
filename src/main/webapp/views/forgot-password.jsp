<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">
<title>Quên mật khẩu</title>

<link rel="stylesheet"
      href="<%= request.getContextPath() %>/css/style.css">

</head>

<body>

<div class="auth-wrapper">

    <div class="auth-card">

        <h2>Quên mật khẩu</h2>

        <p class="description">
            Nhập email để nhận mã OTP đặt lại mật khẩu
        </p>

        <%
            String error =
                (String) request.getAttribute("error");

            if (error != null) {
        %>

            <div class="error">
                <%= error %>
            </div>

        <%
            }
        %>

        <form action="<%= request.getContextPath() %>/forgot-password"
              method="post">

            <div class="form-group">

                <label>Email</label>

                <input type="email"
                       name="email"
                       placeholder="Nhập email đã đăng ký"
                       required>

            </div>

            <button type="submit"
                    class="btn btn-primary btn-full">
                Gửi mã OTP
            </button>

        </form>

        <div class="auth-links">

            <a href="<%= request.getContextPath() %>/login">
                Quay lại đăng nhập
            </a>

        </div>

    </div>

</div>

</body>
</html>