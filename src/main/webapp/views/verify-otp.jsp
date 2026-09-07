<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">
<title>Xác nhận OTP</title>

<link rel="stylesheet"
      href="<%= request.getContextPath() %>/css/style.css">

</head>

<body>

<div class="auth-wrapper">

    <div class="auth-card">

        <h2>Xác nhận tài khoản</h2>

        <p class="description">
            Nhập mã OTP 6 số đã được gửi đến email của bạn
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

        <form action="<%= request.getContextPath() %>/verify-otp"
              method="post">

            <div class="form-group">

                <input class="otp-input"
                       type="text"
                       name="otp"
                       maxlength="6"
                       pattern="[0-9]{6}"
                       placeholder="000000"
                       required>

            </div>

            <button type="submit"
                    class="btn btn-success btn-full">
                Xác nhận OTP
            </button>

        </form>

    </div>

</div>

</body>
</html>