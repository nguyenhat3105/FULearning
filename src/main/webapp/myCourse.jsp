<%-- 
    Document   : khoahoc
    Created on : Jun 27, 2025, 11:41:58 PM
    Author     : CONG NHAT
--%>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="header.jsp" %>

<style>

    .card {
        transition: transform 0.3s ease, box-shadow 0.3s ease;
    }

    .card:hover {
        transform: translateY(-10px); /* nâng thẻ lên */
        box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2); /* đổ bóng */
        border: 2px solid #007bff;
    }


    .course-card-custom {
        min-height: 480px;
        border: 2px solid transparent; /* Thêm dòng này */
        transition: transform 0.3s ease, box-shadow 0.3s ease, border-color 0.3s ease;
    }

    .course-card-custom:hover {
        transform: translateY(-10px);
        box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
        border-color: 10px solid #007bff; /* Chỉ thay đổi màu viền */
    }



    /* avatar */

    .avatar {
        width: 42px;
        height: 42px;
        background: linear-gradient(135deg, #2196f3, #21cbf3);
        color: white;
        font-weight: bold;
        font-size: 18px;
        border-radius: 50%;
        display: flex;
        align-items: center;
        justify-content: center;
        box-shadow: 0 2px 6px rgba(0,0,0,0.2);
    }


</style>




<div class="container" style="margin-top: 120px;">
    <div class="container text-center mt-5">
        <div class="mb-4">

            <img src="https://www.shutterstock.com/image-vector/programmer-computer-expert-black-linear-600nw-2033137370.jpg" class="rounded-circle shadow" style="width: 450px; height: 450px; object-fit: cover;">
        </div>


        <%
            Student s = (Student) session.getAttribute("student");
            String[] parts = student.getFullName().trim().split(" ");
            String avatar = parts[parts.length - 1].substring(0, 1).toUpperCase();
        %>


        <h3 class="fw-bold">${student.fullName}</h3>
        <p class="text-muted">${student.email}</p>

        <div class="d-flex justify-content-center gap-3 mt-3">
            <div class="badge bg-primary p-3 rounded-pill fs-6">
                <i class="bi bi-book-fill me-2"></i> 
                Đã đăng ký: <strong>${totalCourse}</strong> khóa học
            </div>
        </div>
    </div>

    <div class="row" style="margin: 100px">
        <c:forEach var="e" items="${listEnrollment}">
            <c:set var="c" value="${e.course}" />
            <div class="col-md-4 mb-4">
                <div class="card h-100 border rounded-4 shadow-sm course-card-custom">
                    <img src="${c.imageUrl}" class="card-img-top" alt="${c.name}" style="height: 200px; object-fit: cover;">
                    <div class="card-body p-4 d-flex flex-column">
                        <h5 class="card-title fw-bold text-dark" style="min-height: 3rem;">
                            ${c.name}
                        </h5>

                        <p class="text-muted mb-2">
                            <i class="bi bi-tags-fill me-1 text-primary"></i> ${c.category}
                        </p>

                        <p class="text-muted mb-3">
                            <i class="bi bi-person-fill text-success me-1"></i> ${c.lecturer}
                        </p>

                        <p class="text-muted mb-3">
                            <i class="bi bi-clock-fill me-1 text-warning"></i>
                            Ngày đăng ký:
                            <fmt:formatDate value="${e.enrollmentDate}" pattern="dd/MM/yyyy" />
                        </p>

                        <div class="mt-auto">
                            <form action="DetailCourseController" method="get">
                                <input type="hidden" name="id" value="${c.courseId}" />
                                <button type="submit" class="btn btn-primary w-100 rounded-pill fw-semibold">
                                    <i class="bi bi-box-arrow-in-right me-1"></i> Tham gia
                                </button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>

    </div>
</div>

<%@ include file="footer.jsp" %>
