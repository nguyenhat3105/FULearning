<%-- 
    Document   : header
    Created on : Jun 23, 2025, 3:04:10 PM
    Author     : CONG NHAT
--%>

<%@page import="Entity.Student"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>FULearning</title>

        <!-- Bootstrap 5 -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

        <!-- FontAwesome -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">

        <!-- Optional custom CSS -->
        <link href="css/style.css" rel="stylesheet">

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">

        <link rel="icon" href="favicons/favicon.png" type="image/png" sizes="180x180">

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>


    </head>



    <style>
        .navbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background-color: white;
            padding: 12px 40px;
            color: black;
            box-shadow: 0 2px 6px rgba(0,0,0,0.2);
            position: fixed;
            width: 100%;
            top: 0;
            z-index: 1000;
        }

        /* Logo */
        .logo {
            font-size: 24px;
            font-weight: bold;
            color: black;
        }

        /* Menu trung tâm */
        .menu {
            display: flex;
            gap: 60px;
        }

        .menu a {
            color: black;
            text-decoration: none;
            font-size: 20px;
            position: relative;
            padding: 6px 0;
            font-weight: 900;
        }

        .menu a::after {
            content: '';
            position: absolute;
            width: 0%;
            height: 2px;
            background-color: aqua;
            left: 0;
            bottom: 0;
            transition: width 0.3s;
        }

        .menu a:hover {
            color: #00cccc;
        }

        .menu a:hover::after {
            width: 100%;
        }

        /* Nút đăng nhập/đăng ký */
        .auth {
            display: flex;
            gap: 12px;
        }

        .btn {
            padding: 6px 16px;
            font-size: 14px;
            border-radius: 4px;
            text-decoration: none;
            transition: 0.3s;
        }

        .login {
            border: 1px solid white;
            color: white;
            background: black;
        }

        .login:hover {
            background-color: white;
            color: #002244;
        }

        .signup {
            background-color: aqua;
            color: #002244;
            font-weight: 600;
        }

        .signup:hover {
            background-color: white;
            color: black;
        }

        .menu .dropdown {
            position: relative;
            display: flex;
            align-items: center;
        }

        .menu .custom-dropdown {
            position: relative;
            display: flex;
            align-items: center;
        }

        .menu .custom-menu {
            color: black;
            text-decoration: none;
            font-size: 20px;
            font-weight: 900;
            padding: 6px 0;
            position: relative;
        }

        /* Tùy chọn: hiệu ứng gạch chân khi hover */
        .menu .custom-menu:hover {
            color: #00cccc;
        }

        /* Dropdown menu (Bootstrap mặc định sẽ lo hiển thị) */
        .dropdown-menu {
            margin-top: 10px !important;
            border-radius: 8px;
            box-shadow: 0 8px 16px rgba(0,0,0,0.15);
            min-width: 200px;
            font-size: 16px;
        }

        /* Dropdown item */
        .dropdown-menu .dropdown-item {
            padding: 10px 20px;
            transition: 0.3s;
        }

        /* Hover dropdown item đẹp */
        .dropdown-menu .dropdown-item:hover {
            background-color: #f0f0f0;
            color: #007bff;
        }

        .dropdown-menu {
            margin-top: 10px !important;
            border-radius: 8px;
            box-shadow: 0 8px 16px rgba(0,0,0,0.15);
            min-width: auto;
            width: 160px; /* <-- vừa đủ 3 dòng, có thể chỉnh nhỏ/lớn hơn */
            font-size: 15px;
            padding: 0;
        }

        /* Responsive cho mobile */
        @media (max-width: 768px) {
            .navbar {
                flex-direction: column;
                align-items: flex-start;
                padding: 10px 20px;
            }

            .menu, .auth {
                margin-top: 10px;
                flex-wrap: wrap;
                gap: 15px;
            }
        }
    </style>


    <header class="navbar">

        <a href="index.jsp" target="target">
            <img src="image/logo_fu.png" style="width: 130px; height: 50px">
        </a>

        <%
            Student student = (Student) session.getAttribute("student");
        %>

        <nav class="menu">
            <a href="tintuc.jsp">Tin tức</a>
            <div class="dropdown">
                <a class="custom-menu" href="#" id="courseDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                    Khóa học
                </a>
                <ul class="dropdown-menu" aria-labelledby="courseDropdown">
                    <li><a class="dropdown-item" href="EnrollmentController?category=Software%20Engineering">Lập trình</a></li>
                    <li><a class="dropdown-item" href="EnrollmentController?category=Mathematics">Toán học</a></li>
                    <li><a class="dropdown-item" href="EnrollmentController?category=Language">Ngôn ngữ</a></li>
                    <li><a class="dropdown-item" href="EnrollmentControllerAll">Tất cả</a></li>
                </ul>
            </div>
            <a href="ThanhVienController">Thành viên</a>
            <a href="khanh.jsp">Giảng viên</a>
        </nav>
        <div class="auth">
            <%  if (student == null) {

            %>
            <a href="login.jsp" class="btn login">Đăng nhập</a>
            <a href="register.jsp" class="btn signup">Đăng ký</a>

            <% } else {%>
            <div class="dropdown">
                <a class="btn btn-outline-dark dropdown-toggle d-flex align-items-center" href="#" role="button" id="userMenu" data-bs-toggle="dropdown" aria-expanded="false" style="width: 100%; font-size: 17px">
                    <i class="fa-solid fa-user-circle me-2"></i>
                    <%= student.getFullName()%>

                </a>
                <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="userMenu" style="width: 100%">
                    <li><a class="dropdown-item" href="MyCourseController">Thông tin tài khoản</a></li>
                    <li><a class="dropdown-item" href="LogoutController">Đăng xuất</a></li>
                </ul>
            </div>
            <% }%>
        </div>
    </header>











