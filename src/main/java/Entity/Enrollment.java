/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Entity;

import jakarta.persistence.*;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.Date;

@Entity
@Table(name = "Enrollment")
public class Enrollment {

    @EmbeddedId
    private EnrollmentId id = new EnrollmentId();

    @ManyToOne
    @MapsId("studentId")
    @JoinColumn(name = "student_id", foreignKey = @ForeignKey(name = "FK_Enrollment_Student"))
    private Student student;

    @ManyToOne
    @MapsId("courseId")
    @JoinColumn(name = "course_id", foreignKey = @ForeignKey(name = "FK_Enrollment_Course"))
    private Course course;

    private Date enrollmentDate;

    public Enrollment() {
    }

    public Enrollment(Student student, Course course) {
        this.student = student;
        this.course = course;
        this.id = new EnrollmentId(student.getId(), course.getCourseId());
        this.enrollmentDate = new Date();
    }

    // Getters & Setters
    public EnrollmentId getId() {
        return id;
    }

    public void setId(EnrollmentId id) {
        this.id = id;
    }

    public Student getStudent() {
        return student;
    }

    public void setStudent(Student student) {
        this.student = student;
    }

    public Course getCourse() {
        return course;
    }

    public void setCourse(Course course) {
        this.course = course;
    }

    public Date getEnrollmentDate() {
        return enrollmentDate;
    }

    public void setEnrollmentDate(Date enrollmentDate) {
        this.enrollmentDate = enrollmentDate;
    }
}
