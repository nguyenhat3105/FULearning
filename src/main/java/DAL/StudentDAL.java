/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Entity.Student;
import Util.JpaUtil;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import java.util.List;

/**
 *
 * @author CONG NHAT
 */
public class StudentDAL {

    public void insertStudent(Student student) {
        EntityManager em = JpaUtil.getEntityManagerFactory().createEntityManager();

        em.getTransaction().begin();
        em.persist(student);
        em.getTransaction().commit();

        em.close();
    }

    public List<Student> getAllStudent() {

        EntityManager em = JpaUtil.getEntityManagerFactory().createEntityManager();

        List<Student> result = em.createQuery("FROM Student", Student.class).getResultList();
        em.close();

        return result;
    }

    public boolean isStudentExists(String email) {

        EntityManager em = JpaUtil.getEntityManagerFactory().createEntityManager();

        List<Student> result = em.createQuery("SELECT s FROM Student s WHERE s.email = :email", Student.class)
                .setParameter("email", email)
                .setMaxResults(1)
                .getResultList();

        em.close();

        return !result.isEmpty();
    }

    public Student checkLogin(String email, String password) {
        EntityManager em = JpaUtil.getEntityManagerFactory().createEntityManager();

        try {
            List<Student> result = em.createQuery(
                    "SELECT s FROM Student s WHERE s.email = :email AND s.password = :password", Student.class)
                    .setParameter("email", email)
                    .setParameter("password", password)
                    .setMaxResults(1)
                    .getResultList();

            if (!result.isEmpty()) {
                return result.get(0); // Trả về Student đầu tiên nếu có
            } else {
                return null; // Không tìm thấy -> trả về null
            }
        } finally {
            em.close();
        }
    }

}
