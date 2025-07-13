package adminpackage;

import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.mysql.jdbc.Statement;

import customerpackage.User;

public class GroceryController {
	private static Boolean isSuccess;
	private static Connection con=null;
	private static Statement stmt=null;
	private static ResultSet rs=null;
	
	public static boolean insertdata(String name,String email,String phone,String address,String username,String password) {
		
		boolean isSuccess=false;
		try {
			con=DBConnection.getConnection();
			stmt=(Statement) con.createStatement();
			
			String sql="insert into user values(0,'"+name+"','"+email+"','"+phone+"','"+address+"','"+username+"','"+password+"')";
			 int rs=stmt.executeUpdate(sql);
			 if(rs>0) {
				 isSuccess=true;
			 }
			 else {
				 isSuccess=false;
				 
			 }
			 
		}catch(Exception e) {
			e.printStackTrace();
		}
		return isSuccess;
	}
	
	public static List<User>getById(int userid){
		
		ArrayList<User> grocery=new ArrayList<>();
		
		try {
		con = DBConnection.getConnection();	
		stmt=(Statement) con.createStatement();
		
		String sql = "select * from user where userid = '"+userid+"'";
		
		rs=stmt.executeQuery(sql);
		
		while(rs.next()) {
			int userId=rs.getInt(1);
		    String name=rs.getString(2);
			 String email=rs.getString(3);
			 String phone=rs.getString(4);
			 String address=rs.getString(5);
			 String username=rs.getString(6);
			 String password=rs.getString(7);
			 
			 User G = new User(userId,name,email,phone,address,username,password);
			 grocery.add(G);
		}
		
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return grocery;
	}
        public static List<User>getAllGrocery(){
        	
        	ArrayList<User> groceries=new ArrayList<>();
        	
        	try {
        		con = DBConnection.getConnection();
        		stmt=(Statement) con.createStatement();
        		
        		String sql="select * from user";
        		
        		rs=stmt.executeQuery(sql);
        		
        		while(rs.next()) {
        			int userId=rs.getInt(1);
        		    String name=rs.getString(2);
        			 String email=rs.getString(3);
        			 String phone=rs.getString(4);
        			 String address=rs.getString(5);
        			 String username=rs.getString(6);
        			 String password=rs.getString(7);
        			 
        			 User G=new User(userId,name,email,phone,address,username,password);
        			 groceries.add(G);
        		}
        		
        		}
        		catch(Exception e) {
        			e.printStackTrace();
        		}
        		return groceries;
        	
        }
        public static boolean updatedata(int userid,String name,String email,String phone,String address,String username) {
        	try {
        		con=DBConnection.getConnection();
        		stmt=(Statement) con.createStatement();
        		
        		String sql = "UPDATE User SET name='"+name+"',phone='"+phone+"',address='"+address+"'"
        				+"WHERE userid='"+userid+"'";
        		
        		int rs=stmt.executeUpdate(sql);
        		
        		 if(rs>0) {
    				 isSuccess=true;
    			 }
    			 else {
    				 isSuccess=false;
    				 
    			 }
        	}
        	catch(Exception e) {
        		e.printStackTrace();
        	}
        	return isSuccess;
        }
        
        public static boolean deletedata(int userid) {
        	
        	
        	
        	try {
        		con=DBConnection.getConnection();
        		stmt=(Statement) con.createStatement();
        		String sql="delete from User where userid='"+userid+"'";
        		
        		int rs=stmt.executeUpdate(sql);
        		
        		if(rs>0) {
        			isSuccess=true;
        		}
        		else {
        			isSuccess=false;
        		}
        	}
        	catch(Exception e) {
        		e.printStackTrace();
        	}
        	return isSuccess;
        }
}
