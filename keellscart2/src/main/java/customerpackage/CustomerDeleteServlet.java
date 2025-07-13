package customerpackage;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class CustomerDeleteServlet
 */
@WebServlet("/CustomerDeleteServlet")
public class CustomerDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        
        HttpSession session = request.getSession();
        String email = (String) session.getAttribute("email"); // Assuming email is stored in session
        
        try {
            Class.forName("com.mysql.jdbc.Driver");
            String user = "root"; // Database username
            String pass = "628212"; // Database password
            String query = "DELETE FROM User WHERE email=?";
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hotels", user, pass);
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, email);
            int i = ps.executeUpdate();

            if (i > 0) {
                out.println("<h2>Account successfully deleted.</h2>");
                session.invalidate(); // Invalidate session after deletion
                out.println("<a href='index.jsp'>Go to Home</a>");
            } else {
                out.println("<h2>Account not found.</h2>");
                out.println("<a href='index.jsp'>Go to Home</a>");
            }
        } catch (Exception e) {
            out.println("<h2>Error: " + e.getMessage() + "</h2>");
        } finally {
            out.close();
        }
	}

}
