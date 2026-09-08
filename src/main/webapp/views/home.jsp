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

<style>

.home-container {
    max-width: 1500px;
}

.welcome-box {
    background: #ffffff;
    border: 1px solid #e5e7eb;
    border-radius: 12px;
    padding: 25px 30px;
    box-shadow: 0 3px 12px rgba(0,0,0,0.04);
    margin-bottom: 45px;
}

.welcome-box h2 {
    font-size: 23px;
    font-weight: 700;
    margin-bottom: 5px;
}

.welcome-box p {
    color: #6b7280;
    margin: 0;
}

.section-header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 30px;
}

.page-title {
    font-size: 38px;
    font-weight: 700;
    margin-bottom: 5px;
}

.subtitle {
    color: #6b7280;
    margin: 0;
}

.view-all {
    background: #2563eb !important;
    color: #ffffff !important;
    font-weight: 600;
    text-decoration: none;
    padding: 13px 22px;
    border-radius: 9px;
}

.view-all:hover {
    background: #1d4ed8 !important;
    color: white !important;
}

.product-grid {
    display: grid;
    grid-template-columns:
        repeat(auto-fill, minmax(260px, 1fr));
    gap: 20px;
}

.product-card {
    background: white;
    padding: 20px;
    border-radius: 10px;
    border: 1px solid #e5e7eb;
    box-shadow: 0 2px 8px rgba(0,0,0,0.04);
}

.product-card h3 {
    font-size: 19px;
    font-weight: 700;
}

.product-price {
    color: #dc2626;
    font-weight: 700;
    margin: 10px 0;
}

</style>

</head>

<body>

<div class="container home-container">

    <c:if test="${not empty sessionScope.account}">

        <div class="welcome-box">

            <h2>

                Xin chào,
                ${sessionScope.account.fullName}
                👋

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
            class="view-all"
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