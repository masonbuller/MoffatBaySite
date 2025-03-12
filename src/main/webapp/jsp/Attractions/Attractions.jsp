<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Attractions</title>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
		<link rel="stylesheet" href="/Moffat-Bay/css/Attractions.css">
		<link rel="preconnect" href="https://fonts.googleapis.com">
		<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
		<link href="https://fonts.googleapis.com/css2?family=Lexend:wght@100..900&display=swap" rel="stylesheet">
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
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
	<div class="container-fluid" id="containerHeader">
		<section class="row justify-content-center">
			<section class="text-center" id="header">
				<h1>Our Attractions</h1>
			</section>
		</section>
	</div>
	<div class="container-fluid" id="container2">
		<section class="row justify-content-center">
			<section class="col-12" id="inline">
				<section class="text-center" id="grouped">
					<div class="form-group" id="sections">
						<label>Canoeing</label><br>
						<img class="pics" alt="logo" src="/Moffat-Bay/images/canoeing.jpg" height="350px">
						<p class="desc">Discover the beauty of nature from the water as you glide through peaceful lakes, winding rivers, and hidden coves. Canoeing offers a unique way to explore breathtaking landscapes, spot local wildlife, and enjoy the tranquility of the outdoors. We offer options for all groups from sunrise to sunset.</p>
						<p class="desc">Whether you're a beginner looking for a relaxing paddle or an experienced adventurer seeking a challenge, canoeing is perfect for single travelers, couples, or families alike. Rent a canoe, grab a paddle, and set off on an unforgettable journey!</p>
					</div>
					<div class="form-group" id="sections">
						<label>Hiking Tours</label><br>
						<img class="pics" alt="logo" src="/Moffat-Bay/images/hikingtour.jpg" height="350px">
						<p class="desc">Discover breathtaking landscapes, hidden trails, and local wildlife on a guided hike led by experienced experts. Whether you're trekking through lush forests, scaling scenic ridges, or strolling along peaceful nature paths, these hikes offer a deeper connection to the great outdoors.</p>
						<p class="desc">From easy nature walks to challenging mountain climbs, guided hikes cater to all abilities. Learn about the area's history, ecology, and wildlife while enjoying a safe and enriching outdoor adventure. Lace up your boots and explore with confidence!</p>
					</div>
					<div class="form-group" id="sections">
						<label>Sailing</label><br>
						<img class="pics" alt="logo" src="/Moffat-Bay/images/Sailing.jpg" height="350px">
						<p class="desc">Set sail on calm waters and take in breathtaking views, from rugged cliffs to charming waterfront towns. Whether you're steering the boat or simply soaking in the sights, every journey offers a unique perspective of the bay’s natural beauty.</p>
						<p class="desc">Navigate the bay in a small sail boat, kayak, or canoe for a closer connection to the water. Drift past rocky shores, quiet coves, and local wildlife, taking in the peaceful surroundings at your own pace. Whether you're seeking adventure or a moment of calm, the bay offers a perfect escape.</p>
					</div>
				</section>
			</section>
		</section>
	</div>
	<jsp:include page="/jsp/Landing/Footer.jsp" flush="true"/>
</body>
</html>