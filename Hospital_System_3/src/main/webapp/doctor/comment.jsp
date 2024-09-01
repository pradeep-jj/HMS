<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.entity.Doctor, com.dao.AppointmentDAO, com.dao.DoctorDao, com.db.DBConnect" %>
<%@ page import="java.util.List" %>
<%@ page import="com.entity.User" %>
<%@ page import="com.entity.Appointment" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
.paint-card {
box-shadow: 0 0 10px rgba(0,0,0,0.3);
}
</style>
<%@include file="../component/allcss.jsp" %>

</head>
<body>
	<%@include file="navbar.jsp" %>

<div class="container p-3">
<div class="row">
<div class="col-md-6 offset-md-3">
<div class="card paint-card">
<div class="card-body">
<p class="text-center fs-4">Patient Comment</p>

<%
int id = Integer.parseInt(request.getParameter("id"));
AppointmentDAO dao=new AppointmentDAO(DBConnect.getConn());
Appointment ap=dao.getAppointmentById(id);
%>

<form class="row" action="../UpdateStatus" method="post">
<div class="col-md-6">
<label>Patient Name</label><input type="text" readonly value="<%=ap.getFullName() %>" 
class="form-control">
</div>

<div class="col-md-6">
<label>Age</label><input type="text" value="<%=ap.getAge() %>" readonly 
class="form-control">
</div>

<div class="col-md-6">
<label>Mob No</label><input type="text" readonly value="<%=ap.getPhNo() %>" 
class="form-control">
</div>

<div class="col-md-6">
<label>Diseases</label><input type="text" readonly value="<%=ap.getDiseases() %>" 
class="form-control">
</div>

<div class="col-md-6">
<label>Comment</label><textarea required name="comm" class="form-control" row="3"
 cols=""></textarea>
</div>
<input type="hidden" name="id" value="<%=ap.getId() %>">
<input type="hidden" name="did" value="<%=ap.getDoctorId() %>">
<button class=" mt-3 btn btn-primary col-md-6 offset-md-3">Submit</button>

</form>
</div>
</div>
</div>

</div>
</div>
</body>
</html>