<%-- 
    Document   : khanh
    Created on : Jun 25, 2025, 2:27:41 PM
    Author     : CONG NHAT
--%>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<style>
    .mentor{
        margin: 100px 100px;
    }

    .anh img{
        width: 100%;
        border-radius: 50%;
    }

    .khoahoc img{
        width: 100%;
        height: 120px;
    }

    .rating {
        color: #f1c40f;
        font-weight: 500;
    }

    .category {
        font-size: 0.9rem;
        color: black;
    }

    .icon {
        margin-right: 4px;
    }


    .khoahoc_csd {
        border-radius: 10px;
        box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
        transition: transform 0.3s ease, box-shadow 0.3s ease;
        background: #fff;
        overflow: hidden;
    }

    .khoahoc_csd:hover {
        transform: translateY(-5px);
        box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
        border: 2px solid aqua;
    }


    .social-link {
        display: inline-flex;
        align-items: center;
        gap: 10px;
        border: 1.5px solid #3b5998;
        border-radius: 8px;
        padding: 10px 16px;
        margin: 10px 0;
        text-decoration: none;
        color: #3b5998;
        font-weight: 500;
        transition: all 0.3s ease;
    }

    .social-link.youtube {
        border-color: #c4302b;
        color: #c4302b;
    }

    .social-link i {
        font-size: 1.2rem;
    }

    .social-link:hover {
        background-color: #e6f0ff;
        transform: scale(1.02);
    }

    .social-link.youtube:hover {
        background-color: #fce8e6;
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


    .muiten {
        display: inline-block;
        text-decoration: none;
        font-size: 24px;      /* Kích thước biểu tượng */
        color: #007bff;       /* Màu mũi tên */
        padding: 8px 12px;
        border: 2px solid #007bff;
        border-radius: 8px;
        transition: background-color 0.3s, color 0.3s;
        margin-left: 200px;
        margin-top: 200px;
    }

    .muiten:hover {
        background-color: #007bff;
        color: white;
    }





</style>

<div class="container">
    <div class="row thongtin" style="margin:100px 0px;">
        <div class="col-md-8" style="background:#fdfdfd; border-radius:12px; padding:30px; box-shadow:0 4px 16px rgba(0, 0, 0, 0.08); max-width:800px; font-family:'Segoe UI', sans-serif; line-height:1.6;">

            <h4 style="font-size:22px; color:#333; margin-bottom:10px;">
                <i class="fas fa-chalkboard-teacher"></i> Thông tin giảng viên
            </h4>
            <hr>

            <h3 style="font-size:26px; color:#007bff; margin-top:10px; margin-bottom:5px;">
                Nguyễn Châu Thành Sơn
            </h3>

            <p style="font-size:16px; color:#666; margin-bottom:25px;">
                <i class="fas fa-user-tie"></i> Math Team Leader
            </p>

            <h5 style="font-weight:bold; font-size:18px; color:#333; margin-top:40px; margin-bottom:10px;">
                <i class="fas fa-user"></i> Giới thiệu
            </h5>

            <p style="text-align:justify; font-size:15px; color:#444;">
                Mentor Nguyễn Châu Thành Sơn là sinh viên Công nghệ Thông tin có nền tảng Toán học vững chắc, 
                đặc biệt nổi bật ở các môn Toán cao cấp, Toán rời rạc và Thống kê. Với tư duy logic, hệ 
                thống cùng khả năng phân tích sâu sắc, mentor mang đến cách tiếp cận Toán học rõ ràng, 
                dễ hiểu và ứng dụng hiệu quả trong lập trình cũng như các lĩnh vực kỹ thuật.
            </p>

            <h5 style="font-weight:bold; font-size:18px; color:#333; margin-top:40px; margin-bottom:10px;">
                <i class="fas fa-trophy"></i> Thành tích nổi bật
            </h5>

            <ul style="list-style:none; padding-left:0; font-size:15px; color:#444;">
                <li style="margin-bottom:6px;"><i class="fas fa-star" style="color:#ffc107; margin-right:8px;"></i>Là Wibu</li>
                <li style="margin-bottom:6px;"><i class="fas fa-star" style="color:#ffc107; margin-right:8px;"></i>Top 100 SVSX Kỳ Spring 2025</li>
                <li style="margin-bottom:6px;"><i class="fas fa-star" style="color:#ffc107; margin-right:8px;"></i>Top 1 AI Quy Nhơn</li>
            </ul>


            <div class="khoahoc">
                <h5 style="font-weight: 700; margin-top: 40px">Các khóa học</h5>
                <div class="row khoahoc_csd" style="margin-top: 50px; background-color: #eaeaea; padding:10px 0px; border-radius: 15px">
                    <div class="col-md-3 img_khoahoc">
                        <img src="image/mae_img.jpg" alt="alt" style="border-radius: 15px"/>
                    </div>
                    <div class="col-md-6 thongtin_khoahoc">
                        <h5 style="margin-bottom: 40px">MAE101 - Toán cho ngành kỹ thuật</h5>
                        <span class="rating">4.5 ★</span><br>
                        <span class="category"><i class="icon bi bi-person"></i>Software Engineering</span>
                    </div>
                    <div class="col-md-3 gia_khoahoc">
                        <h5 style="font-weight: 300">Important</h5>
                        <h5 style="margin-top: 60px">300.000 VND</h5>
                    </div>
                </div>

                <div class="row khoahoc_csd" style="margin-top: 20px; background-color: #eaeaea; padding:10px 0px; border-radius: 15px">
                    <div class="col-md-3 img_khoahoc">
                        <img src="image/mad_img.jpg" alt="alt" style="border-radius: 15px"/>
                    </div>
                    <div class="col-md-6 thongtin_khoahoc">
                        <h5 style="margin-bottom: 40px">MAD201 - Toán rời rạc</h5>
                        <span class="rating">4.5 ★</span><br>
                        <span class="category"><i class="icon bi bi-person"></i>Software Engineering</span>
                    </div>
                    <div class="col-md-3 gia_khoahoc">
                        <h5 style="font-weight: 300">Important</h5>
                        <h5 style="margin-top: 60px">300.000 VND</h5>
                    </div>
                </div>
                
                <div class="row khoahoc_csd" style="margin-top: 20px; background-color: #eaeaea; padding:10px 0px; border-radius: 15px">
                    <div class="col-md-3 img_khoahoc">
                        <img src="image/mas_img.jpg" alt="alt" style="border-radius: 15px"/>
                    </div>
                    <div class="col-md-6 thongtin_khoahoc">
                        <h5 style="margin-bottom: 40px">MAS301 - Xác suất thống kê</h5>
                        <span class="rating">4.5 ★</span><br>
                        <span class="category"><i class="icon bi bi-person"></i>Software Engineering</span>
                    </div>
                    <div class="col-md-3 gia_khoahoc">
                        <h5 style="font-weight: 300">Important</h5>
                        <h5 style="margin-top: 60px">300.000 VND</h5>
                    </div>
                </div>
            </div>
        </div>








        <div class="col-md-4 anh" style="margin-left: 50px">
            <div>
                <img src="image/son_1.jpg">
                <div class="link" style="text-align: center; margin-top: 40px">
                    <a href="https://www.facebook.com/son.nguen.739" class="social-link" target="_blank">
                        <i class="bi bi-facebook"></i> https://www.facebook.com/son.nguen.7391
                    </a>
                    <br>
                    <a href="https://www.instagram.com/qoka_291/" class="social-link youtube" target="_blank">
                        <i class="bi bi-instagram"></i> https://www.instagram.com/qoka_291/
                    </a>
                </div>


                <a href="khanh.jsp" class="muiten"><i class="fas fa-arrow-right"></i></a>
            </div>

        </div>

    </div>
</div>    

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


    <script>
        function openChat() {
            document.getElementById('chatPopup').style.display = 'block';
        }

        function closeChat() {
            document.getElementById('chatPopup').style.display = 'none';
        }
    </script>


    <%@ include file="footer.jsp" %>
