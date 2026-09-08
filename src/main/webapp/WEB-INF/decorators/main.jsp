<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>

<%@ taglib prefix="c"
    uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<meta
    name="viewport"
    content="width=device-width, initial-scale=1">

<title>
    <sitemesh:write property="title"/>
</title>

<link
    href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
    rel="stylesheet">

<style>

body {
    margin: 0;
    background: #f4f6f9;
    font-family: Arial, sans-serif;
}

.main-navbar {
    min-height: 76px;
    background: #ffffff;
}

.brand-name {
    color: #2563eb !important;
    font-size: 25px;
    font-weight: 700;
}

.nav-link {
    color: #222 !important;
    font-size: 16px;
}

.nav-link:hover {
    color: #2563eb !important;
}

.avatar-nav {
    width: 40px;
    height: 40px;
    object-fit: cover;
    border-radius: 50%;
    border: 2px solid #e5e7eb;
}

.avatar-default {
    width: 40px;
    height: 40px;
    border-radius: 50%;
    display: inline-flex;
    align-items: center;
    justify-content: center;
    background: #2563eb;
    color: white;
}

.page-content {
    min-height: calc(100vh - 145px);
    padding-top: 35px;
    padding-bottom: 45px;
}

.dropdown-menu {
    min-width: 240px;
}

.footer {
    background: #ffffff;
    border-top: 1px solid #e5e7eb;
}

.btn-primary {
    background: #2563eb;
    border-color: #2563eb;
}

.btn-primary:hover {
    background: #1d4ed8;
    border-color: #1d4ed8;
}

</style>

<sitemesh:write property="head"/>

</head>

<body>

<nav class="navbar navbar-expand-lg border-bottom main-navbar">

    <div class="container">

        <a
            class="navbar-brand brand-name"
            href="${pageContext.request.contextPath}/home">

            ServletCRUDMVC

        </a>

        <button
            class="navbar-toggler"
            type="button"
            data-bs-toggle="collapse"
            data-bs-target="#mainNavbar">

            <span class="navbar-toggler-icon"></span>

        </button>

        <div
            class="collapse navbar-collapse"
            id="mainNavbar">

            <ul class="navbar-nav ms-auto align-items-lg-center gap-lg-2">

                <li class="nav-item">

                    <a
                        class="nav-link"
                        href="${pageContext.request.contextPath}/home">

                        Trang chủ

                    </a>

                </li>

                <li class="nav-item">

                    <a
                        class="nav-link"
                        href="${pageContext.request.contextPath}/product">

                        Sản phẩm

                    </a>

                </li>

                <c:choose>

                    <c:when test="${not empty sessionScope.account}">

                        <li class="nav-item dropdown ms-lg-2">

                            <a
                                class="nav-link dropdown-toggle d-flex align-items-center gap-2"
                                href="#"
                                role="button"
                                data-bs-toggle="dropdown">

                                <c:choose>

                                    <c:when test="${not empty sessionScope.account.images}">

                                        <img
                                            class="avatar-nav"
                                            src="${pageContext.request.contextPath}/${sessionScope.account.images}"
                                            alt="Avatar">

                                    </c:when>

                                    <c:otherwise>

                                        <span class="avatar-default">
                                            👤
                                        </span>

                                    </c:otherwise>

                                </c:choose>

                                <strong>
                                    ${sessionScope.account.fullName}
                                </strong>

                            </a>

                            <ul
                                class="dropdown-menu dropdown-menu-end shadow border-0">

                                <li>

                                    <div class="px-3 py-2">

                                        <strong>
                                            ${sessionScope.account.fullName}
                                        </strong>

                                        <div class="small text-muted">

                                            ${sessionScope.account.email}

                                        </div>

                                    </div>

                                </li>

                                <li>
                                    <hr class="dropdown-divider">
                                </li>

                                <li>

                                    <a
                                        class="dropdown-item py-2"
                                        href="${pageContext.request.contextPath}/profile">

                                        👤 &nbsp; Thông tin cá nhân

                                    </a>

                                </li>

                                <li>

                                    <a
                                        class="dropdown-item py-2"
                                        href="${pageContext.request.contextPath}/product">

                                        ▣ &nbsp; Sản phẩm

                                    </a>

                                </li>

                                <li>
                                    <hr class="dropdown-divider">
                                </li>

                                <li>

                                    <a
                                        class="dropdown-item py-2 text-danger"
                                        href="${pageContext.request.contextPath}/logout">

                                        ↪ &nbsp; Đăng xuất

                                    </a>

                                </li>

                            </ul>

                        </li>

                    </c:when>

                    <c:otherwise>

                        <li class="nav-item">

                            <a
                                class="btn btn-primary"
                                href="${pageContext.request.contextPath}/login">

                                Đăng nhập

                            </a>

                        </li>

                    </c:otherwise>

                </c:choose>

            </ul>

        </div>

    </div>

</nav>


<main class="page-content">

    <sitemesh:write property="body"/>

</main>


<footer class="footer py-3">

    <div class="container text-center text-muted small">

        ServletCRUDMVC - Java Web Application

    </div>

</footer>


<script
    src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js">
</script>


<script>

(() => {

    'use strict';

    const forms =
        document.querySelectorAll('.needs-validation');

    Array.from(forms).forEach(form => {

        form.addEventListener(
            'submit',
            event => {

                if (!form.checkValidity()) {

                    event.preventDefault();

                    event.stopPropagation();

                }

                form.classList.add(
                    'was-validated'
                );

            },
            false
        );

    });

})();

</script>

</body>

</html>