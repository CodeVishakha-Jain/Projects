import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/registration")
public class registration extends HttpServlet {

    Connection con;
    PreparedStatement pst;
    PreparedStatement pst1;
    ResultSet rs;
   

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	PrintWriter out = response.getWriter();
        try 
        {
            response.setContentType("text/html");
            
            
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost/ajava_project", "root", "");
            String role = request.getParameter("role");
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String number = request.getParameter("number");
            String region = request.getParameter("region");
            String address = request.getParameter("address");
            String city = request.getParameter("city");
            String state = request.getParameter("state");
            String zipcode = request.getParameter("zipcode");
            String password = request.getParameter("password");
          
            pst = con.prepareStatement("insert into registration(role,name,email,number,region,address,city,state,zipcode,password)values(?,?,?,?,?,?,?,?,?,?)");
            pst.setString(1, role);
            pst.setString(2, name); 
            pst.setString(3, email);
            pst.setString(4, number);
            pst.setString(5, region);
            pst.setString(6, address); 
            pst.setString(7, city);
            pst.setString(8, state);
            pst.setString(9, zipcode);
            pst.setString(10, password); ;
            pst.executeUpdate();
          
            out.println("Thank you for your Registation");
            pst1 = con.prepareStatement("SELECT LAST_INSERT_ID()");
            rs = pst1.executeQuery();
            if (rs.next()) {
                int lastInsertedId = rs.getInt(1);
                // Use the lastInsertedId as needed
            }
            
        } catch (Exception ex) {
           ex.printStackTrace();
           out.println(ex);
           
        } 
        response.sendRedirect("index.html");
    }
}