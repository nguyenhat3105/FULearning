/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAL.CourseDAL;
import DAL.EnrollmentRepository;
import Entity.Course;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.Map;

/**
 *
 * @author CONG NHAT
 */
@WebServlet(name = "EnrollmentControllerAll", urlPatterns = {"/EnrollmentControllerAll"})
public class EnrollmentControllerAll extends HttpServlet {

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
            out.println("<title>Servlet EnrollmentControllerAll</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EnrollmentControllerAll at " + request.getContextPath() + "</h1>");
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

        EnrollmentRepository enro = new EnrollmentRepository();
        Map<Integer, Long> countMap = enro.countStudentsByCourseMap();

        CourseDAL cs = new CourseDAL();
        List<Course> listCourse = cs.getAllCourse();

        if (countMap != null) {
            Collections.sort(listCourse, new Comparator<Course>() {
                @Override
                public int compare(Course c1, Course c2) {
                    long count1 = 0L;
                    long count2 = 0L;

                    if (countMap.containsKey(c1.getCourseId())) {
                        count1 = countMap.get(c1.getCourseId());
                    }

                    if (countMap.containsKey(c2.getCourseId())) {
                        count2 = countMap.get(c2.getCourseId());
                    }

                    // Sắp xếp giảm dần theo số lượng
                    return Long.compare(count2, count1);
                }
            });
        }

        request.setAttribute("countMap", countMap);

        request.setAttribute("listCourse", listCourse);

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
