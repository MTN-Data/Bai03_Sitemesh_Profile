<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">
<title>Đăng ký</title>

<link rel="stylesheet"
      href="<%= request.getContextPath() %>/css/style.css">

</head>

<body>

<div class="auth-wrapper">

    <div class="auth-card">

        <h2>Đăng ký tài khoản</h2>

        <p class="description">
            OTP kích hoạt sẽ được gửi đến email của bạn
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

        <form action="<%= request.getContextPath() %>/register"
              method="post">

            <div class="form-group">

                <label>Họ và tên</label>

                <input type="text"
                       name="fullName"
                       placeholder="Nhập họ và tên"
                       required>

            </div>

            <div class="form-group">

                <label>Email</label>

                <input type="email"
                       name="email"
                       placeholder="Nhập email"
                       required>

            </div>

            <div class="form-group">

                <label>Mật khẩu</label>

                <input type="password"
                       name="password"
                       placeholder="Nhập mật khẩu"
                       required>

            </div>

            <button type="submit"
                    class="btn btn-primary btn-full">
                Đăng ký
            </button>

        </form>

        <div class="auth-links">

            Đã có tài khoản?

            <a href="<%= request.getContextPath() %>/login">
                Đăng nhập
            </a>

        </div>

    </div>

</div>

</body>
</html>