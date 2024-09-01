<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>

<nav class="navbar navbar-expand-lg navbar-dark bg-success">
  <div class="container-fluid">
    <a class="navbar-brand" href="index.jsp"><i class="fa-regular fa-hospital"></i> MEDI HOME</a>
    
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" href="index.jsp"> HOME</a>
        </li>
        <li class="nav-item">
          <a class="nav-link active" href="doctor.jsp">DOCTOR</a>
        </li>
        <li class="nav-item">
          <a class="nav-link active" href="view_doctor.jsp">VIEW DOCTOR</a>
        </li>
        <li class="nav-item">
          <a class="nav-link active" href="patient.jsp">PATIENT</a>
        </li>
      </ul>
      
      <div class="dropdown">
        <button class="btn btn-light dropdown-toggle" type="button"
                id="dropdownMenuButton1" data-bs-toggle="dropdown"
                aria-expanded="false">Admin</button>
        <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
          <li>
            <form action="../AdminLogout" method="post" style="margin: 0;">
              <button class="dropdown-item" type="submit" style="border: none; background: none; padding: 0;">Logout</button>
            </form>
          </li>
        </ul>
      </div>
      
    </div>
  </div>
</nav>
