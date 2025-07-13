package customerpackage;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

//import com.cart.CartItem;

/**
 * Servlet implementation class AddToCartServlet
 */
@WebServlet("/AddToCartServlet")
public class AddToCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession(false);
        
       
		if (session == null) {
		    // Handle session expiration, redirect to login
		    response.sendRedirect("login.jsp");
		    return;
		}
		
		int itemid = Integer.parseInt(request.getParameter("itemid"));
        String itemname = request.getParameter("itemname");
        double price = Double.parseDouble(request.getParameter("price"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));

        //HttpSession session = request.getSession();
        List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");

        if (cart == null) {
            cart = new ArrayList<>();
        }

        CartItem cartItem = new CartItem(itemid, itemname, price, quantity);
        cart.add(cartItem);

        session.setAttribute("cart", cart);
        response.sendRedirect("cart.jsp");
	}

}
