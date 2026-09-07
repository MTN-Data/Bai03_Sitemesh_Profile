<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">
<title>Đăng nhập</title>

<link rel="stylesheet"
      href="<%= request.getContextPath() %>/css/style.css">

</head>

<body>

<div class="auth-wrapper">

    <div class="auth-card">

        <h2>Đăng nhập</h2>

        <p class="description">
            Đăng nhập để tiếp tục sử dụng hệ thống
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

        <form action="<%= request.getContextPath() %>/login"
              method="post">

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
                Đăng nhập
            </button>

        </form>

        <div class="auth-links">

            <a href="<%= request.getContextPath() %>/forgot-password">
                Quên mật khẩu?
            </a>

            &nbsp; | &nbsp;

            <a href="<%= request.getContextPath() %>/register">
                Đăng ký tài khoản
            </a>

        </div>

    </div>

</div>

</body>
</html>