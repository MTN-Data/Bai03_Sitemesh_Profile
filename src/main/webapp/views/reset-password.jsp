<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">
<title>Đặt lại mật khẩu</title>

<link rel="stylesheet"
      href="<%= request.getContextPath() %>/css/style.css">

</head>

<body>

<div class="auth-wrapper">

    <div class="auth-card">

        <h2>Đặt lại mật khẩu</h2>

        <p class="description">
            Tạo mật khẩu mới cho tài khoản của bạn
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

        <form action="<%= request.getContextPath() %>/reset-password"
              method="post">

            <div class="form-group">

                <label>Mật khẩu mới</label>

                <input type="password"
                       name="password"
                       placeholder="Nhập mật khẩu mới"
                       required>

            </div>

            <div class="form-group">

                <label>Xác nhận mật khẩu</label>

                <input type="password"
                       name="confirmPassword"
                       placeholder="Nhập lại mật khẩu mới"
                       required>

            </div>

            <button type="submit"
                    class="btn btn-primary btn-full">
                Đổi mật khẩu
            </button>

        </form>

    </div>

</div>

</body>
</html>