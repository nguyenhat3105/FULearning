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
import java.util.List;

/**
 *
 * @author CONG NHAT
 */
@WebServlet(name = "DetailCourseController", urlPatterns = {"/DetailCourseController"})
public class DetailCourseController extends HttpServlet {

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
            out.println("<title>Servlet DetailCourseController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet DetailCourseController at " + request.getContextPath() + "</h1>");
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

        String idRaw = request.getParameter("id");

        if (idRaw == null || idRaw.isEmpty()) {
            // Không có id được gửi => quay lại trang chủ hoặc báo lỗi
            request.setAttribute("error", "Thiếu ID khóa học.");
            request.getRequestDispatcher("error.jsp").forward(request, response);
            return;
        }

        try {
            int courseId = Integer.parseInt(idRaw);

            // tiếp tục xử lý...
            EnrollmentRepository enro = new EnrollmentRepository();
            List<Student> list = enro.getStudentByCourseID(courseId);
            CourseDAL csd = new CourseDAL();
            Course course = new Course();
            course = csd.getCourseById(courseId);

            request.setAttribute("list", list);
            request.setAttribute("course", course);
            request.getRequestDispatcher("detailCourse.jsp").forward(request, response);
        } catch (NumberFormatException e) {
            request.setAttribute("error", "ID không hợp lệ.");
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
