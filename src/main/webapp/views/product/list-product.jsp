<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c"
    uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Danh sách sản phẩm</title>

<link rel="stylesheet"
      href="${pageContext.request.contextPath}/css/style.css">

<style>

.product-page {
    width: 94%;
    max-width: 1400px;
    margin: 45px auto;
}

.product-header {
    margin-bottom: 30px;
}

.product-header h1 {
    margin: 0 0 8px 0;
    font-size: 36px;
}

.product-header p {
    margin: 0;
    color: #6b7280;
    font-size: 17px;
}

.product-grid-list {
    display: grid;
    grid-template-columns: repeat(3, 1fr);
    gap: 24px;
}

.product-item {
    background: #ffffff;
    border: 1px solid #e5e7eb;
    border-radius: 12px;
    padding: 22px;

    min-height: 190px;

    box-shadow: 0 4px 15px rgba(0,0,0,0.05);

    transition:
        transform 0.2s ease,
        box-shadow 0.2s ease;
}

.product-item:hover {
    transform: translateY(-4px);
    box-shadow: 0 8px 24px rgba(0,0,0,0.10);
}

.product-item h3 {
    margin: 0 0 12px;
    font-size: 22px;
}

.product-price {
    color: #dc2626;
    font-size: 18px;
    font-weight: bold;
    margin-bottom: 15px;
}

.product-description {
    color: #374151;
    line-height: 1.5;
    min-height: 45px;
    margin-bottom: 20px;
}

.detail-link {
    display: inline-block;

    color: #2563eb;

    font-weight: 600;
    text-decoration: none;
}

.detail-link:hover {
    text-decoration: underline;
}

.pagination {
    display: flex;
    align-items: center;
    gap: 8px;

    margin-top: 32px;
}

.pagination a,
.pagination span {
    min-width: 44px;
    height: 44px;

    padding: 0 14px;

    display: flex;
    justify-content: center;
    align-items: center;

    border: 1px solid #d1d5db;
    border-radius: 8px;

    background: #ffffff;

    color: #2563eb;

    text-decoration: none;

    font-size: 16px;
}

.pagination a:hover {
    background: #eff6ff;
    border-color: #2563eb;
}

.pagination .active {
    background: #2563eb;
    color: #ffffff;
    border-color: #2563eb;
}

.empty-products {
    grid-column: 1 / -1;

    padding: 40px;

    background: #ffffff;

    border-radius: 12px;

    text-align: center;

    color: #6b7280;
}

@media (max-width: 900px) {

    .product-grid-list {
        grid-template-columns: repeat(2, 1fr);
    }
}

@media (max-width: 600px) {

    .product-page {
        width: 92%;
    }

    .product-grid-list {
        grid-template-columns: 1fr;
    }

    .product-header h1 {
        font-size: 28px;
    }
}

</style>

</head>

<body>

<div class="navbar">

    <a class="logo"
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

                <span>
                    Xin chào, ${sessionScope.account.fullName}
                </span>

                <a class="btn-logout"
                   href="${pageContext.request.contextPath}/logout">
                    Đăng xuất
                </a>

            </c:when>

            <c:otherwise>

                <a href="${pageContext.request.contextPath}/login">
                    Đăng nhập
                </a>

            </c:otherwise>

        </c:choose>

    </div>

</div>


<div class="product-page">

    <div class="product-header">

        <h1>Danh sách sản phẩm</h1>

        <p>
            Hiển thị 6 sản phẩm trên mỗi trang
        </p>

    </div>


    <div class="product-grid-list">

        <c:choose>

            <c:when test="${not empty productList}">

                <c:forEach
                    var="product"
                    items="${productList}">

                    <div class="product-item">

                        <h3>
                            ${product.productName}
                        </h3>

                        <div class="product-price">
                            ${product.price} VNĐ
                        </div>

                        <p class="product-description">
                            ${product.description}
                        </p>

                        <a class="detail-link"
                           href="${pageContext.request.contextPath}/product/detail?id=${product.productId}">
                            Xem chi tiết →
                        </a>

                    </div>

                </c:forEach>

            </c:when>

            <c:otherwise>

                <div class="empty-products">
                    Chưa có sản phẩm.
                </div>

            </c:otherwise>

        </c:choose>

    </div>


    <c:if test="${totalPages > 0}">

        <div class="pagination">

            <c:if test="${currentPage > 1}">

                <a href="${pageContext.request.contextPath}/product?page=${currentPage - 1}">
                    ← Trước
                </a>

            </c:if>


            <c:forEach
                begin="1"
                end="${totalPages}"
                var="i">

                <c:choose>

                    <c:when test="${i == currentPage}">

                        <span class="active">
                            ${i}
                        </span>

                    </c:when>

                    <c:otherwise>

                        <a href="${pageContext.request.contextPath}/product?page=${i}">
                            ${i}
                        </a>

                    </c:otherwise>

                </c:choose>

            </c:forEach>


            <c:if test="${currentPage < totalPages}">

                <a href="${pageContext.request.contextPath}/product?page=${currentPage + 1}">
                    Sau →
                </a>

            </c:if>

        </div>

    </c:if>

</div>

</body>

</html>