package customerpackage;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import adminpackage.DBConnection;

/**
 * Servlet implementation class OrderHistoryServlet
 */
@WebServlet("/OrderHistoryServlet")
public class OrderHistoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
        if (session != null && session.getAttribute("userid") != null) {
            int userid = (Integer) session.getAttribute("userid");
            List<Order> orderHistory = new ArrayList<>();
            try {
            	Connection conn = DBConnection.getConnection();
            	 
            	String sql = "SELECT o.orderid, o.itemid, o.quantity, o.total, o.order_date, p.itemname " +
                        "FROM Orders o, Product p " +
                        "WHERE p.itemid = o.itemid AND o.customerid = ?";

                PreparedStatement ps = conn.prepareStatement(sql);
                ps.setInt(1, userid);

                ResultSet rs = ps.executeQuery();

                while (rs.next()) {
                    Order order = new Order();
                    order.setOrderid(rs.getInt("orderid"));
                    order.setItemid(rs.getInt("itemid"));
                    order.setQuantity(rs.getInt("quantity"));
                    order.setTotal(rs.getDouble("total"));
                    order.setOrderDate(rs.getTimestamp("order_date"));
                    order.setItemname(rs.getString("itemname"));
                    
                    orderHistory.add(order);
                }
                
                request.setAttribute("orderHistory", orderHistory);
                request.getRequestDispatcher("orderHistory.jsp").forward(request, response);

            } catch (Exception e) {
                e.printStackTrace();
            }
        } else {
            response.sendRedirect("login.jsp");
        }
	}
}
