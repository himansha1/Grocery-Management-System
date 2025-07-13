package customerpackage;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class CartServlet
 */
@WebServlet("/CartServlet")
public class CartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
        List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");
        
        String action = request.getParameter("action");
        String itemId = request.getParameter("itemId");

        if ("delete".equals(action) && itemId != null) {
            // Find and remove the cart item
        	cart.removeIf(item -> item.getItemid() == Integer.parseInt(itemId));

            session.setAttribute("cart", cart);
        }

        // Redirect back to the cart page
        response.sendRedirect("cart.jsp");
	}

}
