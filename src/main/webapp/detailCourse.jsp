<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="header.jsp" %>

<style>
    .member-page {
        background: radial-gradient(circle at top left, #0f2027, #203a43, #2c5364);
        color: #ffffff;
        min-height: 100vh;
        padding: 50px 150px;
        margin-top: 75px;
    }

    .member-title {
        text-align: center;
        font-size: 2.5rem;
        margin-bottom: 40px;
        color: #00ffff;
    }

    .member-card {
        background-color: rgba(255, 255, 255, 0.05);
        border-radius: 20px;
        padding: 30px;
        box-shadow: 0 4px 15px rgba(0, 255, 255, 0.2);
    }

    .member-table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 20px;
    }

    .member-table th,
    .member-table td {
        border-bottom: 1px solid #00ffff33;
        padding: 12px 16px;
        text-align: left;
    }

    .member-table th {
        color: #00ffff;
        font-weight: bold;
        background-color: #0d1b2a;
    }

    .member-table tr:hover {
        background-color: rgba(0, 255, 255, 0.05);
    }

    .empty-message {
        text-align: center;
        color: #aaa;
        font-style: italic;
        padding: 20px;
    }


    .course-info {
        display: flex;
        align-items: center;
        gap: 30px;
        background-color: rgba(255, 255, 255, 0.05);
        border-radius: 20px;
        padding: 30px;
        box-shadow: 0 4px 15px rgba(0, 255, 255, 0.15);
        margin-bottom: 40px;
    }

    .course-info img {
        width: 280px;
        height: 180px;
        object-fit: cover;
        border-radius: 16px;
        border: 2px solid #00ffff55;
    }

    .course-info-content h2 {
        font-size: 2rem;

        margin-bottom: 10px;
    }

    .course-info-content p {
        margin: 5px 0;
        font-size: 1.1rem;
    }
</style>

<div class="member-page">


    <h2 class="member-title" style="font-size: 2.5rem">
        <i class="bi bi-mortarboard-fill me-2 text-info"></i>Course <span class="text-info">${course.name}</span>
    </h2>

    <!-- ✅ Thông tin khóa học -->
    <div class="course-info">
        <img src="${course.imageUrl}" alt="${course.name}" >
        <div class="course-info-content">
            <h2><i class="bi bi-journal-code me-2"></i>${course.name}</h2>
            <p><i class="bi bi-person-fill text-success me-2"></i>Giảng viên: <strong>${course.lecturer}</strong></p>
            <p><i class="bi bi-tags-fill text-primary me-2"></i>Danh mục: <strong>${course.category}</strong></p>
        </div>
    </div>

    <h4 class="member-title">
        👨‍🏫 Danh sách thành viên 
    </h4>

    <div class="member-card">
        <table class="member-table">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>👤 Họ và tên</th>
                    <th>📧 Email</th>
                </tr>
            </thead>
            <tbody>
                <c:choose>
                    <c:when test="${not empty list}">
                        <c:forEach var="stu" items="${list}">
                            <tr>
                                <td>${stu.id}</td>
                                <td><i class="bi bi-person-circle text-info me-2"></i> ${stu.fullName}</td>
                                <td><i class="bi bi-envelope-at text-warning me-2"></i> ${stu.email}</td>
                            </tr>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <tr>
                            <td colspan="3" class="empty-message">Chưa có thành viên nào đăng ký khóa học này.</td>
                        </tr>
                    </c:otherwise>
                </c:choose>
            </tbody>
        </table>
    </div>
</div>

<%@ include file="footer.jsp" %>
