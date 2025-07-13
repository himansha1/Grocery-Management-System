package adminpackage;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import customerpackage.Product;

public class OrderController {
	private static boolean isSuccess;
	private static Connection con = null;
	private static Statement stmt = null;
	private static ResultSet rs = null;
	
	public static boolean insertOrder(int orderid, int cusid, int itemid, int quantity, double total, String date) {
		boolean isSuccess = false;
		
		try {
			con = DBConnection.getConnection();
			stmt = con.createStatement();
			
			String sql = "INSERT INTO Orders VALUES ('"+orderid+"', '"+cusid+"', '"+itemid+"', '"+quantity+"', '"+total+"', '"+date+"')";
			int rs = stmt.executeUpdate(sql);
			if(rs>0) {
				isSuccess = true;
			}
			else {
				isSuccess = false;
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return isSuccess;
	}
	
	public static List<Order> getById(int id){
		
		ArrayList<Order> order = new ArrayList<>();
		
		try {
			con = DBConnection.getConnection();
			stmt = con.createStatement();
			
			String sql = "SELECT * FROM Orders WHERE orderid '"+id+"'";
			
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				int orderid = rs.getInt(1);
				int cusid = rs.getInt(2);
				int itemid = rs.getInt(3);
				int quantity = rs.getInt(4);
				double total = rs.getInt(5);
				String date = rs.getString(6);
				
				Order or = new Order(orderid, cusid, itemid, quantity, total, date);
				order.add(or);
				
			}
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return order;
	}
	
	public static List<Order> getAllOrders(){
		ArrayList<Order> orders = new ArrayList<>();
		
		try {
			con = DBConnection.getConnection();
			stmt = con.createStatement();
			
			String sql = "SELECT * FROM Orders";
			
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				int orderid = rs.getInt(1);
				int cusid = rs.getInt(2);
				int itemid = rs.getInt(3);
				int quantity = rs.getInt(4);
				double total = rs.getInt(5);
				String date = rs.getString(6);
				
				Order or = new Order(orderid, cusid, itemid, quantity, total, date);
				orders.add(or);
				
			}
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return orders;
	}
	
	public static boolean updateOrder(int orderid, int cusid, int itemid, int quantity, double total, String date) {
		try {
			con = DBConnection.getConnection();
			stmt = con.createStatement();
			
			String sql = "UPDATE Orders SET customerid='"+cusid+"',itemid='"+itemid+"',quantity='"+quantity+"',total='"+total+"',order_date='"+date+"'"
					+"WHERE orderid='"+orderid+"'";
			
			int rs = stmt.executeUpdate(sql);
			if(rs>0) {
				isSuccess = true;
			}
			else {
				isSuccess = false;
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return isSuccess;
	}
	
	public static boolean deleteOrder(int id) {
		try {
			con = DBConnection.getConnection();
			stmt = con.createStatement();
			
			String sql = "DELETE FROM Orders WHERE orderid='"+id+"'";
			int rs = stmt.executeUpdate(sql);
			
			if(rs>0) {
				isSuccess = true;
			}
			else {
				isSuccess = false;
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return isSuccess;
	}
}
