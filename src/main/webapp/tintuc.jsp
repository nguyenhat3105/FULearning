<%-- 
    Document   : tintuc
    Created on : Jun 26, 2025, 12:23:24 AM
    Author     : CONG NHAT
--%>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>


<style>

    .tintuc{
        margin: 100px 100px;

    }

    .thongtin-1 {
        background-color: #e3f2fd;
        border-radius: 12px;
        box-shadow: 0 4px 12px rgba(0, 0, 0, 0.08);
        padding: 20px;
        margin: 20px auto;
        align-items: center;
        transition: all 0.3s ease;
    }

    .thongtin-1:hover {
        transform: translateY(-3px);
        box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
        border: 2px solid #00bcd4; 
    }

    .hinhanh img {
        width: 100%;
        border-radius: 10px;
        object-fit: cover;
        max-height: 250px;
    }

    .thongtin h4 {
        font-weight: 600;
        margin-top: 0px;
    }

    .thongtin p {
        font-size: 17px;
        color: #333;
        line-height: 2.0;
        margin-top: 40px;
    }

    .thongtin i {
        color: #0d6efd;
        margin-right: 8px;
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



</style>

<div class="tintuc">
    <div class="tintuc-img">
        <img src="image/tintuc2.png" alt="alt" style="width: 100%"/>

    </div>
    <div class="tintuc-thongtin">
        <div class="container">
            <div class="row thongtin-1" style="margin-top: 50px">
                <div class="col-md-4 hinhanh">
                    <img src="https://vinkai.com/uploads/dich-vu/2021_05/42871440_1887572957996208_6277740979717931008_o-910x644_1.jpg" alt="Học viên Đạt" />
                </div>
                <div class="col-md-8 thongtin">
                    <h4><i class="bi bi-award-fill"></i>Học viên Đạt giành danh hiệu "Cóc Vàng" kỳ Spring 25</h4>
                    <p>
                        <i class="bi bi-person-fill"></i><strong>Phan Chi Thông</strong> xuất sắc đạt danh hiệu <strong>Cóc Vàng Spring25</strong> với GPA <strong>9.2</strong> và điểm rèn luyện tuyệt đối.<br>
                        <i class="bi bi-book-half"></i>Học viên lớp <strong>PRO192 – Nhập môn lập trình OOP cùng Java</strong>.<br>
                        <i class="bi bi-people-fill"></i>Là mentor nhiệt tình, hỗ trợ các khóa học online và được nhiều học viên yêu mến.
                    </p>
                </div>
            </div>
        </div>
    </div>


    <div class="container">
        <div class="row thongtin-1">
            <div class="col-md-4 hinhanh">
                <img src="https://repository-images.githubusercontent.com/129057303/682f2780-b615-11e9-9c43-26bd8b406ef1" alt="Học viên Đạt" />
            </div>
            <div class="col-md-8 thongtin">
                <h4><i class="bi bi-award-fill"></i>100% học viên khóa Spring25 vượt qua môn lập trình</h4>
                <p>
                    <i class="bi bi-person-fill"></i>Toàn bộ học viên tham gia khóa học<strong>PRO192 – Nhập môn lập trình OOP với Java</strong> đều <strong>vượt qua môn</strong> trong kỳ Spring25.<br>
                    <i class="bi bi-book-half"></i>70% đạt điểm B trở lên, trong đó 12% học viên đạt điểm A+.<br>
                    <i class="bi bi-people-fill"></i>Kết quả chứng minh chất lượng khóa học và sự nỗ lực không ngừng của đội ngũ mentor.
                </p>
            </div>
        </div>
    </div>




    <div class="container">
        <div class="row thongtin-1">
            <div class="col-md-4 hinhanh">
                <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcStU6Wbeay3OFYUYO0StXP14U3Y8YJJMJEc5A&s" alt="Học viên Đạt" />
            </div>
            <div class="col-md-8 thongtin">
                <h4><i class="bi bi-award-fill"></i>Khai giảng khóa học Front-End Web – Khóa SUM25</h4>
                <p>
                    <i class="bi bi-person-fill"></i>Khóa học <strong>“Xây dựng giao diện web chuyên nghiệp với HTML, CSS, JavaScript”</strong> đã chính thức khai giảng hôm nay.<br>
                    <i class="bi bi-book-half"></i>Hơn 150 học viên đăng ký chỉ sau 2 tuần mở đơn.<br>
                    <i class="bi bi-people-fill"></i>Khóa học hứa hẹn đem lại trải nghiệm thực tế, bài bản, và kết nối mentor giàu kinh nghiệm.
                </p>
            </div>
        </div>
    </div>



    <div class="container">
        <div class="row thongtin-1">
            <div class="col-md-4 hinhanh">
                <img src="https://americanstudy.edu.vn/wp-content/uploads/2023/06/hoc-bong-du-hoc.png" alt="Học viên Đạt" />
            </div>
            <div class="col-md-8 thongtin">
                <h4><i class="bi bi-award-fill"></i>Học viên FULearning nhận học bổng lập trình tháng 6</h4>
                <p>
                    <i class="bi bi-person-fill"></i>3 học viên tiêu biểu của hệ thống đã nhận được <strong>học bổng FULearning Developers</strong> tháng 6 trị giá 1.000.000đ.<br>
                    <i class="bi bi-book-half"></i>Tiêu chí gồm: hoàn thành bài tập 100%, tích cực tương tác, hỗ trợ bạn cùng học.<br>
                    <i class="bi bi-people-fill"></i>Đây là phần thưởng nhằm khuyến khích tinh thần học tập chủ động và chia sẻ.
                </p>
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