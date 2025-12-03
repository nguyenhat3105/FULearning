<%-- 
    Document   : khoahoc
    Created on : Jun 27, 2025, 11:41:58 PM
    Author     : CONG NHAT
--%>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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


    .modal-overlay {
        position: fixed;
        inset: 0;
        background: rgba(0, 0, 0, 0.5);
        backdrop-filter: blur(8px);
        display: flex;
        align-items: center;
        justify-content: center;
        z-index: 1050;
    }

    .modal-content {
        background: linear-gradient(135deg, #ffffff, #f0f9ff);
        border-radius: 18px;
        padding: 30px 25px;
        max-width: 480px;
        width: 90%;
        box-shadow: 0 12px 30px rgba(0, 0, 0, 0.2);
        text-align: center;
        animation: fadeIn 0.35s ease;
    }

    .modal-content h4 {
        font-size: 24px;
        font-weight: 700;
        color: #0050a0;
        margin-bottom: 10px;
        text-transform: uppercase;
        letter-spacing: 1px;
    }

    .modal-content p {
        font-size: 15px;
        color: #444;
        margin-bottom: 20px;
    }

    .modal-content img {
        width: 100%;
        max-height: 250px;
        object-fit: cover;
        border-radius: 10px;
        margin-bottom: 20px;
    }

    .modal-content .modal-actions {
        display: flex;
        justify-content: center;
        gap: 12px;
        margin-top: 10px;
        flex-wrap: wrap;
    }

    .modal-content .btn-success {
        background: linear-gradient(90deg, #00c853, #64dd17);
        border: none;
        padding: 10px 20px;
        font-size: 15px;
        font-weight: 600;
        color: white;
        border-radius: 6px;
        box-shadow: 0 4px 8px rgba(0, 200, 83, 0.3);
        transition: transform 0.2s ease;
    }

    .modal-content .btn-success:hover {
        transform: scale(1.05);
    }

    .modal-content .btn-secondary {
        background-color: #eee;
        color: #333;
        padding: 9px 16px;
        border: none;
        border-radius: 6px;
        font-size: 14px;
        transition: background 0.3s;
    }

    .modal-content .btn-secondary:hover {
        background-color: #ddd;
    }



    /* form */

    .form-select {
        border-radius: 10px;
        padding: 8px 16px;
        background: #f5faff;
        border: 1px solid #cce4ff;
        transition: box-shadow 0.2s ease;
    }

    .form-select:focus {
        box-shadow: 0 0 0 2px rgba(0,123,255,0.25);
        border-color: #66b2ff;
    }

    @keyframes fadeIn {
        from {
            opacity: 0;
            transform: scale(0.92);
        }
        to {
            opacity: 1;
            transform: scale(1);
        }
    }

</style>

<div class="container" style="margin-top: 120px;">
    <div class="banner">
        <c:if test="${not empty mess}">
            <div class="alert alert-warning text-center fw-semibold" role="alert">
                ${mess}
            </div>
        </c:if>
        <img src="image/banner_khoa2.png" style="width: 100%; height: 550px">
    </div>

    <div class="row" style="margin: 100px">

        <form action="CheckEnrollController" method="get" class="mb-5 d-flex justify-content-center align-items-center gap-3">
            <input type="hidden" name="category" value="${param.category}" />

            <label class="fw-bold fs-6 mb-0">
                <i class="fas fa-filter me-2 text-primary"></i>Bộ lọc:
            </label>

            <select name="filter" onchange="this.form.submit()" class="form-select w-auto shadow-sm" style="min-width: 220px; font-weight: 500;">
                <option value="" ${empty param.filter ? 'selected' : ''}>Tất cả khóa học</option>
                <option value="notenrolled" ${param.filter eq 'notenrolled' ? 'selected' : ''}>Chưa đăng ký</option>
            </select>
        </form>


        <c:forEach var="c" items="${listCourse}">
            <div class="col-md-4 mb-4">
                <div class="card h-100 shadow-sm">
                    <img src="${c.imageUrl}" class="card-img-top" alt="${c.name}">
                    <div class="card-body">
                        <h5 class="card-title fw-bold" style=" min-height: 3rem; /*điều chỉnh tùy độ dài tiêu đề */
                            ">${c.name}</h5>
                        <p class="card-text text-muted mb-1">${c.category}</p>
                        <p class="card-text">
                            <span class="text-decoration-line-through text-muted me-2">500,000 đ</span>
                            <span class="text-danger fw-bold" style="margin-left: 100px; font-size: 22px">
                                <fmt:formatNumber value="${c.price}" type="number" groupingUsed="true"/> đ
                            </span>
                        </p>
                        <p class="card-text">
                            👨‍🎓 <strong>
                                <c:choose>
                                    <c:when test="${not empty countMap[c.courseId]}">
                                        ${countMap[c.courseId]} học viên
                                    </c:when>
                                    <c:otherwise>0 học viên</c:otherwise>
                                </c:choose>
                            </strong>
                        </p>

                        <form action="EnrolledInCourseController" method="post">
                            <input type="hidden" name="courseId" value="${c.courseId}" />
                            <input type="hidden" name="category" value="${c.category}" />
                            <button type="submit" class="btn btn-primary w-100">
                                <i class="fas fa-cart-shopping me-1" ></i> Đăng ký
                            </button>
                        </form>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>


<c:if test="${showModal}">
    <div id="courseModal" class="modal-overlay">
        <div class="modal-content">
            <h4>${modalTitle}</h4>
            <p><strong style="color: #007bff;">${modalDescription}</strong></p>

            <c:if test="${not empty srcimg}">
                <img src="${srcimg}" alt="Course image">
            </c:if>

            <div class="modal-actions">
                <form action="DetailCourseController" method="get">
                    <input type="hidden" name="id" value="${courseId}" />
                    <button type="submit" class="btn btn-primary w-100 rounded-pill fw-semibold">
                        <i class="bi bi-box-arrow-in-right me-1"></i> Tham gia
                    </button>
                </form>

                <button type="button" class="btn btn-secondary" onclick="closeModal()">Đóng</button>
            </div>
        </div>
    </div>
</c:if>



<script>
    function closeModal() {
        const modal = document.getElementById("courseModal");
        modal.style.display = "none";
    }
</script>



<%@ include file="footer.jsp" %>
