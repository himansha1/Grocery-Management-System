package adminpackage;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;


public class AdminController {
	public static List<Admin> validate(String username, String password){

		ArrayList<Admin> adm = new ArrayList();
		
		String url = "jdbc:mysql://localhost:3306/hotels";
		String dbusername = "root";
		String dbpassword = "boola";
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(url, dbusername, dbpassword);
			Statement stmt = con.createStatement();
			
			String sql = "select * from admin where username='"+username+"' and password='"+password+"'";
			
			ResultSet rs = stmt.executeQuery(sql);
			
			if(rs.next()) {
				int id = rs.getInt(1);
				String name = rs.getString(2);
				String email = rs.getString(3);
				String phone = rs.getString(4);
				String userU = rs.getString(5);
				String passU = rs.getString(6);
				
				Admin a = new Admin(id,name,email,phone,userU,passU);
				
				adm.add(a);
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		
		return adm;
	}
}
