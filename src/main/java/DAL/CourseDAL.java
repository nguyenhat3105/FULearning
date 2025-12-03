/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Entity.Course;
import Util.JpaUtil;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import java.util.List;
import org.hibernate.type.descriptor.converter.spi.JpaAttributeConverter;

/**
 *
 * @author CONG NHAT
 */
public class CourseDAL {

    public List<Course> getAllCourse() {
        EntityManager em = JpaUtil.getEntityManagerFactory().createEntityManager();

        List<Course> result = em.createQuery("FROM Course", Course.class).getResultList();
        em.close();
        return result;
    }

    public List<Course> getByCategory(String category) {
        EntityManager em = JpaUtil.getEntityManagerFactory().createEntityManager();
        String jpql = "SELECT c FROM Course c WHERE c.category = :category";
        return em.createQuery(jpql, Course.class)
                .setParameter("category", category)
                .getResultList();
    }

    public Course getCourseById(int courseId) {
        EntityManager em = JpaUtil.getEntityManagerFactory().createEntityManager();
        String jpql = "SELECT c FROM Course c WHERE c.courseId = :courseId";
        return em.createQuery(jpql, Course.class)
                .setParameter("courseId", courseId)
                .getSingleResult();
    }

    public List<Course> getNotEnrolledCoursesByCategory(int studentId, String category) {
        EntityManager em = JpaUtil.getEntityManagerFactory().createEntityManager();
        String jpql = "SELECT c FROM Course c WHERE c.category = :category AND c.courseId NOT IN "
                + "(SELECT e.course.courseId FROM Enrollment e WHERE e.student.id = :studentId)";
        return em.createQuery(jpql, Course.class)
                .setParameter("studentId", studentId)
                .setParameter("category", category)
                .getResultList();
    }

    public List<Course> getNotEnrolledCourses(int studentId) {
        EntityManager em = JpaUtil.getEntityManagerFactory().createEntityManager();
        String jpql = """
        SELECT c FROM Course c 
        WHERE c.courseId NOT IN (
            SELECT e.course.courseId FROM Enrollment e 
            WHERE e.student.id = :studentId
        )
    """;
        return em.createQuery(jpql, Course.class)
                .setParameter("studentId", studentId)
                .getResultList();
    }
}
