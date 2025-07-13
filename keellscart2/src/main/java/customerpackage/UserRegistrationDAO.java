package customerpackage;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserRegistrationDAO {
	private Connection getConnection() throws Exception {
        Class.forName("com.mysql.jdbc.Driver");
        return DriverManager.getConnection("jdbc:mysql://localhost:3306/hotels", "root", "boola");
    }
	
	public boolean checkExistingUser(String username, String email) {
        try (Connection conn = getConnection()) {
            String sql = "SELECT * FROM User WHERE username = ? OR email = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, email);
            ResultSet rs = ps.executeQuery();
            return rs.next();
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
	
	public void registerUser(User user) throws Exception {
        try (Connection conn = getConnection()) {
            String sql = "INSERT INTO User (name, email, phone, address, username, password) VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, user.getName());
            ps.setString(2, user.getEmail());
            ps.setString(3, user.getPhone());
            ps.setString(4, user.getAddress());
            ps.setString(5, user.getUsername());
            ps.setString(6, user.getPassword());
            ps.executeUpdate();
        }
    }
}
