package src;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class StudentDAO {

    // 1. INSERT: Add a new student record
    public void addStudent(String name, int age, String gender, String city, int marks) {
        String sql = "INSERT INTO student (stu_name, stu_age, gender, city, marks) VALUES (?, ?, ?, ?, ?)";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, name);
            pstmt.setInt(2, age);
            pstmt.setString(3, gender);
            pstmt.setString(4, city);
            pstmt.setInt(5, marks);

            int rows = pstmt.executeUpdate();
            if (rows > 0) System.out.println("✅ Student added successfully!");

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // 2. SELECT: Fetch student details with enrolled courses (JOIN query)
    public void getStudentWithCourses(int stuId) {
        String sql = "SELECT s.stu_id, s.stu_name, s.marks, GROUP_CONCAT(c.course_name SEPARATOR ', ') AS courses " +
                     "FROM student s " +
                     "LEFT JOIN enrollment e ON s.stu_id = e.stu_id " +
                     "LEFT JOIN course c ON e.course_id = c.course_id " +
                     "WHERE s.stu_id = ? " +
                     "GROUP BY s.stu_id, s.stu_name, s.marks";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, stuId);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                System.out.println("ID: " + rs.getInt("stu_id"));
                System.out.println("Name: " + rs.getString("stu_name"));
                System.out.println("Marks: " + rs.getInt("marks"));
                System.out.println("Courses: " + rs.getString("courses"));
            } else {
                System.out.println("⚠️ Student ID not found.");
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // 3. UPDATE: Update marks
    public void updateMarks(int stuId, int newMarks) {
        String sql = "UPDATE student SET marks = ? WHERE stu_id = ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, newMarks);
            pstmt.setInt(2, stuId);

            int rows = pstmt.executeUpdate();
            if (rows > 0) System.out.println("✅ Marks updated successfully!");

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Execution entry point
    public static void main(String[] args) {
        StudentDAO dao = new StudentDAO();
        dao.addStudent("Arjun", 20, "Male", "Guntur", 78);
        dao.updateMarks(3, 92);
        dao.getStudentWithCourses(3);
    }
}
