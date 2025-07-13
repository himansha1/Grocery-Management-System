package customerpackage;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class UpdateDetailsDAO {
	private static final String DB_URL = "jdbc:mysql://localhost:3306/hotels";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "boola";

    public void updateUserDetails(int userId, String name, String phone, String password, String address) throws SQLException {
        String sql = "UPDATE User SET name = ?, phone = ?, password = ?, address = ? WHERE userid = ?";

        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
             PreparedStatement ps = conn.prepareStatement(sql)) {
             
            ps.setString(1, name);
            ps.setString(2, phone);
            ps.setString(3, password);
            ps.setString(4, address);
            ps.setInt(5, userId);
            ps.executeUpdate();
        }
    }
}
