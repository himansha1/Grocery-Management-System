package customerpackage;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import adminpackage.DBConnection;

//import com.cart.CartItem;

//import com.cart.CartItem;

/**
 * Servlet implementation class OrderServlet
 */
@WebServlet("/OrderServlet")
public class OrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
        List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");
        int customerid = (int) session.getAttribute("userid");

        if (cart != null) {
            try {
                
            	Connection conn = DBConnection.getConnection();
            	
                for (CartItem item : cart) {
                    String sql = "INSERT INTO Orders (customerid, itemid, quantity, total) VALUES (?, ?, ?, ?)";
                    PreparedStatement ps = conn.prepareStatement(sql);
                    ps.setInt(1, customerid);
                    ps.setInt(2, item.getItemid());
                    ps.setInt(3, item.getQuantity());
                    ps.setDouble(4, item.getPrice() * item.getQuantity());
                    ps.executeUpdate();
                }

                session.removeAttribute("cart");
                response.sendRedirect("order-confirmation.jsp");
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else {
            response.sendRedirect("cart.jsp");
        }
	}

}
