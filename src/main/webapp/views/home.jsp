<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>

<%@ taglib prefix="c"
    uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Trang chủ</title>

<link rel="stylesheet"
      href="${pageContext.request.contextPath}/css/style.css">

<style>

.navbar {
    position: relative;
    z-index: 1000;
}

.navbar-links {
    display: flex;
    align-items: center;
    gap: 18px;
}

.navbar-links > a {
    text-decoration: none;
}

.user-menu {
    position: relative;
}

.user-menu summary {
    list-style: none;
    cursor: pointer;

    display: flex;
    align-items: center;

    gap: 9px;

    padding: 7px 10px;

    border-radius: 8px;

    transition: 0.2s;
}

.user-menu summary::-webkit-details-marker {
    display: none;
}

.user-menu summary:hover {
    background: #f3f4f6;
}

.user-avatar {
    width: 38px;
    height: 38px;

    border-radius: 50%;

    object-fit: cover;

    border: 2px solid #e5e7eb;
}

.user-avatar-default {
    width: 38px;
    height: 38px;

    border-radius: 50%;

    background: #2563eb;
    color: white;

    display: flex;
    align-items: center;
    justify-content: center;

    font-size: 18px;
}

.user-name {
    font-weight: 600;
    color: #222;
}

.arrow {
    font-size: 11px;
    color: #777;
}

.user-dropdown {
    position: absolute;

    right: 0;
    top: calc(100% + 10px);

    width: 230px;

    background: white;

    border: 1px solid #e5e7eb;

    border-radius: 10px;

    box-shadow: 0 8px 30px rgba(0,0,0,0.12);

    padding: 8px;

    z-index: 9999;
}

.dropdown-header {
    padding: 10px 12px 12px;

    border-bottom: 1px solid #eee;

    margin-bottom: 6px;
}

.dropdown-header strong {
    display: block;

    color: #222;

    margin-bottom: 4px;
}

.dropdown-email {
    font-size: 12px;
    color: #777;

    word-break: break-all;
}

.user-dropdown a {
    display: block;

    padding: 10px 12px;

    border-radius: 6px;

    text-decoration: none;

    color: #333;

    transition: 0.2s;
}

.user-dropdown a:hover {
    background: #f3f4f6;
}

.user-dropdown .logout-link {
    color: #dc2626;
}

.user-dropdown .logout-link:hover {
    background: #fee2e2;
}

.welcome-box {
    margin-bottom: 25px;

    padding: 22px 25px;

    background: white;

    border-radius: 10px;

    border: 1px solid #e5e7eb;

    box-shadow: 0 2px 8px rgba(0,0,0,0.04);
}

.welcome-box h2 {
    margin: 0 0 5px;

    font-size: 21px;
}

.welcome-box p {
    margin: 0;

    color: #666;

    font-size: 14px;
}

/* SỬA NÚT XEM TẤT CẢ SẢN PHẨM */

.btn-primary {
    display: inline-flex;

    align-items: center;
    justify-content: center;

    background: #2563eb !important;

    color: #ffffff !important;

    padding: 13px 22px;

    border: none;

    border-radius: 9px;

    font-weight: 600;

    text-decoration: none !important;

    transition: 0.2s;
}

.btn-primary:visited {
    color: #ffffff !important;
}

.btn-primary:hover {
    background: #1d4ed8 !important;

    color: #ffffff !important;

    transform: translateY(-1px);

    box-shadow: 0 4px 10px rgba(37, 99, 235, 0.25);
}

</style>

</head>

<body>

<div class="navbar">

    <a
        class="logo"
        href="${pageContext.request.contextPath}/home">

        ServletCRUDMVC

    </a>

    <div class="navbar-links">

        <a href="${pageContext.request.contextPath}/home">

            Trang chủ

        </a>

        <a href="${pageContext.request.contextPath}/product">

            Sản phẩm

        </a>

        <c:choose>

            <c:when test="${not empty sessionScope.account}">

                <details class="user-menu">

                    <summary>

                        <c:choose>

                            <c:when test="${not empty sessionScope.account.images}">

                                <img
                                    class="user-avatar"
                                    src="${pageContext.request.contextPath}/${sessionScope.account.images}"
                                    alt="Avatar">

                            </c:when>

                            <c:otherwise>

                                <div class="user-avatar-default">
                                    👤
                                </div>

                            </c:otherwise>

                        </c:choose>

                        <span class="user-name">

                            ${sessionScope.account.fullName}

                        </span>

                        <span class="arrow">
                            ▼
                        </span>

                    </summary>

                    <div class="user-dropdown">

                        <div class="dropdown-header">

                            <strong>
                                ${sessionScope.account.fullName}
                            </strong>

                            <div class="dropdown-email">
                                ${sessionScope.account.email}
                            </div>

                        </div>

                        <a href="${pageContext.request.contextPath}/profile">

                            👤 &nbsp; Thông tin cá nhân

                        </a>

                        <a href="${pageContext.request.contextPath}/home">

                            🏠 &nbsp; Trang chủ

                        </a>

                        <a href="${pageContext.request.contextPath}/product">

                            ▣ &nbsp; Xem sản phẩm

                        </a>

                        <a
                            class="logout-link"
                            href="${pageContext.request.contextPath}/logout">

                            ↪ &nbsp; Đăng xuất

                        </a>

                    </div>

                </details>

            </c:when>

            <c:otherwise>

                <a href="${pageContext.request.contextPath}/login">

                    Đăng nhập

                </a>

            </c:otherwise>

        </c:choose>

    </div>

</div>


<div class="container">

    <c:if test="${not empty sessionScope.account}">

        <div class="welcome-box">

            <h2>

                Xin chào, ${sessionScope.account.fullName} 👋

            </h2>

            <p>

                Chào mừng bạn quay lại hệ thống ServletCRUDMVC.

            </p>

        </div>

    </c:if>


    <div class="section-header">

        <div>

            <h1 class="page-title">

                Sản phẩm mới nhất

            </h1>

            <p class="subtitle">

                Danh sách tối đa 10 sản phẩm được thêm gần đây.

            </p>

        </div>

        <a
            class="btn btn-primary"
            href="${pageContext.request.contextPath}/product">

            Xem tất cả sản phẩm

        </a>

    </div>


    <div class="product-grid">

        <c:forEach
            var="product"
            items="${products}">

            <div class="product-card">

                <h3>
                    ${product.productName}
                </h3>

                <div class="product-price">

                    ${product.price} VNĐ

                </div>

                <p>
                    ${product.description}
                </p>

                <a
                    class="btn btn-primary"
                    href="${pageContext.request.contextPath}/product/detail?id=${product.productId}">

                    Xem chi tiết

                </a>

            </div>

        </c:forEach>

    </div>

</div>

</body>

</html>