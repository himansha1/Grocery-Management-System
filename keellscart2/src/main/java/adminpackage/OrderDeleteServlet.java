package adminpackage;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class OrderDeleteServlet
 */
@WebServlet("/OrderDeleteServlet")
public class OrderDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int orderid = Integer.parseInt(request.getParameter("orderid"));
		boolean isTrue;
		isTrue = OrderController.deleteOrder(orderid);
		
		if(isTrue == true) {
			String alertMessage = "Deleted success";
			response.getWriter().println("<script> alert('"+alertMessage+"'); window.location.href='GetAllOrders'</script>");
		}
		else {
			List<Order> orderdetails = OrderController.getById(orderid);
			request.setAttribute("orderdetails", orderdetails);
			RequestDispatcher dis2 = request.getRequestDispatcher("wrong.jsp");
			dis2.forward(request, response);
		}
	}

}
