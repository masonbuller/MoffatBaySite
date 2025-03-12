<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Lodging Options</title>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
		<link rel="stylesheet" href="/Moffat-Bay/css/LodgingOptions.css">
		<link rel="preconnect" href="https://fonts.googleapis.com">
		<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
		<link href="https://fonts.googleapis.com/css2?family=Lexend:wght@100..900&display=swap" rel="stylesheet">
</head>
<body>
	<%
		if (session == null || session.getAttribute("email") == null) {
			request.setAttribute("loginStatus", "Login");
		} else {
			request.setAttribute("loginStatus", "Logged In");
		}
	%>
	<nav class="navbar navbar-expand-xl navbar-light bg-light">
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
          				<a class="nav-link" href="/Moffat-Bay/jsp/Reservation/LodgingOptions.jsp">Book Reservation</a>
        			</li>
        			<li class="nav-item px-2">
          				<a class="nav-link" href="/Moffat-Bay/jsp/ReservationLookup/ReservationLookup.jsp">Reservation Lookup</a>
        			</li>
        			<li class="nav-item px-2">
          				<a class="nav-link" href="/Moffat-Bay/jsp/AboutUs/ContactUs.jsp">Contact Us</a>
        			</li>
        			<%
        				if (request.getAttribute("loginStatus") == "Logged In") {
        			%>
        				<li class="nav-item dropdown">
          					<a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            				<%= request.getAttribute("loginStatus") %>
          					</a>
          						<ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
          							<form action="/Moffat-Bay/account" method="post">
            							<li><button class="dropdown-item" type="submit">My Account</button></li>
            						</form>
          							<form action="/Moffat-Bay/logout" method="post">
            							<li><button class="dropdown-item" type="submit">Log Out</button></li>
            						</form>
          						</ul>
        				</li>
        			<% 
        				} else {
        			%>
        				<li class="nav-item px-2">
          					<a class="nav-link" href="/Moffat-Bay/jsp/Login/loginForm.jsp"><%= request.getAttribute("loginStatus") %></a>
        				</li>
        			<%
        				}
        			%>
      			</ul>
    		</div>
  		</div>
	</nav>
	<div class="container-fluid" id="containerMain">
		<section class="row justify-content-center">
			<section id="header">
				<h1>Explore our different lodging options</h1>
			</section>
		</section>
	</div>
	<div class="container-fluid" id="container1">
		<section class="row justify-content-center">
			<section id="inline">
				<section class="col-md-6" id="grouped">
					<div class="image" id="sections">
						<img alt="logo" src="/Moffat-Bay/images/oneking.jpg" class="roomImage">
					</div>
					<div class="col-md-6" id="sections">
						<h2>Deluxe King Lodge</h2>
						<p class="no-space">This lodge is a cozy cabin-style accommodation featuring one king bed. This cabin has a private en-suite bathroom, fit with a couch and fireplace for all of your relaxation needs. This suite offers a view overlooking our Moffat Bay area and the mountain line. Whether you're enjoying the sunrise or sunset, this lodge is the perfect choice for couples or solo travelers looking for comfort and a great view.<br><span class="cost text-muted">$168.00 per night</span></p>
						<a href="/Moffat-Bay/jsp/Reservation/BookReservation.jsp"><button type="button" class="btn btn-lg btn-outline-success" id="book">Book Now</button></a>
					</div>
				</section>
			</section>
		</section>
	</div>
	<div class="container-fluid" id="container2">
		<section class="row justify-content-center">
			<section id="inline">
				<section class="col-md-5" id="grouped">
					<div class="image" id="sections">
						<img alt="logo" src="/Moffat-Bay/images/onequeen.jpg" class="roomImage">
					</div>
					<div class="col-md-6" id="sections">
						<h2>Premium Queen Lodge</h2>
						<p>This charming cabin-style lodge features one queen bed, perfect for anyone looking for a cozy and peaceful retreat. The room includes a private en-suite bathroom and a comfortable seating area to relax in. Enjoy beautiful views of Moffat Bay and the mountain line right from your window. Whether you're relaxing during the day or unwinding in the evening, the scenery of the beautiful Moffat Bay is sure to help you relax.<br><span class="cost text-muted">$141.75 per night</span></p>
						<a href="/Moffat-Bay/jsp/Reservation/BookReservation.jsp"><button type="button" class="btn btn-lg btn-outline-success" id="book">Book Now</button></a>
					</div>
				</section>
			</section>
		</section>
	</div>
	<div class="container-fluid" id="container3">
		<section class="row justify-content-center">
			<section id="inline">
				<section class="col-md-6" id="grouped">
					<div class="image" id="sections">
						<img alt="logo" src="/Moffat-Bay/images/twoqueen.jpg" class="roomImage">
					</div>
					<div class="col-md-6" id="sections">
						<h2>Premium Two Queen Lodge</h2>
						<p>This cozy cabin-style lodge features two queen beds, perfect for families or friends. The room includes a private en-suite bathroom and is designed for comfort with a seating area to relax and unwind. The peaceful scenery makes for a relaxing stay with a view of the mountain range just outside your window. With its comfortable setup and great location, this room is ideal for those looking for both comfort and a stunning view.<br><span class="cost text-muted">$157.50 per night</span></p>
						<a href="/Moffat-Bay/jsp/Reservation/BookReservation.jsp"><button type="button" class="btn btn-lg btn-outline-success" id="book">Book Now</button></a>
					</div>
				</section>
			</section>
		</section>
	</div>
	<div class="container-fluid" id="container4">
		<section class="row justify-content-center">
			<section id="inline">
				<section class="col-md-6" id="grouped">
					<div class="image" id="sections">
						<img alt="logo" src="/Moffat-Bay/images/twotwin.jpg" class="roomImage">
					</div>
					<div class="col-md-6" id="sections">
						<h2>Two Full Suite</h2>
						<p>This inviting lodge room features two twin beds, ideal for friends or family looking for a comfortable stay. The room includes a private en-suite bathroom and a cozy seating area to relax and unwind. Enjoy the peaceful scenery with stunning views of the mountain range just outside your window. Designed for comfort and relaxation, this room offers the perfect blend of cozy accommodation and a beautiful location.<br><span class="cost text-muted">$126.00 per night</span></p>
						<a href="/Moffat-Bay/jsp/Reservation/BookReservation.jsp"><button type="button" class="btn btn-lg btn-outline-success" id="book">Book Now</button></a>
					</div>
				</section>
			</section>
		</section>
	</div>
	<div class="container-fluid" id="containerBottom">
		<section class="row justify-content-center">
			<section id="header3">
          		<p> Questions? <a href="/Moffat-Bay/jsp/AboutUs/ContactUs.jsp">Contact us!</a></p>
			</section>
			<jsp:include page="/jsp/Landing/Footer.jsp" flush="true"/>
		</section>
	</div>
</body>
</html>