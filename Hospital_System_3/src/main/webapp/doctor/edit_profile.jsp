<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false"%>
<%@ page import="com.entity.Doctor, com.dao.AppointmentDAO, com.dao.DoctorDao, com.db.DBConnect" %>
<%@ page import="java.util.List" %>
<%@ page import="com.entity.User" %>
<%@ page import="com.entity.Appointment" %>
<%@ page import="com.dao.DoctorDao" %>
<%@ page import="com.dao.SpecialistDao" %>
<%@ page import="com.db.DBConnect" %>
<%@ page import="java.util.List" %>
<%@ page import="com.entity.Doctor" %>
<%@ page import="com.entity.Specialist" %>
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
<c:if test="${empty doctObj }">
<c:redirect url="../doctor_login.jsp"></c:redirect>
</c:if>
<%@include file="navbar.jsp" %>


<div class="container p-4">
    <div class="row">
        <!-- Change Password Form on the Top Left -->
        <div class="col-md-5">
            <div class="card paint-card">
                <div class="card-header text-center">Change Password </div>
                <div class="card-body">
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
<form action="../DoctorPasswordChange" method="post">
<div class="mb-3">
<label>Enter New Password</label><input type="text"
name="newPassword" class="form-control" required>
</div>

<div class="mb-3">
<label>Enter Old Password</label><input type="text"
name="oldPassword" class="form-control" required>
</div>
<input type="hidden" value="${doctObj.id }" name="uid">
<button class="btn btn-success col-md-12">Change Password</button>

</form>
</div>
</div>
</div>

 <div class="col-md-5 offset-md-2">
            <div class="card paint-card">
                <div class="card-header text-center">Edit Profile </div>
                <%
    String sucMsgd = (String)session.getAttribute("sucMsgd");
    String errorMsgd = (String)session.getAttribute("errorMsgd");

    if(sucMsgd != null) {
%>
    <p style="color:green;"><%= sucMsgd %></p>
<%
    session.removeAttribute("sucMsgd");
    }

    if(errorMsgd != null) {
%>
    <p style="color:red;"><%= errorMsgd %></p>
<%
    session.removeAttribute("errorMsgd");
    }
%>
                <div class="card-body">
                    <form action="../EditProfile" method="post">
                        <div class="mb-3">
                            <label class="form-label">Full Name</label>
                            <input required name="fullname" type="text" value="${doctObj.fullName}" class="form-control">
                        </div>
                        <div class="mb-3">
                            <label class="form-label">DOB</label>
                            <input required name="dob" type="date" value="${doctObj.dob}" class="form-control">
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Qualification</label>
                            <input required name="qualification" type="text" value="${doctObj.qualification}" class="form-control">
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Specialist</label>
                            <select name="spec" required class="form-control">
                                <option>${doctObj.specialist}</option>
                                <%
                                    SpecialistDao specDao = new SpecialistDao(DBConnect.getConn());
                                    List<Specialist> specList = specDao.getAllSpecialists();
                                    for (Specialist s : specList) {
                                %>
                                    <option><%= s.getSpecialistName() %></option>
                                <%
                                    }
                                %>
                            </select>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Email</label>
                            <input required name="email" type="email" readonly class="form-control" value="${doctObj.email }">
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Mob No</label>
                            <input required name="mobno" type="text" class="form-control" value="${doctObj.mobNo }">
                        </div>
                        <input type="hidden" name="id" value="${doctObj.id }">
                        
                        <button type="submit" class="btn btn-primary col-md-12">submit</button>
                    </form>
</div>
</div>
</div>
</div>
</div>
</body>
</html> 