<%@ page import="pojo.Movie"%>
<%@ page import="pojo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Booking Confirmation</title>
<link rel="stylesheet" href="css/bookingConfirmationStyles.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet">
</head>
<body>
	<!-- Navigation Bar -->
    <nav class="navbar navbar-expand-lg navbar-dark">
        <a class="navbar-brand" href="home.jsp">Get U'r Seats</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav"
            aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item"><a class="nav-link" href="MovieServlet">Browse Movies</a></li>
                <li class="nav-item"><a class="nav-link" href="FetchBookedSeatsServlet">My Seats</a></li>
                <li class="nav-item"><a class="nav-link" href="LogoutServlet">Logout</a>
                </li>
            </ul>
        </div>
    </nav>

	<div class="container">

		<center><h3>Booking Successful!</h3></center>
		<%
		Movie movie = (Movie) session.getAttribute("movie");
		User user = (User) session.getAttribute("user");
		String[] seats = (String[]) session.getAttribute("seats");
		%>
		<div class="movie-details">
			<div class="poster">
				<img src="img/<%=movie.getId()%>.png" class="movie-poster"
					alt="<%=movie.getTitle()%>">
			</div>
			<div class="details">
				<h1>
					<%=movie.getTitle()%>
				</h1>
				<p>
					Rating:
					<%=movie.getRating()%>/10
				</p>
				<p>
					Duration:
					<%=movie.getDuration()%>
				</p>
				<p>
					Genre:
					<%=movie.getGenre()%>
				</p>
			</div>
		</div>
		<h5>Booked Detials:</h5>
		<div class="booking details">
			<h6>
				Username:
				<%=user.getUsername()%></h6>
			<h6>
			<h6>
				Email:
				<%=user.getEmail()%></h6>
			<h6>
				Your Seats:
				<%
			for (String seat : seats) {
				out.print(seat + " ");
			}
			%>
			</h6>
		</div>
	</div>

<h3 class="text-center">Thank You!</h3>

	<footer>
		<p>© 2024 Movie Hall Booking || Terms & Conditions || Privacy
			Policy</p>
	</footer>

	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>