<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*, Entity.Course, DAL.CourseDAL" %>
<%@ include file="header.jsp" %>


<%   List<Course> listCourses = new CourseDAL().getAllCourse();
    request.setAttribute("listCourses", listCourses);
%>

<style>
    .slideshow-container {
        width: 1000px;
        margin: auto;
        overflow: hidden;
        position: relative;
    }

    .slide-wrapper {
        display: flex;
        transition: transform 0.8s ease-in-out; /* Tăng thời gian để mượt hơn */
        width: calc(1000px * 3); /* 3 ảnh */
    }

    .slide {
        flex: 0 0 1000px;
    }

    .slide img {
        width: 100%;
        height: auto;
        display: block;
    }

    .prev, .next {
        position: absolute;
        top: 50%;
        transform: translateY(-50%);
        font-size: 30px;
        padding: 10px;
        color: white;
        background-color: rgba(0, 0, 0, 0.5);
        cursor: pointer;
        z-index: 100;
    }

    .prev:hover, .next:hover {
        background-color: rgba(0, 0, 0, 0.8);
    }

    .prev {
        left: 0;
    }
    .next {
        right: 0;
    }








    .course-carousel {
        max-width: 1200px;
        margin: auto;
        position: relative;
    }

    .carousel-container {
        display: flex;
        overflow-x: auto;
        scroll-behavior: smooth;
        padding: 20px 0;
    }

    .course-card {
        background-color: white;
        border-radius: 15px;
        box-shadow: 0 2px 8px rgba(0,0,0,0.1);
        min-width: 270px;
        margin-right: 20px;
        flex-shrink: 0;
        padding: 0 0 15px 0;
    }

    .course-card img {
        border-top-left-radius: 15px;
        border-top-right-radius: 15px;
        width: 100%;
        height: 170px;
        object-fit: cover;
    }

    .price-old {
        text-decoration: line-through;
        color: gray;
        font-size: 14px;
    }

    .price-new {
        font-weight: bold;
        font-size: 22px;
    }

    .rating {
        color: #f1c40f;
        font-size: 15px;
    }

    .scroll-btn {
        position: absolute;
        top: 50%;
        transform: translateY(-50%);
        font-size: 30px;
        color: #333;
        background: #fff;
        border-radius: 50%;
        width: 40px;
        height: 40px;
        text-align: center;
        line-height: 40px;
        box-shadow: 0 0 6px rgba(0,0,0,0.2);
        cursor: pointer;
        z-index: 10;
    }

    .scroll-left {
        top: -20px;
        right: 40px;
    }

    .scroll-right {
        right: -20px;
        top: -20px;
    }




    .news-section {
        padding: 30px;
        background: #f8f8f8;
        border-radius: 10px;
    }

    .news-grid {
        display: flex;
        gap: 30px;
    }

    .news-left {
        flex: 1;
        background-color: #fff;
        border-radius: 10px;
        padding: 20px;
        position: relative;
    }

    .news-right {
        flex: 2;
        display: grid;
        grid-template-columns: repeat(2, 1fr);
        gap: 20px;
    }

    .news-card {
        background-color: #fff;
        border-radius: 10px;
        padding: 20px;
        position: relative;
        height: 100%;
    }

    .label {
        position: absolute;
        top: 0;
        left: 0;
        background-color: #3b49df;
        color: #fff;
        padding: 5px 10px;
        border-radius: 0 0 8px 0;
        font-size: 14px;
    }

    .news-card h3 {
        margin-top: 40px;
        font-size: 18px;
        color: #222;
    }

    .news-card .date {
        font-size: 14px;
        color: #888;
        margin-top: 10px;
    }

    .see-all {
        display: block;
        text-align: center;
        margin-top: 30px;
        color: #2f3fcf;
        font-weight: bold;
        text-decoration: none;
    }

    .news-right img{
        height: 230px;
        width: 100%;
    }

    .news-grid h3{
        margin-bottom: 20px;
    }

    .my-5{
        background-color: #f8f8f8;
        padding: 30px;
        border-radius: 10px;
    }




    /*section-4 */
    .grid-container {
        display: grid;
        grid-template-columns: repeat(3, 1fr); /* 3 cột có độ rộng bằng nhau */
        gap: 20px; /* khoảng cách giữa các ô */
        padding: 20px;
    }

    .grid-item {
        background-color: #e3f2fd;
        padding: 20px;
        border-radius: 10px;
        text-align: center;
        box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
        font-weight: bold;
    }

    .text-grid p{
        font-weight: 400;
        margin-top: 20px;
    }

    .text-grid {
        padding: 20px;
    }


    /* section-5 */

    .grid-container2 {
        display: grid;
        grid-template-columns: 1fr 1fr; /* 2 cột: trái 1 phần, phải 2 phần */
        gap: 10px;
    }

    .left-column {

        display: grid;
        grid-template-rows: repeat(3, 1fr); /* Chia thành 3 hàng bằng nhau */
        gap: 10px;
    }

    .right-column {

    }

    .row2 {
        background-color: #e3f2fd;
        padding: 10px;
    }

    .section-5 {
        padding: 100px;
    }

    .grid-box {
        transition: all 0.3s ease;
        border: 1px solid transparent;
        border-radius: 10px;
    }

    .grid-box:hover {
        box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2);
        border-color: #007bff;
        transform: translateY(-4px); /* nổi nhẹ lên */
        background-color: #f8f9fa;
    }


    /* Section-1 */



    /* Star background */
    .stars::before {
        content: '';
        position: absolute;
        top: 0;
        left: 0;
        width: 200%;
        height: 200%;
        background: transparent url('https://raw.githubusercontent.com/VincentGarreau/particles.js/master/demo/media/star.png') repeat;
        animation: moveStars 100s linear infinite;
        opacity: 0.2;
        z-index: 1;
    }

    @keyframes moveStars {
        from {
            transform: translate(0, 0);
        }
        to {
            transform: translate(-100px, -100px);
        }
    }

    /* Centered content */
    .content {
        position: relative;
        z-index: 10;
        text-align: center;
        top: 38%;
        transform: translateY(-50%);
    }

    h1 {
        font-size: 3em;
        color: #00ffff;
        text-shadow: 0 0 10px #00d4ff, 0 0 20px #00d4ff;
    }

    .section-1 p {
        font-size: 1.2em;
        color: #a0faff;
        margin-top: 20px;
    }

    /* Planet and orbit */
    .orbit-container {
        position: absolute;
        top: 60%;
        left: 50%;
        width: 200px;
        height: 200px;
        margin-left: -100px;
        margin-top: -100px;
        z-index: 2;
        border: 1px dashed rgba(0, 255, 255, 0.3);
        border-radius: 50%;
        animation: rotateOrbit 10s linear infinite;
    }

    .planet {
        position: absolute;
        top: 50%;
        left: 0%;
        width: 30px;
        height: 30px;
        background: linear-gradient(145deg, #0ff, #005d7a);
        border-radius: 50%;
        box-shadow: 0 0 10px #00f0ff;
        transform: translateY(-50%);
    }

    @keyframes rotateOrbit {
        0% {
            transform: rotate(0deg);
        }
        100% {
            transform: rotate(360deg);
        }
    }

    /* Buttons */
    .buttons {
        position: absolute;
        bottom: 40px;
        width: 100%;
        text-align: center;
        z-index: 10;
    }

    .buttons a {
        background: transparent;
        border: 1px solid #00ffff;
        color: #00ffff;
        padding: 10px 20px;
        margin: 0 10px;
        border-radius: 20px;
        cursor: pointer;
        transition: all 0.3s ease;
        text-decoration: none;
    }

    .buttons a:hover {
        background: #00ffff;
        color: #000;
        box-shadow: 0 0 10px #00ffff;
    }


    /* Section-6 */

    .chat-button {
        position: fixed;
        bottom: 20px;
        right: 20px;
        background-color: #00d4ff;
        color: white;
        font-size: 24px;
        padding: 14px 16px;
        border-radius: 50%;
        box-shadow: 0 0 15px rgba(0, 212, 255, 0.5);
        cursor: pointer;
        z-index: 1000;
        transition: transform 0.2s ease;
    }

    .chat-button:hover {
        transform: scale(1.1);
    }

    .chat-popup {
        display: none;
        position: fixed;
        bottom: 80px;
        right: 20px;
        width: 300px;
        background: white;
        border: 1px solid #00d4ff;
        border-radius: 8px;
        z-index: 1000;
        box-shadow: 0 0 20px rgba(0, 212, 255, 0.3);
        color: black;
        font-family: Arial, sans-serif;
    }

    .chat-header {
        padding: 10px;
        background: #0d1b2a;
        color: white;
        font-weight: bold;
        display: flex;
        justify-content: space-between;
        align-items: center;
        border-top-left-radius: 8px;
        border-top-right-radius: 8px;
    }

    .chat-body {
        padding: 10px;
    }

    .chat-body textarea {
        width: 100%;
        height: 60px;
        resize: none;
        margin-top: 10px;
        border-radius: 4px;
        padding: 8px;
        font-family: inherit;

    }

    .chat-body button {
        margin-top: 10px;
        width: 100%;
        background-color: #00d4ff;
        border: none;
        color: white;
        font-weight: bold;
        padding: 8px;
        border-radius: 4px;
        cursor: pointer;
    }

    .close-btn {
        cursor: pointer;
        font-size: 20px;
    }


    .section-title {
        opacity: 0;
        transform: translateY(30px);
        transition: all 0.6s ease-out;
    }

    .section-title.visible {
        opacity: 1;
        transform: translateY(0);
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

<section class="section-1">
    <div class="section-1" style="height: 100vh;
         background: radial-gradient(ellipse at bottom, #0d1b2a 0%, #000 100%);
         overflow: hidden;
         font-family: 'Courier New', monospace;
         color: #00d4ff;
         position: relative;">

        <div class="stars"></div>

        <div class="content">
            <h1>Welcome to FU Learning</h1>
            <p>Explore, learn, and create the future.</p>
        </div>

        <div class="orbit-container">
            <div class="planet"></div>
        </div>

        <div class="buttons">
                    <a href="EnrollmentController?category=Software%20Engineering">Programming</a>
                    <a href="EnrollmentController?category=Mathematics">Mathematics</a>
                    <a href="EnrollmentController?category=Language">Languages</a>
        </div>

    </div>

</section>

<section class="section-2" style="margin: auto; margin-top: 100px">
    <div class="container my-5" >
        <h2 class="fw-bold mb-4 section-title" style="margin:50px 0px 50px 80px; text-align: center">Khóa học nổi bật</h2>

        <div class="course-carousel">
            <!-- Nút scroll -->
            <div class="scroll-btn scroll-left" onclick="scrollCarousel(-1)">
                <i class="fas fa-angle-double-left"></i>
            </div>

            <div class="carousel-container" id="carousel" style="overflow-x: hidden">
                <!-- CARD 1 -->
                <c:forEach var="c" items="${listCourses}">
                    <div class="grid-box course-card" style="width: 300px">
                        <img src="${c.imageUrl}" alt="">
                        <div class="p-3">
                            <h5 class="fw-bold">${c.name}</h6>
                                <p class="text-muted mb-1">${c.category}</p>
                                <span class="price-old" style="margin-right: 30px">500,000 đ</span>
                                <span class="price-new ms-2" style="font-size: 1.5rem; font-weight: bold;">
                                    <fmt:formatNumber value="${c.price}" type="number" groupingUsed="true"/> đ
                                </span>
                                <div class="rating mt-2">
                                    <span>4.5</span> 
                                    <i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star-half-alt"></i>
                                    <span class="text-muted ms-1">(0)</span>
                                </div>
                                <div class="text-end mt-2">
                                    <form action="IndexController" method="post">
                                        <input type="hidden" name="courseId" value="${c.courseId}" />
                                        <button type="submit" class="btn btn-primary btn-sm">
                                            <i class="fas fa-cart-shopping"></i>
                                        </button>
                                    </form>
                                        
                                </div>
                        </div>
                    </div>
                </c:forEach>


            </div>

            <!-- Nút scroll -->
            <div class="scroll-btn scroll-right" onclick="scrollCarousel(1)">
                <i class="fas fa-angle-double-right"></i>
            </div>
        </div>

        <div class="text-center mt-3">
            <a href="#" class="text-decoration-none fw-semibold">Xem tất cả</a>
        </div>
    </div>
</section>



<section class="section-3" style="padding: 0px 100px;border-radius: 20px">

    <div class="news-section">
        <h2 style="margin: 50px 0px; text-align: center">Mentor - Giàu kinh nghiệm</h2>
        <div class="news-grid">

            <!-- Cột trái: tin mới nhất -->
            <div class="grid-box news-left">
                <a href="khanh.jsp" class="news-card latest" style="text-decoration: none">
                    <span class="label">Mentor</span>

                    <img src="image/khanh_1.jpg" style="width: 500px">
                    <h3>HỒ LÊ QUỐC KHÁNH</h3>
                    <p style="color:#3498db;"><i class="fas fa-laptop-code"></i> Frontend - React, UI/UX</p>
                    <p style="color:#27ae60;"><i class="fas fa-briefcase"></i><strong> Môn học:</strong> CSD201, WED201c</p>
                    <p style="color:#7f8c8d;">	<i class="fas fa-trophy"></i><strong> Thành tích: </strong> Top 1 SE Quy Nhơn </p>

                </a>
            </div>

            <!-- Cột phải: tin nổi bật -->
            <div class="news-right">
                <a href="triet.jsp" class="grid-box news-card hot" style="text-decoration: none">
                    <span class="label">Mentor</span>
                    <img src="image/triet_1.jpg">
                    <h3>NGUYỄN MINH TRIẾT</h3>
                    <p style="color:#3498db;"><i class="fas fa-laptop-code"></i> Frontend - React, UI/UX</p>
                    <p style="color:#27ae60;"><i class="fas fa-briefcase"></i><strong> Môn học: </strong>PRF192, PRO192</p>
                    <p style="color:#7f8c8d;"><i class="fas fa-trophy"></i><strong> Thành tích: </strong>Đệ ruột cô Thuyền</p>
                </a>
                <a href="minh.jsp" class="grid-box news-card hot" style="text-decoration: none">
                    <span class="label">Mentor</span>
                    <img src="image/minh_1.jpg">
                    <h3>NGUYỄN QUANG MINH</h3>
                    <p style="color:#3498db;"><i class="fas fa-laptop-code"></i> N0 - JLPT</p>
                    <p style="color:#27ae60;"><i class="fas fa-briefcase"></i><strong> Môn học: </strong>JPD113, JPD123, JPD133</p>
                    <p style="color:#7f8c8d;"><i class="fas fa-trophy"></i><strong> Thành tích: </strong>Người Việt gốc Mỹ</p>
                </a>
                <a href="tuan.jsp" class="grid-box news-card hot" style="text-decoration: none">
                    <span class="label">Mentor</span>
                    <img src="image/tuan_1.jpg">
                    <h3>NGUYỄN ANH TUẤN</h3>
                    <p style="color:#3498db;"><i class="fas fa-laptop-code"></i> Backend Development</p>
                    <p style="color:#27ae60;"><i class="fas fa-briefcase"></i><strong> Môn học: </strong>DBI202, CEA201, CSI106</p>
                    <p style="color:#7f8c8d;"><i class="fas fa-trophy"></i><strong> Thành tích: </strong>MongoDB Certified Developer - MongoDB Univ</p>

                </a>
                <a href="son.jsp" class="grid-box news-card hot" style="text-decoration: none">
                    <span class="label">Menor</span>
                    <img src="image/son_1.jpg">
                    <h3>NGUYỄN THÀNH SƠN</h3>
                    <p style="color:#3498db;"><i class="fas fa-laptop-code"></i> Applied Mathematics for Data Science</p>
                    <p style="color:#27ae60;"><i class="fas fa-briefcase"></i><strong> Môn học: </strong>MAE101, MAD101</p>
                    <p style="color:#7f8c8d;"><i class="fas fa-trophy"></i><strong> Thành tích: </strong>Certificate in Logic and Algorithms – MITx</p>
                </a>
            </div>

        </div>

        <a href="#" class="see-all">Xem tất cả</a>
    </div>
</section>



<section class="section-4" style="margin: 100px">
    <h2 style="text-align: center; margin-bottom: 50px">Tại sao bạn nên chọn chúng tôi?</h2>
    <div class="grid-container">

        <div class="grid-item">
            <img src="image/sec4_1.png">
            <div class="text-grid">
                <h5>Phát triển tư duy & định hướng môn học rõ ràng</h5>
                <p>FUL giúp sinh viên rèn luyện khả năng tư duy và định hướng môn học một cách có hệ thống và bài bản.</p>
            </div>

        </div>

        <div class="grid-item">
            <img src="image/sec4_2.png">
            <div class="text-grid">
                <h5>Tham gia các cuộc thi lập trình và giải thuật trong hệ thống</h5>
                <p>FUL không chỉ hỗ trợ trong học tập mà còn hướng tới cho sinh viên các cuộc thi lập trình và giải thuật, giúp sinh viên có cơ hội cọ xát và đạt được thành tích tốt.</p>
            </div>
        </div>

        <div class="grid-item">
            <img src="image/sec4_3.png">
            <div class="text-grid">
                <h5>100% Sinh viên qua môn với điểm số cao</h5>
                <p>FUL đã trở thành một thương hiệu có uy tín được nhiều sinh viên lựa chọn, nổi bật với cóc vàng các kì Fall24, Spring25 cùng vô số các sinh viên xuất sắc và giỏi.</p>
            </div>
        </div>
    </div>

</section>



<section class="section-5">
    <h2 style="text-align: center; margin-bottom: 50px">Lộ trình học tập</h2>
    <div class="grid-container2">
        <div class="left-column">
            <div class="grid-box row" style="padding: 40px; background-color: #e3f2fd; border-radius: 20px">

                <div class="col-md-2 sec5_1">
                    <img src="image/sec5_1.webp" alt="alt"/>
                </div>

                <div class="col-md-10 sec5_1" style="padding: 0px 70px">
                    <h3>Đào tạo lý thuyết và thực hành</h3>
                    <p>Lộ trình khoá học bài bản từ A -> Z. Chất lượng chuyên sâu, cam kết đầu ra</p>
                </div>

            </div>

            <div class="grid-box row" style="padding: 40px; background-color: #e3f2fd; border-radius: 20px">

                <div class="col-md-2 sec5_1">
                    <img src="image/sec5_2.webp" alt="alt"/>
                </div>

                <div class="col-md-10 sec5_2" style="padding: 0px 70px">
                    <h3>Cùng học tập, cùng chia sẻ</h3>
                    <p>Các blog cập nhật tin tức, sự kiện, vinh danh học viên nhà FULearning.</p>
                </div>

            </div>


            <div class="grid-box row" style="padding: 40px; background-color: #e3f2fd; border-radius: 20px">

                <div class="col-md-2 sec5_1">
                    <img src="image/sec5_3.webp" alt="alt" />
                </div>

                <div class="col-md-10 sec5_2" style="padding: 0px 70px">
                    <h3>Cải thiện chất lượng, nâng cao thành tích</h3>
                    <p>Đội ngũ mentor chuyên nghiệp, trình độ cao, có chất lương chuyên môn sâu và nhiệt huyết./p>
                </div>

            </div>
        </div>
        <div class="grid-box right-column" style="border-radius: 20px; margin-left: 20px">
            <img src="image/lotrinhmoi.png" alt="alt" style="width: 100%;border-radius: 20px"/>
        </div>
    </div>

</section>


<section class="section-6">
    <div class="chat-button" onclick="openChat()">
        💬
    </div>

    <!-- Chat popup (ẩn mặc định) -->
    <div class="chat-popup" id="chatPopup">
        <div class="chat-header">Chat <span onclick="closeChat()" class="close-btn">&times;</span></div>
        <div class="chat-body">
            <p><em>Hi! How can I help you?</em></p>
            <textarea placeholder="Type your message..."></textarea>
            <button>Send</button>
        </div>
    </div>
</section>


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
    // Đợi DOM tải xong trước khi chạy JavaScript
    document.addEventListener("DOMContentLoaded", function () {
        let slideIndex = 0;
        const slideWidth = 1000;
        const slideWrapper = document.getElementById("slideWrapper");
        const prevBtn = document.getElementById("prevBtn");
        const nextBtn = document.getElementById("nextBtn");
        const totalSlides = slideWrapper.children.length;

        function updateSlide() {
            slideWrapper.style.transform = `translateX(-${slideIndex * slideWidth}px)`;
        }

        function plusSlides(n) {
            slideIndex = (slideIndex + n + totalSlides) % totalSlides;
            updateSlide();
        }

        // Thêm sự kiện cho nút
        prevBtn.addEventListener("click", () => plusSlides(-1));
        nextBtn.addEventListener("click", () => plusSlides(1));

        // Tự động chuyển slide sau mỗi 5 giây
        setInterval(() => plusSlides(1), 5000);

        // Khởi động slide đầu tiên
        updateSlide();
    });
</script>


<script>
    function scrollCarousel(direction) {
        const container = document.getElementById('carousel');
        const scrollAmount = 300;
        container.scrollBy({
            left: direction * scrollAmount,
            behavior: 'smooth'
        });
    }
</script>

<script>
    function openChat() {
        document.getElementById('chatPopup').style.display = 'block';
    }

    function closeChat() {
        document.getElementById('chatPopup').style.display = 'none';
    }
</script>

<script>
    document.addEventListener('DOMContentLoaded', function () {
        const observer = new IntersectionObserver((entries) => {
            entries.forEach(entry => {
                if (entry.isIntersecting) {
                    entry.target.classList.add('visible');
                }
            });
        });

        const title = document.querySelector('.section-title');
        if (title) {
            observer.observe(title);
        }
    });
</script>

<script>
    function closeModal() {
        const modal = document.getElementById("courseModal");
        modal.style.display = "none";
    }
</script>

<%@ include file="footer.jsp" %>