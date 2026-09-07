<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>

<%@ taglib prefix="c"
    uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">
<title>Quản lý danh mục</title>

<style>

* {
    box-sizing: border-box;
}

body {
    margin: 0;
    font-family: Arial, sans-serif;
    background: #f4f6f9;
}

/* ================= SIDEBAR ================= */

.sidebar {
    position: fixed;
    left: 0;
    top: 0;
    width: 230px;
    height: 100vh;
    background: #168bd2;
    color: white;
    box-shadow: 2px 0 10px rgba(0,0,0,0.08);
}

.logo {
    padding: 20px;
    font-size: 23px;
    font-weight: bold;
    border-bottom: 1px solid rgba(255,255,255,0.15);
}

.logo a {
    color: white;
    text-decoration: none;
}

.profile {
    text-align: center;
    padding: 25px 10px 20px;
}

.profile a {
    color: white;
    text-decoration: none;
}

.profile img {
    width: 100px;
    height: 100px;
    border-radius: 50%;
    object-fit: cover;
    background: white;
    border: 4px solid white;
}

.profile-name {
    margin-top: 12px;
    margin-bottom: 4px;
    font-weight: bold;
    font-size: 15px;
}

.profile-role {
    margin: 0;
    font-size: 12px;
    opacity: 0.85;
}

.menu {
    margin-top: 10px;
}

.menu a {
    display: block;
    color: white;
    text-decoration: none;
    padding: 14px 18px;
    border-bottom: 1px solid rgba(255,255,255,0.08);
    transition: 0.2s;
}

.menu a:hover {
    background: rgba(0,0,0,0.2);
}

.menu .active {
    background: #111827;
}

.submenu a {
    padding: 10px 20px 10px 42px;
    font-size: 13px;
    background: rgba(0,0,0,0.06);
}

/* ================= HEADER ================= */

.header {
    margin-left: 230px;
    height: 65px;
    background: white;
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 0 30px;
    border-bottom: 1px solid #e5e7eb;
}

.header-title {
    font-weight: bold;
    color: #333;
}

.header-right {
    display: flex;
    align-items: center;
    gap: 12px;
}

.profile-button {
    text-decoration: none;
    color: #333;
    padding: 9px 13px;
    border-radius: 6px;
}

.profile-button:hover {
    background: #f0f2f5;
}

.logout {
    background: #ef4444;
    padding: 10px 15px;
    border-radius: 6px;
    color: white;
    text-decoration: none;
}

.logout:hover {
    background: #dc2626;
}

/* ================= CONTENT ================= */

.main {
    margin-left: 230px;
    padding: 25px;
    min-height: calc(100vh - 65px);
}

.content {
    background: white;
    border-radius: 8px;
    padding: 25px;
    box-shadow: 0 2px 10px rgba(0,0,0,0.06);
}

.title {
    font-size: 25px;
    font-weight: bold;
    color: #222;
}

.subtitle {
    color: #777;
    font-size: 13px;
    margin-top: 5px;
    margin-bottom: 25px;
}

.panel {
    border: 1px solid #ddd;
    border-radius: 6px;
    overflow: hidden;
}

.panel-title {
    padding: 13px;
    background: #f8f9fa;
    border-bottom: 1px solid #ddd;
    font-weight: bold;
}

.toolbar {
    padding: 15px;
    display: flex;
    justify-content: space-between;
    font-size: 13px;
}

.toolbar select,
.toolbar input {
    padding: 7px;
    border: 1px solid #ccc;
    border-radius: 4px;
}

table {
    width: calc(100% - 30px);
    margin: 0 15px 20px;
    border-collapse: collapse;
    font-size: 13px;
}

th,
td {
    border: 1px solid #ddd;
    padding: 10px;
    text-align: left;
}

th {
    background: #f8f9fa;
}

.category-image {
    width: 120px;
    height: 100px;
    object-fit: contain;
}

.action {
    color: #168bd2;
    text-decoration: none;
}

.action:hover {
    text-decoration: underline;
}

</style>

</head>

<body>

<!-- ================= SIDEBAR ================= -->

