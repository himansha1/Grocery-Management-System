package customerpackage;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.time.ZoneId;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import adminpackage.DBConnection;

/**
 * Servlet implementation class CustomerUpdateOrderServlet
 */
@WebServlet("/CustomerUpdateOrderServlet")
public class CustomerUpdateOrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int orderid = Integer.parseInt(request.getParameter("orderid"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        double total = Double.parseDouble(request.getParameter("total"));
        
        // Get the current system date
        LocalDateTime currentDateTime = LocalDateTime.now(ZoneId.systemDefault());;

        try {
            Connection conn = DBConnection.getConnection();
            String sql = "UPDATE Orders SET quantity = ?, total = ?, order_date = ? WHERE orderid = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, quantity);
            ps.setDouble(2, total);
            ps.setTimestamp(3, Timestamp.valueOf(currentDateTime)); // Convert LocalDate to SQL Timestamp
            ps.setInt(4, orderid);

            int rowsUpdated = ps.executeUpdate();
            if (rowsUpdated > 0) {
                response.sendRedirect("OrderHistoryServlet");
            } else {
                response.getWriter().println("Failed to update the order.");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
	}
}
