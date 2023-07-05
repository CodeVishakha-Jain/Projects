


import java.sql.*;
import java.io.PrintWriter;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ngstatusServlet
 */
@WebServlet("/ngstatusServlet")
public class ngstatusServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ngstatusServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		    String url = "jdbc:mysql://localhost:3306/ajava_project";
	        String name = "root";
	        String dbPassword ="";
	        PrintWriter out = response.getWriter();
	        Connection connection = null;
	        PreparedStatement statement = null;
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		    String donationId = request.getParameter("donationId");
	        
	        // Perform database update to change the status to "Accepted"
	        try {
	        	Class.forName("com.mysql.cj.jdbc.Driver");
	            connection = DriverManager.getConnection(url, name, dbPassword);
	            String updateQuery = "UPDATE restaurant_donations SET ngo_status = 'Accept' WHERE id = ?";
	            statement = connection.prepareStatement(updateQuery);
	            statement.setInt(1, Integer.parseInt(donationId));
	            int rowsAffected = statement.executeUpdate();
	            
	            if (rowsAffected > 0) {
	                // Status successfully updated
	                response.sendRedirect("NGO.jsp");  // Redirect to the page displaying donations
	            } else {
	                // Error occurred while updating status
	                response.sendRedirect("NGO.jsp");  // Redirect to an error page
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	            response.sendRedirect("error.jsp");  // Redirect to an error page
	        } catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
