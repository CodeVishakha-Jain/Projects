import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
public class RestaurantPostingServlet extends HttpServlet {

// JDBC driver name and database URL
    static final String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";
    static final String DB_URL = "jdbc:mysql://localhost/ajava_project";

// Database credentials
    static final String USER = "root";
    static final String PASS = "";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Check if the user is a restaurant
        System.out.println("Inside Servlet");
        /* if (!"Restaurant".equals(request.getSession().getAttribute("role"))) {
        response.sendRedirect("index.html");
        return;
    }*/

        // Regular expression for validating zipcode
        String zipcodePattern = "(^\\d{6}$)|(^\\d{6}-\\d{4}$)";

        // Retrieve form data from the request
        String quantity = request.getParameter("quantity");
        String typeOfFood = request.getParameter("type");
        String cookedTime = request.getParameter("cooked_time");
        String expiryTime = request.getParameter("expiry_time");
        String hygieneLevel = request.getParameter("hygiene");
        String address = request.getParameter("address");
        String city = request.getParameter("city");
        String state = request.getParameter("state");
        String zipcode = request.getParameter("zipcode");
        String mark = request.getParameter("mark");
      //  String restaurantName = request.getParameter("restaurant_name");

        // Perform validation
        if (quantity.isEmpty() || typeOfFood.isEmpty() || cookedTime.isEmpty() || expiryTime.isEmpty()
                || hygieneLevel.isEmpty() || address.isEmpty() || city.isEmpty() || state.isEmpty() || zipcode.isEmpty()) {
            response.getWriter().println("Please fill up the form!");
            return;
        }

        if (!zipcode.matches(zipcodePattern)) {
            response.getWriter().println("Please enter a valid Zipcode!");
            return;
        }
        String restaurantName="";
        // Save the data to the database
        Connection conn = null;
        PreparedStatement stmt = null;
        try {
        	 HttpSession session = request.getSession();
             String strParam = (String) session.getAttribute("id");
            // Register JDBC driver
            Class.forName(JDBC_DRIVER);

            // Open a connection
            conn = DriverManager.getConnection(DB_URL, USER, PASS);
            String sql1 = "SELECT name FROM registration WHERE id = ?";
            try {
                PreparedStatement pst1 = conn.prepareStatement(sql1);
                
                // Assuming you have obtained the id value from the session attribute (strParam)
                int idValue = Integer.parseInt(strParam);
                
                pst1.setInt(1, idValue);
                
                ResultSet rs = pst1.executeQuery();
                
                // Process the result set to retrieve the data
                while (rs.next()) {
                    // Retrieve the name from the result set
                	restaurantName= rs.getString("name");
                    
                    // Do something with the retrieved name
                   // System.out.println("Name: " + name);
                }
                
                // Close the result set, prepared statement, and connection
                rs.close();
                pst1.close();
//                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }

            
           
            // Prepare SQL statement
            String sql = "INSERT INTO restaurant_donations (ngo_status, quantity, type_of_food, cooked_time, "
                    + "expiry_time, hygiene_level, address, city, state, zipcode, mark, restaurant_name,restaurant_id) "
                    + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,?)";
            stmt = conn.prepareStatement(sql);
            PrintWriter out=response.getWriter();
            // Set parameter values
            stmt.setString(1, "Pending");
            stmt.setInt(2, Integer.parseInt(quantity));
            stmt.setString(3, typeOfFood);
            stmt.setString(4, cookedTime);
            stmt.setString(5, expiryTime);
            stmt.setInt(6, Integer.parseInt(hygieneLevel));
            stmt.setString(7, address);
            stmt.setString(8, city);
            stmt.setString(9, state);
            stmt.setString(10, zipcode);
            stmt.setString(11, mark);
           stmt.setString(12, restaurantName);
           stmt.setInt(13, Integer.parseInt((String)session.getAttribute("id")));
            
            out.println(strParam);
            // Execute the statement
            int rowsAffected = stmt.executeUpdate();

            if (rowsAffected > 0) {
                // Data inserted successfully
                response.getWriter().println("Data inserted into the database!");

            } else {
                // Data insertion failed
                response.getWriter().println("Failed to insert data into the database!");
            }
            //Redirect to the desired page
           response.sendRedirect("restoindex.html");
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
// Handle the exception as needed
        } finally {
// Clean up resources
            if (stmt != null) {
                try {
                    stmt.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    System.out.println(e);
                }
            }
        }
    }
}
