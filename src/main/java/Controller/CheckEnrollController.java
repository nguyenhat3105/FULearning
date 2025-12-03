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
import java.util.Map;

/**
 *
 * @author CONG NHAT
 */
@WebServlet(name = "CheckEnrollController", urlPatterns = {"/CheckEnrollController"})
public class CheckEnrollController extends HttpServlet {

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
            out.println("<title>Servlet CheckEnrollController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CheckEnrollController at " + request.getContextPath() + "</h1>");
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

        Student student = (Student) request.getSession().getAttribute("student");

        String category = request.getParameter("category"); // ví dụ: "language"
        String filter = request.getParameter("filter");     // ví dụ: "notenrolled"

        CourseDAL courseDAL = new CourseDAL();
        EnrollmentRepository enrollmentDAL = new EnrollmentRepository();

        List<Course> listCourse;

        if ("notenrolled".equals(filter)) {
            if (category != null && !category.isEmpty()) {
                listCourse = courseDAL.getNotEnrolledCoursesByCategory(student.getId(), category);
            } else {
                listCourse = courseDAL.getNotEnrolledCourses(student.getId());
            }
        } else {
            if (category != null && !category.isEmpty()) {
                listCourse = courseDAL.getByCategory(category);
            } else {
                listCourse = courseDAL.getAllCourse();
            }
        }

        Map<Integer, Long> countMap = enrollmentDAL.countStudentsByCourseMap();

        request.setAttribute("listCourse", listCourse);
        request.setAttribute("countMap", countMap);
        request.setAttribute("filter", filter);
        request.setAttribute("category", category);
        request.getRequestDispatcher("khoahoc.jsp").forward(request, response);
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
