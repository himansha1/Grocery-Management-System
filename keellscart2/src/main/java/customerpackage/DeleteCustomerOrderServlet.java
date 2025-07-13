package customerpackage;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import adminpackage.DBConnection;

/**
 * Servlet implementation class DeleteCustomerOrderServlet
 */
@WebServlet("/DeleteCustomerOrderServlet")
public class DeleteCustomerOrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int orderId = Integer.parseInt(request.getParameter("orderid"));
        
        try {
            // Get connection
            Connection conn = DBConnection.getConnection();
            
            // SQL to delete order
            String sql = "DELETE FROM Orders WHERE orderid = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, orderId);
            
            // Execute the update
            ps.executeUpdate();
            
            // Redirect back to the order history page
            response.sendRedirect("OrderHistoryServlet");
            
        } catch (Exception e) {
            e.printStackTrace();
        }
	}

}
