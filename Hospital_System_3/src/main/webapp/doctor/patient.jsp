<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<%@ page import="com.entity.Doctor, com.dao.AppointmentDAO, com.dao.DoctorDao, com.db.DBConnect" %>
<%@ page import="java.util.List" %>
<%@ page import="com.entity.User" %>
<%@ page import="com.entity.Appointment" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="../component/allcss.jsp" %>
<style type="text/css">
.paint-card {
    box-shadow: 0 0 10px rgba(0,0,0,0.3);
}
</style>
</head>
<body>
    <%@include file="navbar.jsp" %>
<div class="container p-3">
        <div class="row">
            <div class="col-md-12">
                <div class="card paint-card">
                <div class="card-body">
                    <p class="fs-3 text-center">Patient Details</p>
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
  <table class="table">
  <thead>
                            <tr>
                                <th scope="col">Full Name</th>
                                <th scope="col">Gender</th>
                                <th scope="col">Age</th>
                                <th scope="col">Appoint Date</th>
                                <th scope="col">Diseases</th>
                                <th scope="col">Doctor Name</th>
                                <th scope="col">Status</th>
                                 <th scope="col">Action</th>
                                
                            </tr>
                            </thead>
                            <tbody>
                              <%
                                Doctor d = (Doctor) session.getAttribute("doctObj");
                                AppointmentDAO dao = new AppointmentDAO(DBConnect.getConn());
                                DoctorDao dao2 = new DoctorDao(DBConnect.getConn());
                                List<Appointment> list = dao.getAllAppointmentByDoctorLogin(d.getId());
                                
                                for (Appointment ap : list) {
                                %>
                                	<tr>
                            <td><%= ap.getFullName() %></td>
                            <td><%= ap.getGender() %></td>
                            <td><%= ap.getAge() %></td>
                            <td><%= ap.getAppointDate() %></td>
                            <td><%= ap.getDiseases() %></td>
                            <td><%= d.getFullName() %></td>
                            <td><%= ap.getStatus() %></td>
                            <td>
                            <%
                            if("pending".equals(ap.getStatus()))
                             
                             {%>
                            <a href="comment.jsp?id=<%=ap.getId() %>" 
                            class="btn btn-success btn-sm">Comment</a>
                            <%}else{%>
                            	<a href="#" 
                                        class="btn btn-success btn-sm disabled">Comment</a>	
                            	
                            <%}
                            
                            %>
                            
                            
                            
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
