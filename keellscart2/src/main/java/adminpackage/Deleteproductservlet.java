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
 * Servlet implementation class Deleteproductservlet
 */
@WebServlet("/Deleteproductservlet")
public class Deleteproductservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
int itemid = Integer.parseInt(request.getParameter("itemid"));
		
		boolean istrue;
		
		istrue = ProductDBUtil.deleteproduct(itemid);
		
         if(istrue == true) {
        	
        	List<Product> product = ProductDBUtil.getproductDetails();
			request.setAttribute("product",product);
        	
			RequestDispatcher dis = request.getRequestDispatcher("productretrive.jsp");
			dis.forward(request, response);
			
		}else {
			RequestDispatcher dis = request.getRequestDispatcher("unsuccess.jsp");
			dis.forward(request, response);
		}
	}

}