<div class="sidebar">

    <div class="logo">
        <a href="${pageContext.request.contextPath}/home">
            Dashboard
        </a>
    </div>

    <div class="profile">

        <a href="${pageContext.request.contextPath}/profile">

            <c:choose>

                <c:when test="${not empty sessionScope.account.images}">
                    <img
                        src="${pageContext.request.contextPath}/${sessionScope.account.images}"
                        alt="Avatar">
                </c:when>

                <c:otherwise>
                    <img
                        src="${pageContext.request.contextPath}/images/tien.jpg"
                        alt="Avatar">
                </c:otherwise>

            </c:choose>

            <div class="profile-name">
                ${sessionScope.account.fullName}
            </div>

            <p class="profile-role">
                Quản trị viên
            </p>

        </a>

    </div>

    <div class="menu">

        <a href="${pageContext.request.contextPath}/home">
            ⌂ &nbsp; Trang chủ
        </a>

        <a href="${pageContext.request.contextPath}/profile">
            👤 &nbsp; Thông tin cá nhân
        </a>

        <a href="${pageContext.request.contextPath}/admin/category/list"
           class="active">
            ▱ &nbsp; Quản lý danh mục
        </a>

        <div class="submenu">

            <a href="${pageContext.request.contextPath}/admin/category/add">
                └─ Thêm danh mục mới
            </a>

            <a href="${pageContext.request.contextPath}/admin/category/list">
                └─ Danh sách danh mục
            </a>

        </div>

        <a href="#">
            ▣ &nbsp; Quản lý sản phẩm
        </a>

        <a href="#">
            ▦ &nbsp; Quản lý tài khoản
        </a>

    </div>

</div>

<!-- ================= HEADER ================= -->

<div class="header">

    <div class="header-title">
        Quản trị hệ thống
    </div>

    <div class="header-right">

        <a class="profile-button"
           href="${pageContext.request.contextPath}/profile">

            👤 ${sessionScope.account.fullName}

        </a>

        <a href="${pageContext.request.contextPath}/logout"
           class="logout">

            Đăng xuất

        </a>

    </div>

</div>

<!-- ================= CONTENT ================= -->

<div class="main">

    <div class="content">

        <div class="title">
            Quản lý danh mục
        </div>

        <div class="subtitle">
            Quản lý và cập nhật các danh mục sản phẩm.
        </div>

        <div class="panel">

            <div class="panel-title">
                Danh sách danh mục
            </div>

            <div class="toolbar">

                <div>

                    <select>
                        <option>10</option>
                        <option>25</option>
                        <option>50</option>
                    </select>

                    bản ghi mỗi trang

                </div>

                <div>

                    Tìm kiếm:

                    <input
                        type="text"
                        id="searchInput"
                        onkeyup="searchCategory()">

                </div>

            </div>

            <table id="categoryTable">

                <thead>

                    <tr>
                        <th style="width:8%">STT</th>
                        <th style="width:44%">Hình ảnh</th>
                        <th style="width:30%">Tên danh mục</th>
                        <th style="width:18%">Hành động</th>
                    </tr>

                </thead>

                <tbody>

                    <c:forEach
                        items="${cateList}"
                        var="cate"
                        varStatus="STT">

                        <tr>

                            <td>
                                ${STT.index + 1}
                            </td>

                            <td>

                                <c:if test="${not empty cate.icon}">

                                    <img
                                        class="category-image"
                                        src="${pageContext.request.contextPath}/image?fname=${cate.icon}">

                                </c:if>

                            </td>

                            <td>
                                ${cate.name}
                            </td>

                            <td>

                                <a
                                    class="action"
                                    href="${pageContext.request.contextPath}/admin/category/edit?id=${cate.id}">
                                    Sửa
                                </a>

                                |

                                <a
                                    class="action"
                                    href="${pageContext.request.contextPath}/admin/category/delete?id=${cate.id}"
                                    onclick="return confirm('Bạn có chắc muốn xóa?')">
                                    Xóa
                                </a>

                            </td>

                        </tr>

                    </c:forEach>

                </tbody>

            </table>

        </div>

    </div>

</div>

<script>

function searchCategory() {

    var input =
        document.getElementById("searchInput");

    var filter =
        input.value.toLowerCase();

    var table =
        document.getElementById("categoryTable");

    var tr =
        table.getElementsByTagName("tr");

    for (var i = 1; i < tr.length; i++) {

        var td =
            tr[i].getElementsByTagName("td")[2];

        if (td) {

            var text =
                td.textContent || td.innerText;

            if (
                text.toLowerCase().indexOf(filter) > -1
            ) {

                tr[i].style.display = "";

            } else {

                tr[i].style.display = "none";

            }
        }
    }
}

</script>

</body>

</html>