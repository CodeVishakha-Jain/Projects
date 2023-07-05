<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.concurrent.atomic.AtomicInteger" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>NGO Profile</title>

    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="logoicon.svg" type="image/x-icon">
    <%
            String username1 = (String) session.getAttribute("username");
       %>
        

    <!-- <link rel="stylesheet" href="page.css"> -->
    
    <!-- Website Icon  -->
    <link rel="shortcut icon" href="logoicon.svg">
    
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">       
    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js">
    </script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
   
    <link rel="stylesheet" href="homepage.css">

    <style>
        .status-itm{
            align-items: center;
        }
        @media (max-width:992px) {
            .itm {
                margin-top: 10px;
                margin-bottom: 10px;
            }.status-itm{
                align-items: flex-start;
            }
            .action-btn{
                margin-top: 1em;
                margin-bottom: 1em;
            }
        }
    </style>
</head>

<body>
    <header class="section page-header">
        <!--Navbar-->
        <div class="rd-navbar-wrap">
          <nav class="rd-navbar rd-navbar-classic" data-layout="rd-navbar-fixed" data-sm-layout="rd-navbar-fixed" data-md-layout="rd-navbar-fixed" data-lg-layout="rd-navbar-static" data-xl-layout="rd-navbar-static" data-xxl-layout="rd-navbar-static" data-md-device-layout="rd-navbar-fixed" data-lg-device-layout="rd-navbar-static" data-xl-device-layout="rd-navbar-static" data-xxl-device-layout="rd-navbar-static" data-lg-stick-up-offset="46px" data-xl-stick-up-offset="46px" data-xxl-stick-up-offset="46px" data-lg-stick-up="true" data-xl-stick-up="true" data-xxl-stick-up="true">
            <div class="rd-navbar-collapse-toggle rd-navbar-fixed-element-1" data-rd-navbar-toggle=".rd-navbar-collapse"><span></span></div>
            <div class="rd-navbar-main-outer">
              <div class="rd-navbar-main">
                <!--Navbar Panel-->
                <div class="rd-navbar-panel">
                  <!--Navbar Toggle-->
                  <button class="rd-navbar-toggle" data-rd-navbar-toggle=".rd-navbar-nav-wrap"><span></span></button>
                  <!--Navbar Brand-->
                  <div class="rd-navbar-brand">
                    <!--Brand--><a class="brand" href="index.html"><img class="brand-logo-dark" src="images/logo.svg" alt="" width="200" height="67" loading="lazy"/><img class="brand-logo-light" src="images/logo-inverse-334x134.png" alt="" width="200" height="67" loading="lazy"/></a>
                  </div>
                </div>
                <div class="rd-navbar-main-element">
                  <div class="rd-navbar-nav-wrap">
                    <ul class="rd-navbar-nav">
                      <li class="rd-nav-item active"><a class="rd-nav-link" href="index.html">Home</a>
                      </li>
                      <li class="rd-nav-item"><a class="rd-nav-link" href="about.html">About</a>
                      </li>
                      <li class="rd-nav-item"><a class="rd-nav-link" href="feed.html">Feed</a>
                      </li>
                      <li class="rd-nav-item"><a class="rd-nav-link" href="#footer">Contact Us</a>
                      </li>
                    </ul>
                  </div>
                </div>
                <div id="uStatus" class='menu-list-item btn-group'></div>
                <script>
                    if(sessionStorage.getItem("username")){
                        document.getElementById("uStatus").innerHTML = '<div class="rd-navbar-aside"><button class="rd-navbar-btn btn btn-secondary"><a href="NGO.html" style="color:white;">My Profile</a></button></div><div class="px-4 rd-navbar-aside"><button class="rd-navbar-btn btn btn-primary"><a href="logout.html" style="color:white;">Logout</a></button></div>';
                    }else{
                        document.getElementById("uStatus").innerHTML = '<div class="rd-navbar-aside rd-navbar-collapse"><button class="rd-navbar-btn btn btn-secondary" data-bs-toggle="modal" data-bs-target="#modal">Login</button></div>';
                    }
                </script>
              </div>
            </div>
          </nav>
        </div>
    </header>
 	<%!
            private AtomicInteger counter = new AtomicInteger(0);
            private AtomicInteger dishCounter = new AtomicInteger(0);

            private void animateCounter(String elementId, int startValue, int endValue, int duration) {
                // Code for animating the counter using JavaScript
                // ...
            }
      %>
  <section class="section section-md bg-secondary-lightest-1 p-5">
    <div class="mb-4"> <button class="btn btn-secondary" onclick="window.location.replace('ngoindex.html'); return false;">Go back</button></div>
      <div class="container-fluid" style="background-color: #E5E5E5;">
          <div class="row d-flex flex-column align-items-center text-center" style="margin-bottom: 10vh;">
              <div>
                  <p class="fw-bold fs-1 mt-5" id="ngoname">NGO Name</p> 
                  <p class="mt-3 fw-lighter">Area from where they are donating</p>
              </div>
              <div class="mt-5 d-flex justify-content-evenly flex-wrap" style="width: 70vw;">
                  <a href="ngoEditProfile.jsp"><button class="btn btn-outline-dark action-btn" style="width:200px;">Edit Profile</button></a>
              </div>
          </div>

          <div class="row px-5" style="margin-top: 10vh;">
              <div class="col-lg-4 col-md-12 d-flex flex-column text-center">
                  <h1 class="fw-bold" style="font-size: 3rem;" id="NoOfFeed">20</h1>
                  <p class="fs-5">Number of people you fed</p>
              </div>
              <div class="col-lg-4 col-md-12 d-flex flex-column text-center">
                  <h1 class="fw-bold" style="font-size: 3rem;" id="numOfDdone">10</h1>
                  <p class="fs-5">Number of deliveries done</p>
              </div>
              <div class="col-lg-4 col-md-12 d-flex flex-column text-center">
                  <h1 class="fw-bold" style="font-size: 3rem;" id="numOfFailed">2</h1>
                  <p class="fs-5">Number of failed delivery</p>
              </div>
          </div>
          <div class="row px-4 mt-4" id="ex-table">
          </div>
          <%
