package adminpackage;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import customerpackage.User;

/**
 * Servlet implementation class UpdateServlet
 */
@WebServlet("/UpdateServlet")
public class UpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int userid = Integer.parseInt(request.getParameter("userid"));
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String address = request.getParameter("address");
		String username = request.getParameter("username");
		
		boolean isTrue;
		isTrue=GroceryController.updatedata(userid, name, email, phone, address, username);
		
		if(isTrue==true) {
			List<User> Grocerydetails=GroceryController.getById(userid);
			request.setAttribute("Grocerydetails",Grocerydetails);
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("GetAllOrders");
	        dispatcher.forward(request, response);
			//String alertMessage="Data Updated Successfully";
			//response.getWriter().println("<script>alert('"+alertMessage+"'); window.location.href='ReadServlet'</script>");
		}
		else {
			RequestDispatcher dis2=request.getRequestDispatcher("wrong.jsp");
			dis2.forward(request,response);
		}
	}

}
