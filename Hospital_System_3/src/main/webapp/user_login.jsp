<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User login page</title>
<%@include file="component/allcss.jsp" %>
<style type="text/css">
.paint-card {
box-shadow: 0 0 10px rgba(0,0,0,0.3);
}
</style>
</head>
<body>
<%@include file="component/navbar.jsp" %>
<div class="container p-5">
<div class="row">
<div class="col-md-4 offfset-md-4">
<div class="card paint card">
<div class="card-body">
<p class="fs-4 text center">User Login</p>

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

<form action="UserLogin" method="post">
<div class="mb-3">
<label class="form-label">Email address</label><input required
name="email" type="email" class="form-control">
</div>

<div class="mb-3">
<label class="form-label">password</label><input required
name="password" type="password" class="form-control">
</div>
<button type="submit" class="btn bg-success text-white col-md-12">Login</button>
</form>
<br>Don't have an account?<a href="signup.jsp" class="text-decoration-none">
create one</a>
</div>
</div>
</div>
</div>
</div>
</body>
</html>