<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false"%>
<%@ page import="com.entity.Doctor, com.dao.AppointmentDAO, com.dao.DoctorDao, com.db.DBConnect" %>
<%@ page import="java.util.List" %>
<%@ page import="com.entity.User" %>
<%@ page import="com.entity.Appointment" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="component/allcss.jsp" %>
<style type="text/css">
.paint-card {
    box-shadow: 0 0 10px rgba(0,0,0,0.3);
}
</style>

</head>
<body>
<%@include file="component/navbar.jsp" %>

<c:if test="${empty userObj }">
<c:redirect url="user_login.jsp"></c:redirect>
</c:if>
<div class="container p-4">
<div class="row">
<div class="col-md 4 offset-md-4">
<div class="card paint_card">
<div class="text-center fs-3">Change Password</p>
<%
    String sucMsg = (String)session.getAttribute("sucMsg");
    String errorMsg = (String)session.getAttribute("errorMsg");

    if(sucMsg != null) {
%>
    <p style="color:green;"><%= sucMsg %></p>
<%
    session.removeAttribute("sucMsg");
    }

    if(errorMsg != null) {
%>
    <p style="color:red;"><%= errorMsg %></p>
<%
    session.removeAttribute("errorMsg");
    }
%>

<div class="card-body">
<form action="changePassword" method="post">
<div class="mb-3">
<label>Enter New Password</label><input type="text"
name="newPassword" class="form-control" required>
</div>

<div class="mb-3">
<label>Enter Old Password</label><input type="text"
name="oldPassword" class="form-control" required>
</div>
<input type="hidden" value="${userObj.id }" name="uid">
<button class="btn btn-success col-md-12">Change Password</button>

</form>
</div>
</div>
</div>
</div>
</div>

</body>
</html>