Connection connection = null;
Statement statement = null;
int counterno = 0;
int dish = 0;
int numOfFailed=0;
int numOfDdone=0;
try {
    // Establish the database connection
    Class.forName("com.mysql.cj.jdbc.Driver");
    String url = "jdbc:mysql://localhost:3306/ajava_project";
    String username = "root";
    String password = "";
    connection = DriverManager.getConnection(url, username, password);
    statement = connection.createStatement();

    // Execute the SQL queries
    String restaurantQuery = "SELECT * FROM registration where role='Restaurant'";
    
    ResultSet restaurantResult = statement.executeQuery(restaurantQuery);
    while(restaurantResult.next())
   	{
        int restaurantId = restaurantResult.getInt("id");
        String restaurantUsername = restaurantResult.getString("name");
        String restaurantMobileNumber = restaurantResult.getString("number");
        String donationQuery = "SELECT * FROM restaurant_donations WHERE restaurant_id = " + restaurantId;
        ResultSet donationResult = connection.createStatement().executeQuery(donationQuery); // Use a new statement object to execute the donationQuery
        while(donationResult.next()) 
        {
            int donationId = donationResult.getInt("id");
            int quantity = donationResult.getInt("quantity");
            int hygieneLevel = donationResult.getInt("hygiene_level");
            int expiryTime = donationResult.getInt("expiry_time");
            String cookTime = donationResult.getString("cooked_time");
            String mark = donationResult.getString("mark");
            String tyfood = donationResult.getString("type_of_food");
            String ngoStatus = donationResult.getString("ngo_status");

            // Perform the necessary calculations and animations
            if (ngoStatus.equals("Accept")) {
                dish += quantity;
                out.println("<script>animateCounter('NoOfFeed', 0, " + dish + ", 4000);</script>");
                numOfDdone++;
                out.println("<script>animateCounter('numOfDdone', 0, " + numOfDdone + ", 4000);</script>");
            } else if (ngoStatus.equals("Failed")) {
                numOfFailed++;
                out.println("<script>animateCounter('numOfFailed', 0, " + numOfFailed + ", 4000);</script>");
            }

            // Listing
            String hygieneLevelEdit = "";
            if (hygieneLevel == 1) {
                hygieneLevelEdit = "⭐";
            } else if (hygieneLevel == 2) {
                hygieneLevelEdit = "⭐⭐";
            } else if (hygieneLevel == 3) {
                hygieneLevelEdit = "⭐⭐⭐";
            } else if (hygieneLevel == 4) {
                hygieneLevelEdit = "⭐⭐⭐⭐";
            } else {
                hygieneLevelEdit = "⭐⭐⭐⭐⭐";
            }
            String ngStatus = "";
            if (ngoStatus.equals("Accept")) {
                ngStatus = "Accepted &#10003;";
            } else if (ngoStatus.equals("Pending")) {
                ngStatus = "Pending !";
            } else {
                ngStatus = "Failed X";
            }

            out.println("<h4>" + restaurantUsername + "</h4><div class=\"row\">");
            //change the photos
            out.println("<div class=\"itm col-lg-2\"><img src=\"images/foodfeed.jpg\" class=\"img-fluid\"></div>");
            out.println("<div class=\"itm col-lg-2 d-flex flex-column justify-content-around\">");
            out.println("<div>");
            out.println("<table>");/* images/food.jpg */
            out.println("<tr>");
            out.println("<td class=\"fw-bold\">Quantity</td></tr><tr><td>" + quantity + " Dishes</td></tr>");
            out.println("</table>");
            out.println("</div>");
            out.println("<div>");
            out.println("<table><tr><td class=\"fw-bold\">Types of food</td></tr><tr><td>" + tyfood + "</td></tr></table>");
            out.println("</div></div>");
            out.println("<div class=\"itm col-lg-2 d-flex flex-column justify-content-around\">");
            out.println("<div>");
            out.println("<table>");
            out.println("<tr><td class=\"fw-bold\">Hygiene Level</td></tr>");
            out.println("<tr><td>"+ hygieneLevelEdit + "</td></tr>");
            out.println("</table>");
            out.println("</div>");
            out.println("<div>");
            out.println("<table>");
            out.println("<tr><td class=\"fw-bold\">Expiry Time</td></tr><tr><td>" + expiryTime + " hours</td></tr>");
            out.println("</table>");
            out.println("</div>");
            out.println("</div>");
            out.println("<div class=\"itm col-lg-2 d-flex flex-column justify-content-around\">");
            out.println("<div>");
            out.println("<table>");
            out.println("<tr><td class=\"fw-bold\">Cooked Time</td></tr><tr><td>" + cookTime + " pm</td></tr>");
            out.println("</table>");
            out.println("</div>");
            out.println("</div>");
            out.println("<div class=\"itm col-lg-2 d-flex flex-column justify-content-around\">");
            out.println("<div>");
            out.println("<table>");
            out.println("<tr><td class=\"fw-bold\">Remarks</td></tr><tr><td>" + mark + "</td></tr>");
            out.println("</table>");
            out.println("</div>");
            out.println("<div>");
            out.println("<table><tr><td class=\"fw-bold\">Restaurant No</td></tr><tr><td class=\"fw-bold\">+91 " + restaurantMobileNumber + "</td></tr></table>");
            out.println("</div>");
            out.println("</div>");
            out.println("<div class=\"itm col-lg-2 d-flex flex-column justify-content-around status-itm\">");
            out.println("<div>");
            out.println("<table class=\"w-100\">");
            out.println("<tr><td colspan=\"2\" class=\"fw-bold\">Status</td></tr>");
            out.println("<tr><td><form action=\"ngstatusServlet\" method=\"post\"><input type=\"hidden\" name=\"donationId\" value=\""+donationId+"\"><input type=\"submit\" name=\"ngostatus\" value=\""+ ngStatus +"\"></form></td></tr>");
            out.println("</table>");
            out.println("</div>");
            out.println("</div>");
            out.println("<hr class=\"mt-4\">");
            out.println("</div>");
        }
        donationResult.close();
    }
} 
catch (Exception e) {
   out.println(e);
} finally {
    // Close the database connection
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
%>
      </div>    
    </section>



    <footer class="section footer-classic small" id="footer">
        <div class="container">
          <div class="row row-30">
            <div class="col-xs-7 col-md-5">
              <h4 class="footer-title">Contact us</h4>
              <ul class="list">
                <li>T: <a class="link-inherit" href="tel:#">(999) 999-9999</a>
                </li>
                <li>H: T-F: 7am – 3pm, S-SU: 8am – 3pm
                </li>
                <li>L : DAIICT, Gandhinagar, India
                </li>
              </ul>
              <ul class="list">
                <li>E: <a href="mailto:#">recyclinglivesofficial@gmail.com</a>
                </li>
              </ul>
            </div>
            <div class="col-xs-5 col-md-2 col-lg-3">
              <h4 class="footer-title">Socials</h4>
              <ul class="list-md">
                <li><a class="link-secondary" href="#">Facebook</a></li>
                <li><a class="link-secondary" href="#">Instagram</a></li>
                <li><a class="link-secondary" href="#">Twitter</a></li>
              </ul>
            </div>
            <div class="col-md-5 col-lg-4">
              <h4 class="footer-title">Link</h4>
              <ul class="list-md">
                <li><a class="link-secondary" href="index.html">Home</a></li>
                <li><a class="link-secondary" href="about.html">About</a></li>
                <li><a class="link-secondary" href="feed.html">Feed</a></li>
              </ul>
            </div>
          </div>
          <p class="rights"><span>&copy;&nbsp;</span><span class="copyright-year"></span><span>&nbsp;</span><span>Recycling Lives</span><span>.&nbsp;</span><a class="link-secondary" href="#">Privacy Policy</a></p>
        </div>
    </footer>


    <!-- Option 1: Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    
    <!-- Custom JS -->
    <!-- <script src="js/core.min.js"></script> -->
    <script src="script.js"></script>
    
    <link rel="stylesheet" href="feed.css">
</body>
</html>