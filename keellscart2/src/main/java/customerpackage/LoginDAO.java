package customerpackage;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class LoginDAO {
	private Connection getConnection() throws Exception {
        Class.forName("com.mysql.jdbc.Driver");
        return DriverManager.getConnection("jdbc:mysql://localhost:3306/hotels", "root", "boola");
    }
	
	public boolean validate(String username, String password) {
        try (Connection conn = getConnection()) {
            String sql = "SELECT * FROM User WHERE username = ? AND password = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            return rs.next();
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
	
	public Integer getUserId(String username) {
        Integer userId = null;
        try (Connection conn = getConnection()) {
            String sql = "SELECT userid FROM User WHERE username = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                userId = rs.getInt("userid"); // Assuming 'id' is the column name for user ID
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return userId; // Returns null if not found
    }
	
	public User getUserDetails(Integer userId) {
        User user = null;
        try (Connection conn = getConnection()) {
            String sql = "SELECT * FROM User WHERE userid = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();
            
            if (rs.next()) {
                // Assuming these are the correct column names in your database
                String name = rs.getString("name");
                String email = rs.getString("email");
                String phone = rs.getString("phone");
                String address = rs.getString("address");
                String username = rs.getString("username");
                
                // Create a new User object with retrieved details
                user = new User(userId, name, email, phone, address, username, null); // Password is not needed here
                user.setUserid(userId); // Set userid as well
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return user; // Returns null if not found
    }
}
