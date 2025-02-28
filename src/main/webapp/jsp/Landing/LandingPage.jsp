<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Landing Page</title>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
		<link rel="stylesheet" href="/Moffat-Bay/css/Landing.css">
		<link rel="preconnect" href="https://fonts.googleapis.com">
		<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
		<link href="https://fonts.googleapis.com/css2?family=Lexend:wght@100..900&display=swap" rel="stylesheet">
</head>
<body>
	<%
		HttpSession mysession = request.getSession(false);
		if (mysession == null || mysession.getAttribute("email") == null) {
			request.setAttribute("loginStatus", "Login");
		} else {
			request.setAttribute("loginStatus", "Logged In");
		}
	%>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
  		<div class="container-fluid">
    		<a class="navbar-brand px-4" href="/Moffat-Bay/jsp/Landing/LandingPage.jsp">
    			<img alt="logo" src="/Moffat-Bay/images/SalishSalmon.png" width="30px" height="30px">
    			Moffat Bay
    		</a>
    		<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
      			<span class="navbar-toggler-icon"></span>
    		</button>
    		<div class="collapse navbar-collapse" id="navbarNav">
      			<ul class="navbar-nav">
        			<li class="nav-item px-2">
          				<a class="nav-link" href="/Moffat-Bay/jsp/Landing/LandingPage.jsp">Home</a>
        			</li>
        			<li class="nav-item px-2">
          				<a class="nav-link" href="/Moffat-Bay/jsp/Attractions/Attractions.jsp">Attractions</a>
        			</li>
        			<li class="nav-item px-2">
          				<a class="nav-link" href="/Moffat-Bay/jsp/Reservation/BookReservation.jsp">Book Reservation</a>
        			</li>
        			<li class="nav-item px-2">
          				<a class="nav-link" href="/Moffat-Bay/jsp/ReservationLookup/ReservationLookup.jsp">Reservation Lookup</a>
        			</li>
        			<li class="nav-item px-2">
          				<a class="nav-link" href="/Moffat-Bay/jsp/UserRegistration/UserRegistration.jsp">User Registration</a>
        			</li>
        			<li class="nav-item px-2">
          				<a class="nav-link" href="/Moffat-Bay/jsp/AboutUs/AboutUs.jsp">About Us</a>
        			</li>
        			<li class="nav-item px-2">
          				<a class="nav-link" href="/Moffat-Bay/jsp/Login/loginForm.jsp"><%= request.getAttribute("loginStatus") %></a>
        			</li>
      			</ul>
    		</div>
  		</div>
	</nav>
<%
		if (session.getAttribute("landingMessage") != null) {
			if (session.getAttribute("landingMessage") == "loginSuccess") {
				session.setAttribute("message", "Successfully logged in");
			} else if (session.getAttribute("landingMessage") == "bookingSuccess") {
				session.setAttribute("message", "Reservation booked successfully");
			} else if (session.getAttribute("landingMessage") == "contactSuccess") {
				session.setAttribute("message", "Contact request sent successfully. Someone will be in touch with you shortly");
			}
			
			%>
			<div class="alert alert-success alert-dismissible fade show" role="alert">
  				<strong>Success!</strong> <%= session.getAttribute("message") %>
  				<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
			</div>
	<%
		}
		
		session.removeAttribute("landingMessage");
	%>
	<div class="container-fluid" id="container1">
		<section class="row justify-content-center">
			<section class="col-12 col-sm-6 col-md-8">
				<section id="group">
					<div class="form-group" id="logo">
						<h1>Moffat Bay</h1>
					</div>
					<div class="form-group" id="description">
						<p>Welcome to Moffat Bay, where we have endless options. Discover more when you book a room at Moffat Bay. From canoeing, whale watching, and sailing, there will always be more to explore. Book now to experience everything we have to offer.</p>
					</div>
					<div class="button-group" id="button1">
						<a href="/Moffat-Bay/jsp/Reservation/BookReservation.jsp"><button type="button" class="btn btn-lg btn-light">BOOK NOW</button></a>
					</div>
				</section>
			</section>
		</section>
	</div>
	<div class="container-fluid" id="container2">
		<section class="row justify-content-center">
			<section class="col-12" id="inline">
				<section class="text-center" id="group2">
					<div class="form-group text-center" id="exploring">
						<h2 class="exploring">Explore what we have to offer</h2>
					</div>
					<div class="form-group" id="sections">
						<p>Campfires</p>
						<img alt="logo" src="/Moffat-Bay/images/Campfire.jpg" height="400px">
					</div>
					<div class="form-group" id="sections">
						<p>Main Lodge</p>
						<img alt="logo" src="/Moffat-Bay/images/lodge.jpg" height="400px">
					</div>
					<div class="form-group" id="sections">
						<p>Canoeing</p>
						<img alt="logo" src="/Moffat-Bay/images/canoe_dirt.jpg" height="400px">
					</div>
				</section>
			</section>
		</section>
	</div>
	<div class="container-fluid" id="container3">
		<section class="row justify-content-center">
			<section class="col-12 col-sm-6 col-md-8">
				<section id="group3">
					<div class="form-group" id="review">
						<p>Where travel meets comfort. Explore endlessly, comfortably.</p>
					</div>
					<div class="button-group" id="button2">
						<a href="/Moffat-Bay/jsp/Attractions/Attractions.jsp"><button type="button" class="btn btn-lg btn-light">Explore More</button></a>
					</div>
				</section>
			</section>
		</section>
	</div>
	<jsp:include page="/jsp/Landing/Footer.jsp" flush="true"/>
</body>
</html>