<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
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
    <title>Doctor Management</title>
    <%@include file="../component/allcss.jsp" %>
    <style type="text/css">
        .paint-card {
            box-shadow: 0 0 10px rgba(0,0,0,0.3);
        }
    </style>
</head>
<body>
<%@include file="navbar.jsp" %>

<div class="container-fluid p-3">
    <div class="row">
        <!-- Add Doctor Form -->
        <div class="col-md-5 offset-md-4">
            <div class="card paint-card">
                <div class="card-body">
                    <p class="fs-3 text-center">Add Doctor</p>
                    <% 
                        String sucMsg = (String)session.getAttribute("sucMsg");
                        String errorMsg = (String)session.getAttribute("errorMsg");

                        if (sucMsg != null) {
                    %>
                        <p style="color:green;"><%= sucMsg %></p>
                    <%
                        session.removeAttribute("sucMsg");
                        }

                        if (errorMsg != null) {
                    %>
                        <p style="color:red;"><%= errorMsg %></p>
                    <%
                        session.removeAttribute("errorMsg");
                        }
                    %>

                    <form action="../AddDoctor" method="post">
                        <div class="mb-3">
                            <label class="form-label">Full Name</label>
                            <input required name="fullname" type="text" class="form-control">
                        </div>
                        <div class="mb-3">
                            <label class="form-label">DOB</label>
                            <input required name="dob" type="date" class="form-control">
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Qualification</label>
                            <input required name="qualification" type="text" class="form-control">
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Specialist</label>
                            <select name="spec" required class="form-control">
                                <option>--select--</option>
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
                            <input required name="email" type="email" class="form-control">
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Mob No</label>
                            <input required name="mobno" type="text" class="form-control">
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Password</label>
                            <input required name="password" type="password" class="form-control">
                        </div>
                        <button type="submit" class="btn btn-primary">submit</button>
                    </form>
                </div>
            </div>
        </div>

        <!-- Doctor Details Table -->
        
    </div>
</div>

</body>
</html>
