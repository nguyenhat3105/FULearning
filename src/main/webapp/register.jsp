<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<style>
    body {
        margin: 0;
        padding: 0;
        background: radial-gradient(ellipse at bottom, #0d1b2a 0%, #000 100%);
        height: 100vh;
        font-family: Arial, sans-serif;
        overflow-x: hidden;
        margin-top: 20px;
    }

    .login-wrapper {
        display: flex;
        height: 100vh;
    }

    .left-info {
        background-color: transparent;
        padding: 150px 130px;

    }

    .left-info h2 {
        font-weight: bold;
        font-size: 2.2rem;
        line-height: 1.5;
    }

    .highlight {
        color: #00e6d0;
        position: relative;
    }

    .highlight::after {
        content: '';
        position: absolute;
        bottom: -5px;
        left: 0;
        width: 100%;
        height: 4px;
        background: #00e6d0;
        opacity: 0.5;
    }

    .feature-list {
        list-style: none;
        padding-left: 0;
        margin-top: 30px;
    }

    .feature-list li {
        background-color: #001f3f;
        padding: 10px 15px;
        margin: 10px 0;
        border-radius: 5px;
        font-weight: 500;
        display: flex;
        align-items: center;
    }

    .feature-list li span {
        font-size: 20px;
        color: #00e6d0;
        margin-right: 10px;
    }

    .partners img {
        background: white;
        border-radius: 5px;
        padding: 3px;
    }

    .login-section {
        width: 400px;
        margin: auto;
        padding: 30px;
        background: rgba(255, 255, 255, 0.05);
        border: 1px solid rgba(255, 255, 255, 0.15);
        border-radius: 15px;
        backdrop-filter: blur(10px);
        box-shadow: 0 0 20px rgba(0, 255, 255, 0.2);
    }

    .login-section h2 {
        text-align: center;
        font-size: 2rem;
        color: #00eaff;
        margin-bottom: 25px;
    }

    .form-group label {
        color: #fff;
    }

    .form-control {
        width: 100%;
        padding: 10px;
        background: rgba(255, 255, 255, 0.1);
        border: 1px solid #00eaff;
        border-radius: 5px;
        color: #fff;
        margin-bottom: 10px;
    }

    .form-control::placeholder {
        color: #ccc;
    }

    .btn-submit {
        width: 100%;
        background-color: #00eaff;
        border: none;
        padding: 12px;
        border-radius: 5px;
        color: black;
        font-weight: bold;
        cursor: pointer;
        transition: background 0.3s ease;
    }

    .btn-submit:hover {
        background-color: #00bcd4;
    }

    .text-center {
        text-align: center;
    }

    .login-section a {
        color: #00eaff;
        text-decoration: none;
    }

    .login-section a:hover {
        text-decoration: underline;
    }

    .social-login {
        text-align: center;
        margin-top: 30px;
    }

    .social-icons {
        display: flex;
        justify-content: center;
        gap: 15px;
        margin-top: 15px;
    }

    .social-btn {
        display: flex;
        justify-content: center;
        align-items: center;
        width: 48px;
        height: 48px;
        border: 1px solid #ccc;
        border-radius: 8px;
        font-size: 20px;
        color: #333;
        background-color: #fff;
        transition: all 0.3s ease;
    }

    .social-btn:hover {
        background-color: #eaeaea;
        transform: translateY(-2px);
    }



</style>

<div class="row login-wrapper">
    <!-- Left side -->
    <div class="col-md-6 left-info text-white">
        <h2>
            Nền tảng học tập trực tuyến dành riêng 
            cho <span style="color: aqua">sinh viên FPT</span>
            <img src="image/vet.png" alt="underline" class="w-[148px] sm:w-[119.41px] md:w-[198px] h-[8.97px] sm:h-3 md:h-3">
        </h2>


        <img src="image/logo_fu.png" alt="alt" style="width: 500px"/>




    </div>

    <!-- Right side (Login Form) -->
    <div class="col-md-6 d-flex align-items-center justify-content-center">
        <section class="login-section">
            <h2>Đăng kí</h2>
            <form action="RegisterController" method="post">
                <div class="form-group mb-4">
                    <input type="text" class="form-control" name="fullname" id="fullname" placeholder="Nhập họ và tên của bạn" required>
                </div>
                <div class="form-group mb-4">
                    <input type="email" class="form-control" name="email" id="email" placeholder="Nhập email của bạn" required>
                </div>
                <div class="form-group mb-4">
                    <input type="password" class="form-control" name="password" id="password" placeholder="Nhập mật khẩu" required>
                </div>
                <div class="form-group mb-4">
                    <input type="text" class="form-control" name="phoneNumber" id="phoneNumber" placeholder="Nhập số điện thoại" required>
                </div>
                <div class="form-group mb-4">
                    <input type="String" class="form-control" name="dateOfBirth" id="dateOfBirth" placeholder="Nhập ngày tháng năm sinh" required>
                </div>
                <button type="submit" class="btn btn-submit">Đăng kí</button>
                <div class="text-center mt-3" style="color: white">
                    <p>Bạn đã có tài khoản?</p>
                    <a href="login.jsp">Đăng nhập ngay</a>
                    <p style="color: ${mess_check == 'Registration successful' ? 'greenyellow' : 'red'}; margin-top: 15px">
                        ${mess_check}
                    </p>
                </div> 
                <hr style="color: white">
                <div class="social-login">
                    <p style="color: white">Hoặc tiếp tục với</p>
                    <div class="social-icons">
                        <a href="#" class="social-btn microsoft"><i class="fab fa-windows"></i></a>
                        <a href="#" class="social-btn google"><i class="fab fa-google"></i></a>
                        <a href="#" class="social-btn github"><i class="fab fa-github"></i></a>
                    </div>
                </div>
            </form>
        </section>
    </div>
</div>

<%@ include file="footer.jsp" %>
