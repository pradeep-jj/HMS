<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false"%>
<%@ page import="java.util.List" %>
<%@ page import="com.entity.User" %>
<%@ page import="com.entity.Appointment" %>
<%@ page import="com.dao.AppointmentDAO" %>
<%@ page import="com.dao.DoctorDao" %>
<%@ page import="com.entity.Doctor" %>
<%@ page import="com.db.DBConnect" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Appointment List</title>
<%@include file="component/allcss.jsp" %>
<style type="text/css">
.paint-card {
    box-shadow: 0 0 10px rgba(0,0,0,0.3);
}
</style>
</head>
<body>
<c:if test="${empty userObj }">
<c:redirect url="user_login.jsp"></c:redirect>
</c:if>
    <%@include file="component/navbar.jsp" %>
    <div class="container p-3">
        <div class="row">
            <div class="col-md-9">
                <div class="card paint-card">
                    <p class="fs-4 fw-bold text-center text-success">Appointment List</p>
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
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                User user = (User) session.getAttribute("userObj");
                                AppointmentDAO dao = new AppointmentDAO(DBConnect.getConn());
                                DoctorDao dao2 = new DoctorDao(DBConnect.getConn());
                                List<Appointment> list = dao.getAllAppointmentByLoginUser(user.getId());
                                
                                for (Appointment ap : list) {
                                    Doctor d = dao2.getDoctorById(ap.getDoctorId());
                            %>
                            <tr>
                                <th><%= ap.getFullName() %></th>
                                <td><%= ap.getGender() %></td>
                                <td><%= ap.getAge() %></td>
                                <td><%= ap.getAppointDate() %></td>
                                <td><%= ap.getDiseases() %></td>
                                <td><%= d.getFullName() %></td>
                                <td>
                                    <% if ("pending".equals(ap.getStatus())) { %>
                                        <a href="#" class="btn btn-sm btn-warning">Pending</a>
                                    <% } else { %>
                                        <%= ap.getStatus() %>
                                    <% } %>
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
</body>
</html>
