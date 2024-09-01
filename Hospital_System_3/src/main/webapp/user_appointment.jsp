<%@page import="com.entity.Doctor" %>
<%@page import="java.util.List" %>
<%@page import="com.dao.DoctorDao" %> <!-- Import the DoctorDao class -->
<%@page import="com.db.DBConnect" %> <!-- Import the DBConnect class -->
<%@page import="com.entity.User" %> <!-- Import the User class -->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Appointment</title>
<%@include file="component/allcss.jsp"%>
<style type="text/css">
.paint-card {
    box-shadow: 0 0 10px rgba(0,0,0,0.3);
}
</style>
</head>
<body>
<%@include file="component/navbar.jsp" %>
<div class="col-md-6">
    <div class="card paint-card">
        <div class="card-body">
            <p class="text-center fs-3">User Appointment</p>
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
                
                // Retrieve the user object from the session
                User userObj = (User)session.getAttribute("userObj");
            %>

            <form class="row g-3" action="appAppointment" method="post">
                <input type="hidden" name="userid" value="<%= userObj != null ? userObj.getId() : "" %>">

                <div class="col-md-6">
                    <label for="inputEmail4" class="form-Label">Full Name</label>
                    <input required type="text" class="form-control" name="fullname">
                </div>

                <div class="col-md-6">
                    <label>Gender</label>
                    <select class="form-control" name="gender" required>
                        <option value="male">Male</option>
                        <option value="female">Female</option>
                    </select>
                </div>

                <div class="col-md-6">
                    <label for="inputEmail4" class="form-Label">Age</label>
                    <input required type="number" class="form-control" name="age">
                </div>

                <div class="col-md-6">
                    <label for="inputEmail4" class="form-Label">Appointment Date</label>
                    <input type="date" class="form-control" required name="appoint_date">
                </div>

                <div class="col-md-6">
                    <label for="inputEmail4" class="form-Label">Email</label>
                    <input required type="email" class="form-control" name="email">
                </div>

                <div class="col-md-6">
                    <label for="inputEmail4" class="form-Label">Phone No</label>
                    <input maxlength="10" required type="number" class="form-control" name="phno">
                </div>

                <div class="col-md-6">
                    <label for="inputEmail4" class="form-Label">Diseases</label>
                    <input required type="text" class="form-control" name="diseases">
                </div>

                <div class="col-md-6">
                    <label for="inputEmail4" class="form-Label">Doctor</label>
                    <select required class="form-control" name="doct">
                        <option value="">--select--</option>
                        <%
                        // Ensure DoctorDao and DBConnect classes are imported and accessible
                        DoctorDao dao = new DoctorDao(DBConnect.getConn());
                    	List<Doctor> list = dao.getAllDoctor();	
                        for(Doctor d: list) {
                        %>
                            <option value="<%=d.getId()%>"><%=d.getFullName()%> (<%=d.getSpecialist()%>)</option>
                        <%
                        }
                        %>
                    </select>
                </div>

                <div class="col-md-12">
                    <label>Full Address</label>
                    <textarea required name="address" class="form-control" rows="3"></textarea>
                </div>

                <%
                    if (userObj == null) {
                %>
                    <!-- If userObj is null, show login link -->
                    <a href="user_login.jsp" class="col-md-6 offset-md-3 btn btn-success">Submit</a>
                <%
                    } else {
                %>
                    <!-- If userObj is not null, show submit button -->
                    <button class="col-md-6 offset-md-3 btn btn-success">Submit</button>
                <%
                    }
                %>
            </form>
        </div>
    </div>
</div>
</body>
</html>
