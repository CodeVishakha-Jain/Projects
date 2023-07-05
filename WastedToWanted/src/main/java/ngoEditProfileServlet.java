

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
 * Servlet implementation class ngoEditProfileServlet
 */
@WebServlet("/ngoEditProfileServlet")
public class ngoEditProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ngoEditProfileServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// Retrieve the submitted form data
        String username = request.getParameter("name");
        String region = request.getParameter("region");
        String mobilenumber = request.getParameter("number");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        String city = request.getParameter("city");
        String state = request.getParameter("state");
        String zipcode = request.getParameter("zipcode");
        String password = request.getParameter("password");

        // Database connection parameters
        String url = "jdbc:mysql://localhost:3306/ajava_project";
        String name = "root";
        String dbPassword ="";
        PrintWriter out = response.getWriter();
        Connection connection = null;
        PreparedStatement statement = null;

        try {
            // Establish the database connection
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(url, name, dbPassword);

            // Prepare the SQL statement
            HttpSession session = request.getSession();
            String id = (String) session.getAttribute("id");
            String updateQuery = "UPDATE registration SET name=?, region=?, number=?, email=?, address=?, city=?, state=?, zipcode=?, password=? WHERE id=?";
            statement = connection.prepareStatement(updateQuery);
            statement.setString(1, username);
            statement.setString(2, region);
            statement.setString(3, mobilenumber);
            statement.setString(4, email);
            statement.setString(5, address);
            statement.setString(6, city);
            statement.setString(7, state);
            statement.setString(8, zipcode);
            statement.setString(9, password);
            statement.setString(10, id); // Set the ID value for the WHERE clause based on your database schema

            // Set the ID value for the WHERE clause based on your database schema

            // Execute the update query
            int rowsAffected = statement.executeUpdate();


            if (rowsAffected > 0) {
                // Redirect to the NGO's profile page
            	response.sendRedirect("NGO.jsp");
                
            } else {
                // Handle the case where the update query didn't affect any rows
                // Display an error message or perform appropriate action
            	response.sendRedirect("ngoEditProfile.jsp");
              
            }
        } catch (Exception e) {
            // Handle any exceptions that occur during database connection or query execution
            e.printStackTrace();
            System.out.println(e);
            response.sendRedirect("error.html");
        } finally {
            // Close the database resources
            try {
                if (statement != null) {
                    statement.close();
                }
                if (connection != null) {
                    connection.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
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

