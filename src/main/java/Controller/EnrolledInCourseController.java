/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAL.CourseDAL;
import DAL.EnrollmentRepository;
import Entity.Course;
import Entity.Student;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

/**
 *
 * @author CONG NHAT
 */
@WebServlet(name = "EnrolledInCourseController", urlPatterns = {"/EnrolledInCourseController"})
public class EnrolledInCourseController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet EnrolledInCourseController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EnrolledInCourseController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int courseId = Integer.parseInt(request.getParameter("courseId"));
        String category = request.getParameter("category");

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("student") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        Student student = (Student) session.getAttribute("student");

        CourseDAL csd = new CourseDAL();
        Course course = csd.getCourseById(courseId);

        EnrollmentRepository enro = new EnrollmentRepository();

        boolean isAlreadyRegistered = !enro.enrollStudentInCourse(student, course);

        // Gửi thông tin modal
        request.setAttribute("showModal", true);
        request.setAttribute("modalTitle", isAlreadyRegistered ? "Khóa học đã được đăng ký" : "Đăng ký thành công!");
        request.setAttribute("modalDescription", "Khóa học: \"" + course.getName() + "\"");
        request.setAttribute("courseId", courseId);
        request.setAttribute("courseName", course.getName());
        request.setAttribute("isRegistered", isAlreadyRegistered);
        request.setAttribute("srcimg", course.getImageUrl());

        // Danh sách khóa học theo category
        List<Course> listCourse = csd.getByCategory(category);
        request.setAttribute("listCourse", listCourse);

        // 🔁 Gọi lại hàm count học viên
        Map<Integer, Long> countMap = enro.countStudentsByCourseMap();
        request.setAttribute("countMap", countMap);

        // Trả về trang khoahoc.jsp
        request.getRequestDispatcher("khoahoc.jsp").forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
