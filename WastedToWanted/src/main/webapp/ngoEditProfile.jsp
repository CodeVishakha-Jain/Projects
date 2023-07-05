<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!doctype html>
<html lang="en" class="h-100">

<head>
	<!-- Required meta tags -->
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="icon" href="logoicon.svg" type="image/x-icon">

	<title>Edit Profile</title>

    <!-- Website Icon  -->
    <link rel="shortcut icon" href="logoicon.svg">

	<!-- CSS -->
	<link href='https://fonts.googleapis.com/css?family=Inter' rel='stylesheet'>
	<link href = 'style.css' rel="stylesheet">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
		integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>

<body class="h-100">
	<a href="registration.html" class="btn mt-4" role="button" aria-pressed="true">
		<span class="iconify btn_icon" data-icon="bi:arrow-left-short" data-width="100" data-height="100"></span></a>
	<div class="container h-100">
		<div class="row h-100 justify-content-center align-items-center">
			<div class="col-md-6 col-lg-6">
                <!-- Form -->
                <h1>Edit Profile</h1>
                    <!-- Input fields -->
                    <form action="ngoEditProfileServlet"method="post">
                    <div class="form-example card p-4 mt-4" style="background-color:#CED8D1;border: #000000 1px solid;">
                        <h3><script>let personName = sessionStorage.getItem("role"); document.getElementById("r").innerHTML = personName;</script>
                        </h3>
                        <div class="form-group">
                            <input type="text" class="form-control py-4 shadow-none" id="name" placeholder="Enter Name" name="name"
                                required>
                        </div>
                        <div class="form-group">
                            <input type="text" class="form-control py-4 shadow-none" id="region"
                                placeholder="Enter region you are located in" name="region" required>
                        </div>
                        <div class="form-group">
                            <input type="text" class="form-control py-4 shadow-none" id="number" placeholder="Enter phone number"
                                name="number" pattern="[7-9]{1}[0-9]{9}"
                                title="Phone number with 7-9 and remaing 9 digit with 0-9" required>
                        </div>
                        <div class="form-group">
                            <input type="email" class="form-control py-4 shadow-none" id="email" placeholder="Enter your email" name="email"
                                pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$" required>
                        </div>
                
                        <div class="form-group">
                            <input type="text" class="form-control py-4 shadow-none" id="address" placeholder="Address" name="address"
                                required>
                        </div>
                        <div class="form-group">
                            <input type="text" class="form-control py-4 shadow-none" id="city" placeholder="City" name="city" required>
                        </div>
                        <div class="form-group">
                            <input type="text" class="form-control py-4 shadow-none" id="State" placeholder="State" name="state" required>
                        </div>
                        <div class="form-group">
                            <input type="text" class="form-control py-4 shadow-none" id="zipcode" placeholder="Zip Code" name="zipcode"
                                pattern="[0-9]{6}" title="Five digit zip code" required>
                        </div>
                        <div class="form-group">
                            <input type="text" class="form-control py-4 shadow-none" id="password" placeholder="Enter New Password" name="password">
                        </div>
                        <div class="form-group">
                            <button class="btn px-4 shadow-none" onclick="window.location.href='registration.html'" aria-pressed="true" id="cancelBtn" style="background-color: #B6C8BC;"> Cancel</button>
                            <input type="submit" class="btn px-4 shadow-none" aria-pressed="true" id="saveBtn" style="background-color: #B6C8BC;" value="Save">
                        </div>
			        </div>
                    <br><br>
                    </form>
		    </div>
	    </div>
	</div>
	<%
    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;

    try {
        // Connect to the MySQL database

        Class.forName("com.mysql.cj.jdbc.Driver");
        String url = "jdbc:mysql://localhost:3306/ajava_project";
        String username = "root";
        String password = "";
        conn = DriverManager.getConnection(url, username, password);

        // Fetch data from the database
        String id = (String)session.getAttribute("id");

        String fetchQuery = "SELECT * FROM registration WHERE  id=?";
        stmt = conn.prepareStatement(fetchQuery);
        stmt.setString(1, id);
        
        rs = stmt.executeQuery();

        if (rs.next()) {
            String name = rs.getString("name");
            String region = rs.getString("region");
            String number = rs.getString("number");
            String email = rs.getString("email");
            String address = rs.getString("address");
            String city = rs.getString("city");
            String state = rs.getString("state");
            String zipcode = rs.getString("zipcode");
            String passwd = rs.getString("password");


            // Display data in form's input tags
%>
            <script>
                document.getElementById("name").value = '<%= name %>';
                document.getElementById("region").value = '<%= region %>';
                document.getElementById("number").value = '<%= number %>';
                document.getElementById("email").value = '<%= email %>';
                document.getElementById("address").value = '<%= address %>';
                document.getElementById("city").value = '<%= city %>';
                document.getElementById("State").value = '<%= state %>';
                document.getElementById("zipcode").value = '<%= zipcode %>';
                document.getElementById("password").value = '<%= passwd %>';
            </script>
<%
        }
    } catch (SQLException e) {
        out.println(e);
    } finally {
        // Close resources
        if (rs != null) {
            try {
                rs.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
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
                e.printStackTrace();
            }
        }
    }
%>

	<!-- Custom CSS -->
	<link rel="stylesheet" href="style.css">
	<script src="https://code.iconify.design/2/2.1.2/iconify.min.js"></script>
</body>

</html>
    