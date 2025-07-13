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
 * Servlet implementation class DeleteServlet
 */
@WebServlet("/DeleteServlet")
public class DeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int userid = Integer.parseInt(request.getParameter("userid"));
		boolean isTrue;
		
		isTrue=GroceryController.deletedata(userid);
		
		if(isTrue==true) {
			String alertMessage = "Data deleted success";
			response.getWriter().println("<script> alert('"+alertMessage+"'); window.location.href='GetAllOrders'</script>");
		}
		else {
			List<User> GroceryDetails=GroceryController.getById(userid);
			request.setAttribute("GroceryDetails",GroceryDetails);
			
			RequestDispatcher dispatcher=request.getRequestDispatcher("wrong.jsp");
			dispatcher.forward(request,response);
		}
	}

}
