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

@WebServlet("/handlelogin")
public class handlelogin extends HttpServlet {
		Connection con;
	    PreparedStatement pst;
	    PreparedStatement pst1;
	    ResultSet rs;
	   

	    protected void doPost(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {
	    	PrintWriter out = response.getWriter();
	    	 //out.println("hello");
	        try 
	        {
	            response.setContentType("text/html");
	            
	            
	            Class.forName("com.mysql.cj.jdbc.Driver");
	            con = DriverManager.getConnection("jdbc:mysql://localhost/ajava_project", "root", "");
	            String role = request.getParameter("role");
	            String email = request.getParameter("email");
	            String password = request.getParameter("password");
	          
	            pst = con.prepareStatement("SELECT role,password,id FROM registration WHERE email=?");
	            pst.setString(1, email);
			
				/*
				 * pst.setString(1, role); pst.setString(2, password); ;
				 */
	            rs = pst.executeQuery();
				/* out.println("Successfullllllllllll"); */
	            if(rs.next())
	            {
	            	String role1 = rs.getString(1);
	            	String password1 = rs.getString(2);
	            	String id=rs.getString(3);
	            	out.println(role);
	            	out.println(password);
	            	out.println(role1);
	            	out.println(password1);
	            	if(role.equals(role1)&& password.equals(password1))
	            	{
	            		HttpSession session = request.getSession();

	            		//set a string session attribute
	            		session.setAttribute("id", id);

	            		//get a string sessson attribute
//	            		String strParam = (String) session.getAttribute("id");
	            		
	            		//get an integer sessioin attribute
//	            		out.println(strParam);
	            		 if(role.equals("Restaurant")) 
	    				 {  
	            			 response.sendRedirect("restoindex.html"); 
	    				 }
	            		 else if (role.equals("NGO")) {
	            			 response.sendRedirect("ngoindex.html");
						}
	            	}
	            	else
	            	{
	            		 out.println("INVALID"); 
	            		 response.sendRedirect("index.html");
	            	}
	            	
	            	
	            }
				
				
				 
					/*
					 * response.sendRedirect("index.html");
					 * 
					 * else { out.println("hello world"); } out.println("hello world");
					 */
				
	        } catch (Exception ex) {
	           ex.printStackTrace();
	           out.println(ex);
	           
	        } 
	    }
}
