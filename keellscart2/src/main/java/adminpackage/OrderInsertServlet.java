package adminpackage;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class OrderInsertServlet
 */
@WebServlet("/OrderInsertServlet")
public class OrderInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int orderid = Integer.parseInt(request.getParameter("orderId"));
		int cusid = Integer.parseInt(request.getParameter("cusId"));
		int itemid = Integer.parseInt(request.getParameter("itemId"));
		int quantity = Integer.parseInt(request.getParameter("quantity"));
		double total = Double.parseDouble(request.getParameter("total"));
		String date = request.getParameter("date");
		
		boolean isTrue;
		
		isTrue = OrderController.insertOrder(orderid, cusid, itemid, quantity, total, date);
		
		if(isTrue == true) {
			String alertMessage = "Data inserted succes";
			response.getWriter().println("<script> alert('"+alertMessage+"'); window.location.href='GetAllOrders'</script>");
		}
		else {
			RequestDispatcher dis2 = request.getRequestDispatcher("wrong.jsp");
			dis2.forward(request, response);
		}
		
	}

}
