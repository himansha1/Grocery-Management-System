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
//import com.customer.ProductDBUtil;

/**
 * Servlet implementation class UpdateProductServlet
 */
@WebServlet("/UpdateProductServlet")
public class UpdateProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int itemid = Integer.parseInt(request.getParameter("itemid"));
        String itemname = request.getParameter("itemname");
        double price = Double.parseDouble(request.getParameter("price"));
		
		
		boolean istrue;
		
		istrue = ProductDBUtil.updateproduct(itemid,itemname,price);
		
        if(istrue == true) {
        	
        	List<Product> product = ProductDBUtil.getproductDetails();
			request.setAttribute("product",product);
        	
			RequestDispatcher dis = request.getRequestDispatcher("GetAllOrders");
			dis.forward(request, response);
			
		}else {
			RequestDispatcher dis = request.getRequestDispatcher("unsuccess.jsp");
			dis.forward(request, response);
		}
	}

}
