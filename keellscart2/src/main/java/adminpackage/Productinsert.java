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
 * Servlet implementation class Productinsert
 */
@WebServlet("/Productinsert")
public class Productinsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int itemid = Integer.parseInt(request.getParameter("itemid"));
        String itemname = request.getParameter("itemname");
        double price = Double.parseDouble(request.getParameter("price"));
		
		boolean istrue;
		
		istrue=ProductDBUtil.insertproduct(itemid,itemname,price);
		
		if(istrue == true) {
			
			List<Product> product = ProductDBUtil.getproductDetails();
			request.setAttribute("product",product);
			
			String alertMessage = "Data inserted success";
			response.getWriter().println("<script> alert('"+alertMessage+"'); window.location.href='GetAllOrders'</script>");
			
		}else {
			RequestDispatcher dis2 = request.getRequestDispatcher("unsuccess.jsp");
			dis2.forward(request, response);
		}
	}

}
