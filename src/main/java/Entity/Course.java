/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Entity;

import jakarta.persistence.*;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.annotations.Nationalized;

@Entity
@Table(name = "Course")
public class Course {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "CourseID")
    private int courseId;

    @Column(name = "Name", nullable = false)
    private String name;

    @Column(name = "Category")
    private String category;

    @Column(name = "Price")
    private double price;

    @Column(name = "ImageUrl")
    private String imageUrl;

    @Column(name = "Lecturer")
    private String lecturer; // chỉ là tên giảng viên

    @OneToMany(mappedBy = "course", cascade = CascadeType.ALL)
    private List<Enrollment> enrollments = new ArrayList<>();

    // Constructors
    public Course() {
    }

    public Course(String name, String category, double price, String imageUrl, String lecturer) {
        this.name = name;
        this.category = category;
        this.price = price;
        this.imageUrl = imageUrl;
        this.lecturer = lecturer;
    }

    // Getters & Setters
    public int getCourseId() {
        return courseId;
    }

    public void setCourseId(int courseId) {
        this.courseId = courseId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    public String getLecturer() {
        return lecturer;
    }

    public void setLecturer(String lecturer) {
        this.lecturer = lecturer;
    }
}
