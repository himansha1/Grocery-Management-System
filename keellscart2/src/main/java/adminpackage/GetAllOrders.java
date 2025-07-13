package adminpackage;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import customerpackage.Product;
import customerpackage.User;

/**
 * Servlet implementation class GetAllOrders
 */
@WebServlet("/GetAllOrders")
public class GetAllOrders extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Order> allOrder = OrderController.getAllOrders();
		request.setAttribute("allOrder", allOrder);
		
		List<Product> customer = ProductDBUtil.getproductDetails();
		request.setAttribute("customer", customer);
		
		List<User> allGroceries=GroceryController.getAllGrocery();
		request.setAttribute("allGroceries", allGroceries);
		
		RequestDispatcher dis = request.getRequestDispatcher("orderpage.jsp");
		dis.forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
