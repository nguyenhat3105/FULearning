<%-- 
    Document   : thanhvien
    Created on : Jun 28, 2025, 10:10:05 PM
    Author     : CONG NHAT
--%>

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
        margin-top: 75px
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

    .avatar-img {
        width: 50px;
        height: 50px;
        border-radius: 50%;
        object-fit: cover;
        border: 2px solid #00ffff;
    }

    .member-info h4 {
        font-weight: bold;
        border-bottom: 1px dashed #00ffff;
        padding-bottom: 8px;
    }
    .member-info ul li {
        margin-bottom: 10px;
        font-size: 1rem;
    }


</style>

<div class="member-page">
    <h1 class="member-title">Tổng quan về chính sách FULearning</h1>


    <div class="member-info row g-4 mb-5">
        <div class="col-md-6">
            <div class="p-4 rounded-4 bg-dark bg-opacity-50 h-100 shadow-sm border border-info">
                <h4 class="text-info mb-3">
                    <i class="bi bi-shield-lock-fill me-2"></i> Quy định khi tham gia khóa học
                </h4>
                <ul class="list-unstyled text-light">
                    <li><i class="bi bi-check-circle-fill text-warning me-2"></i> Không chia sẻ tài khoản hoặc khóa học</li>
                    <li><i class="bi bi-check-circle-fill text-warning me-2"></i> Nghiêm túc chấp hành nội quy lớp học</li>
                    <li><i class="bi bi-check-circle-fill text-warning me-2"></i> Tham gia học đầy đủ, đúng giờ</li>
                    <li><i class="bi bi-check-circle-fill text-warning me-2"></i> Không spam hay gây rối trong group học tập</li>
                    <li><i class="bi bi-check-circle-fill text-warning me-2"></i> Tôn trọng mentor và các thành viên khác</li>
                </ul>
            </div>
        </div>

        <div class="col-md-6">
            <div class="p-4 rounded-4 bg-dark bg-opacity-50 h-100 shadow-sm border border-info">
                <h4 class="text-info mb-3">
                    <i class="bi bi-stars me-2"></i> Lợi ích khi tham gia
                </h4>
                <ul class="list-unstyled text-light">
                    <li><i class="bi bi-gem text-success me-2"></i> Được mentor hướng dẫn tận tình từng buổi</li>
                    <li><i class="bi bi-journal-code text-success me-2"></i> Luyện đề thực chiến, cập nhật liên tục</li>
                    <li><i class="bi bi-trophy-fill text-success me-2"></i> Tăng điểm thi cuối kỳ và GPA học phần</li>
                    <li><i class="bi bi-controller text-success me-2"></i> Định hướng và ôn luyện thi Olympic, ICPC</li>
                    <li><i class="bi bi-people-fill text-success me-2"></i> Mở rộng mối quan hệ học thuật và làm việc nhóm</li>
                </ul>
            </div>
        </div>
    </div>

    <h2 class="member-title" style="margin-top: 100px">👨‍🏫 Danh sách thành viên tham gia FULearning</h2>


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