/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Entity.Course;
import Entity.Enrollment;
import Entity.EnrollmentId;
import Entity.Student;
import Util.JpaUtil;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 *
 * @author CONG NHAT
 */
public class EnrollmentRepository {

    private EntityManager em;

    public EnrollmentRepository() {
        this.em = JpaUtil.getEntityManagerFactory().createEntityManager();
    }

    public Map<Integer, Long> countStudentsByCourseMap() {
        String jpql = "SELECT e.course.id, COUNT(e.student.id) FROM Enrollment e GROUP BY e.course.id";
        List<Object[]> results = em.createQuery(jpql).getResultList();

        Map<Integer, Long> map = new HashMap<>();
        for (Object[] row : results) {
            map.put((Integer) row[0], (Long) row[1]);
        }

        return map;
    }

    public List<Course> getCourseByStudentId(int studentId) {
        String jpql = "SELECT e.course FROM Enrollment e WHERE e.student.id = :studentId";
        return em.createQuery(jpql, Course.class)
                .setParameter("studentId", studentId)
                .getResultList();

    }

    public boolean isStudentEnrolledInCourse(int studentId, int courseId) {
        System.out.println(">>> Kiểm tra xem studentId=" + studentId + " đã đăng ký courseId=" + courseId + " chưa");

        String jpql = "SELECT COUNT(e) FROM Enrollment e WHERE e.student.id = :studentId AND e.course.id = :courseId";
        Long count = em.createQuery(jpql, Long.class)
                .setParameter("studentId", studentId)
                .setParameter("courseId", courseId)
                .getSingleResult();

        System.out.println(">>> Số lượng bản ghi tìm thấy: " + count);
        return count > 0;
    }

    public boolean enrollStudentInCourse(Student student, Course course) {
        if (isStudentEnrolledInCourse(student.getId(), course.getCourseId())) {
            return false;
        }

        EntityTransaction tx = em.getTransaction();
        try {
            tx.begin();

            // 🔧 Gắn course và student vào cùng context trước
            student = em.merge(student);
            course = em.merge(course);

            Enrollment enrollment = new Enrollment();
            enrollment.setId(new EnrollmentId(student.getId(), course.getCourseId()));
            enrollment.setStudent(student);
            enrollment.setCourse(course);
            enrollment.setEnrollmentDate(new Date());

            em.persist(enrollment);
            tx.commit();
            return true;
        } catch (Exception e) {
            if (tx.isActive()) {
                tx.rollback();
            }
            e.printStackTrace();
            return false;
        }
    }

    public List<Enrollment> getEnrollmentsByStudentId(int studentId) {
        EntityManager em = JpaUtil.getEntityManagerFactory().createEntityManager();
        try {
            return em.createQuery(
                    "SELECT e FROM Enrollment e JOIN FETCH e.course WHERE e.student.id = :studentId", Enrollment.class)
                    .setParameter("studentId", studentId)
                    .getResultList();
        } finally {
            em.close();
        }

    }
    
    public long countCourseByStudentId(int studentId){
        String jpql = "SELECT COUNT(e) FROM Enrollment e WHERE e.student.id = :studentId";
        return em.createQuery(jpql, Long.class)
                .setParameter("studentId", studentId)
                .getSingleResult();
    }
    
    public List<Student> getStudentByCourseID(int courseId){
        EntityManager em = JpaUtil.getEntityManagerFactory().createEntityManager();
        try {
            String jpql = "SELECT e.student FROM Enrollment e WHERE e.course.id = :courseId";
            return em.createQuery(jpql, Student.class)
                    .setParameter("courseId", courseId)
                    .getResultList();
        } finally {
           em.close();
        }
    }

}
