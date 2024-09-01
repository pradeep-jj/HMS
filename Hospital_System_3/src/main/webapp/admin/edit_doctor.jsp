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
        <div class="col-md-4 offset-md-4">
            <div class="card paint-card">
                <div class="card-body">
                    <p class="fs-3 text-center">Edit Doctor Details</p>
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
                        <%
                        int id=Integer.parseInt(request.getParameter("id"));
                        DoctorDao dao2=new DoctorDao(DBConnect.getConn());
                        Doctor d=dao2.getDoctorById(id);
                        
                        %>     
                             
                             
                             
                             
                    <form action="../UpdateDoctor" method="post">
    <div class="mb-3">
        <label class="form-label">Full Name</label>
        <input type="text" required name="fullname" class="form-control" value="<%= d.getFullName() %>">
    </div>
    <div class="mb-3">
        <label class="form-label">DOB</label>
        <input type="date" required name="dob" class="form-control" value="<%= d.getDob() %>">
    </div>
    <div class="mb-3">
        <label class="form-label">Qualification</label>
        <input required name="qualification" type="text" class="form-control" value="<%= d.getQualification() %>">
    </div>
                        <div class="mb-3">
                            <label class="form-label">Specialist</label>
                            <select name="spec" required class="form-control">
                                <option><%= d.getSpecialist() %>"></option>
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
                            <input required name="email" type="email"  class="form-control" value="<%= d.getEmail() %>">
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Mob No</label>
                            <input required name="mobno" type="text"  class="form-control" value="<%= d.getMobNo() %>">
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Password</label>
                            <input required name="password" type="text"  class="form-control" value="<%= d.getPassword() %>">
                        </div>
                        <input type="hidden" name="id" value="<%= d.getId() %>">
                        <button type="submit" class="btn btn-primary col-md-12">Update</button>
                    </form>
                </div>
            </div>
        </div>

        
        
        
        
        </div>
    </div>
</div>

</body>
</html>
