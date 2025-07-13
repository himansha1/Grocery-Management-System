package adminpackage;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import customerpackage.LoginDAO;
import customerpackage.User;

/**
 * Servlet implementation class AdminLoginServlet
 */
@WebServlet("/AdminLoginServlet")
public class AdminLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String adminusername = request.getParameter("adminusername");
		String adminpassword = request.getParameter("adminpassword");
		
		if (adminusername == null || adminusername.isEmpty() || adminpassword == null || adminpassword.isEmpty()) {
	        request.setAttribute("errorMessage", "Username and password cannot be empty.");
	        RequestDispatcher dis = request.getRequestDispatcher("adminlogin.jsp"); // Redirect back to login page
	        dis.forward(request, response);
	        return;
	    }
		
		try {
			List<Admin> adminDetails = AdminController.validate(adminusername, adminpassword);
			request.setAttribute("adminDetails", adminDetails);
			
			if (adminDetails.isEmpty()) {
	            request.setAttribute("errorMessage", "Invalid username or password.");
	            RequestDispatcher dis = request.getRequestDispatcher("adminlogin.jsp"); // Redirect back to login page
	            dis.forward(request, response);
	            return;
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		RequestDispatcher dis = request.getRequestDispatcher("GetAllOrders");
		dis.forward(request, response);
	}

}
