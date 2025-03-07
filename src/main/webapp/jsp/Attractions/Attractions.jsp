<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    	<title>Attractions</title>
    	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
		<link rel="stylesheet" href="/Moffat-Bay/css/AboutUs.css">
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
          				<a class="nav-link" href="/Moffat-Bay/jsp/Reservation/BookReservation.jsp">Book Reservation</a>
        			</li>
        			<li class="nav-item px-2">
          				<a class="nav-link" href="/Moffat-Bay/jsp/ReservationLookup/ReservationLookup.jsp">Reservation Lookup</a>
        			</li>
        			<li class="nav-item px-2">
          				<a class="nav-link" href="/Moffat-Bay/jsp/AboutUs/AboutUs.jsp">About Us</a>
        			</li>
        			<%
        				if (request.getAttribute("loginStatus") == "Logged In") {
        			%>
        				<li class="nav-item dropdown">
          					<a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            				<%= request.getAttribute("loginStatus") %>
          					</a>
          						<ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
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
	<div class="container-fluid" id="container">
		<section class="row">
			<section class="col-md-4">
				<form class="form-container" action="/Moffat-Bay/whalewatching" method="post">
					<div class="form-group">
						<h1 class="text-center">Whale Watching</h1>
					</div>
					<div class="text-center">
						<img src="/Moffat-Bay/images/Orcas.jpg" width="100%">
					</div>
					<div class="text-center">
						<p>Come watch the whales in the beautiful Griffin Bay.</p>
					</div>
				</form>
			</section>
			<section class="col-md-4">
				<form class="form-container" action="/Moffat-Bay/canoeing" method="post">
					<div class="form-group">
						<h1 class="text-center">Canoeing</h1>
					</div>
					<div class="text-center">
						<img src="/Moffat-Bay/images/Canoe.jpg" width="100%">
					</div>
					<div class="text-center">
						<p>Canoe around the islands. You will be able to see a lot of great wildlife!</p>
					</div>
				</form>
			</section>
			<section class="col-md-4">
				<form class="form-container" action="/Moffat-Bay/beachfun" method="post">
					<div class="form-group">
						<h1 class="text-center">Sailing</h1>
					</div>
					<div class="text-center">
						<img src="/Moffat-Bay/images/Sailing.jpg" width="100%">
					</div>
					<div class="text-center">
						<p>Sailing is a great way to relax and soak up the sun.</p>
					</div>
				</form>
			</section>
		<section class="row">
			<section class="col-sm-2" text="center">
				<form class="form-container" action="/Moffat-Bay/contact" method="post">
					<div class="form-group" id="contact">
						<p class="text-center"><a href="/Moffat-Bay/jsp/Reservation/BookReservation.jsp">Book a Room</a></p>
					</div>
				</form>
			</section>
		</section>
	</div>
	<jsp:include page="/jsp/Landing/Footer.jsp" flush="true"/>
</body>
</html>