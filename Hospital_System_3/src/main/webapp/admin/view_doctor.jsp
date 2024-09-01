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
        

        <!-- Doctor Details Table -->
        <div class="col-md-12">
            <div class="card paint-card">
                <div class="card-body">
                    <p class="fs-3 text-center">Doctor Details</p>
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
                    <table class="table">
                        <thead>
                            <tr>
                                <th scope="col">Full Name</th>
                                <th scope="col">DOB</th>
                                <th scope="col">Qualification</th>
                                <th scope="col">Specialist</th>
                                <th scope="col">Email</th>
                                <th scope="col">Mob No</th>
                                <th scope="col">Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                DoctorDao doctorDao = new DoctorDao(DBConnect.getConn());
                                List<Doctor> doctorList = doctorDao.getAllDoctor();
                                for (Doctor d : doctorList) {
                            %>
                            <tr>
                                <td><%= d.getFullName() %></td>
                                <td><%= d.getDob() %></td>
                                <td><%= d.getQualification() %></td>
                                <td><%= d.getSpecialist() %></td>
                                <td><%= d.getEmail() %></td>
                                <td><%= d.getMobNo() %></td>
                                <td>
                                    <a href="edit_doctor.jsp?id=<%=d.getId()%>" class="btn btn-sm btn-primary">Edit</a>
                                    <a href="../DeleteDoctor?id=<%=d.getId()%>" class="btn btn-sm btn-danger">Delete</a>
                                </td>
                            </tr> 
                            <%
                                }
                            %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>
