<%@page import="com.db.DBConnect" %>
<%@page import="java.sql.Connection" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" errorPage="errors.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>my first jsp</title>
<%@include file="component/allcss.jsp" %>
<style type="text/css">
.paint-card {
box-shadow: 0 0 10px rgba(0,0,0,0.3);
}
</style>
</head>


<body>
	<%@include file="component/navbar.jsp" %>
	 
	 
	
	<div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
  <div class="carousel-indicators">
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
  </div>
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="img/Hospital-Management-System.jpg" class="d-block w-100" alt="..." height="500px">
    </div>
    <div class="carousel-item">
      <img src="img/nurse-enters-data-in-computer-in-hospital-operating-room-C398F7.jpg" class="d-block w-100" alt="..." height="500px">
    </div>
    <div class="carousel-item">
      <img src="img/shutterstock_309659453-Operating-Room.jpg" class="d-block w-100" alt="..." height="500px">
    </div>
  </div>
  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
</div>

<div class="container p-3">
<p class="text-center fs-2 ">key features of our Hospital</p>
<div class="row">
<div class="col-md-6">
<div class="card paint-card">
<div class="card-body">
<p class="fs-5">100% safety</p>
<p>hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh
hhhhhhhhhhhhhhhhhhh</p>
</div>
</div>
</div>
<div class="col-md-6">
<div class="card paint-card">
<div class="card-body">
<p class="fs-5">clean environment</p>
<p>hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh
hhhhhhhhhhhhhhhhhhh</p>
</div>
</div>
</div>
<div class="col-md-6">
<div class="card paint-card">
<div class="card-body">
<p class="fs-5">friendly doctorst</p>
<p>hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh
hhhhhhhhhhhhhhhhhhh</p>
</div>
</div>
</div>
<div class="col-md-6">
<div class="card paint-card">
<div class="card-body">
<p class="fs-5">medical research</p>
<p>hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh
hhhhhhhhhhhhhhhhhhh</p>
</div>
</div>
</div>
</div>
</div>
<div class="col-md-4">
</div>
</div>
</div>


<%@include file="component/footer.jsp" %>

</body>
</html>