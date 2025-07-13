package adminpackage;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class InsertServlet
 */
@WebServlet("/InsertServlet")
public class InsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
		String email=request.getParameter("email");
		String phone=request.getParameter("phone");
		String address=request.getParameter("address");
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		
		boolean isTrue;
		
		isTrue=GroceryController.insertdata(name,email,phone,address,username,password);
		
		if(isTrue==true) {
			String alertMessage = "Data inserted success";
			response.getWriter().println("<script> alert('"+alertMessage+"'); window.location.href='GetAllOrders'</script>");
		}
		else {
			RequestDispatcher dis2=request.getRequestDispatcher("wrong.jsp");
			dis2.forward(request,response);
		}
	}

}
