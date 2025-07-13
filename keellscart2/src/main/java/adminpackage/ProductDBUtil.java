package adminpackage;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import customerpackage.Product;

public class ProductDBUtil {
	private static boolean issuccess;

public static boolean insertproduct(int itemid,String itemname,double price) {
		
		boolean issuccess = false;
		
		String url ="jdbc:mysql://localhost:3306/hotels?"; 
		String user = "root";
		String pass = "boola";
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			
			Connection con = DriverManager.getConnection(url,user,pass);
			Statement stmt = con.createStatement();
			String sql = "INSERT INTO product VALUES ('"+itemid+"','"+itemname+"','"+price+"')";
			int rs = stmt.executeUpdate(sql);
			
			if(rs > 0) {
				issuccess = true;
			}else {
				issuccess = false;
			}
			
		}
		
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return issuccess;
		
	}
	
//data retrieve	
	public static List<Product> getproductDetails(){
		
		
		ArrayList<Product> Product = new ArrayList<>();
		
		String url = "jdbc:mysql://localhost:3306/hotels?useSSL=false";
		String user = "root";
		String pass = "boola";
		
		
		try {
			
			Class.forName("com.mysql.jdbc.Driver");
			
			Connection con = DriverManager.getConnection(url,user,pass);
			Statement stmt = con.createStatement();
			String sql = "SELECT * FROM product";
			ResultSet rs = stmt.executeQuery(sql);
			
			
			while(rs.next()) {
				int itemid = rs.getInt("itemid");
				String itemname = rs.getString("itemname");
				double price = rs.getDouble("price");
				
				
				Product p = new Product(itemid,itemname,price);
				Product.add(p);
			}
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		
		return Product;
		
	}
	
//Product Update
	
	public static boolean updateproduct(int itemid,String itemname,double price) {
		
		String url = "jdbc:mysql://localhost:3306/hotels?";
		String user = "root";
		String pass = "boola";
		
		try {
			
            Class.forName("com.mysql.jdbc.Driver");
			
			Connection con = DriverManager.getConnection(url,user,pass);
			Statement stmt = con.createStatement();
			String sql = "update product set itemid='"+itemid+"',itemname='"+itemname+"',price='"+price+"'"
					      +"where itemid ='"+itemid+"'";
			int rs = stmt.executeUpdate(sql);
			
			if(rs > 0) {
				issuccess = true;
			}else {
				issuccess = false;
			}
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		
		return issuccess;
	
	}
	
//Delete Product
	
	public static boolean deleteproduct(int itemid) {
		
		String url = "jdbc:mysql://localhost:3306/hotels?";
		String user = "root";
		String pass = "boola";
		
		try {
			
            Class.forName("com.mysql.jdbc.Driver");
			
			Connection con = DriverManager.getConnection(url,user,pass);
			Statement stmt = con.createStatement();
			String sql = "delete from product where itemid ='"+itemid+"'";
			int rs = stmt.executeUpdate(sql);
			
			if(rs > 0) {
				issuccess = true;
			}else {
				issuccess = false;
			}
			
		}
		catch(Exception e) {
			
			e.printStackTrace();
			
		}
		
		return issuccess;
		
	}
}
