<%@page import="com.entity.Appointment"%>
<%@page import="java.util.List"%>
<%@page import="com.Db.DbConnect"%>
<%@page import="com.dao.AppointmentDAO"%>
<%@page import="com.entity.Doctor"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Patient Page</title>
<%@include file="../Component/allcss.jsp"%>

<style type="text/css">
.point-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}
</style>

</head>
<body>
	<%@include file="Navbar.jsp"%>

	<c:if test="${empty docObj }">
		<c:redirect url="../doctor_login.jsp"></c:redirect>
	</c:if>

	<div class="container p-5">
		<div class="row">
			<div class="col-md-12">
				<div class="card point-card">
					<div class="card-body">
						<p class="fs-4 text-center">Patient Details</p>

						<c:if test="${not empty sucMsg}">
							<p class="text-center text-success fs-3">${sucMsg}</p>
							<c:remove var="sucMsg" scope="session" />
						</c:if>

						<c:if test="${not empty errorMsg}">
							<p class="text-center text-danger fs-5">${errorMsg}</p>
							<c:remove var="errorMsg" scope="session" />
						</c:if>

						<table class="table">
							<thead>
								<tr>
									<th scope="col">Full Name</th>
									<th scope="col">Gender</th>
									<th scope="col">Age</th>
									<th scope="col">Appointment Date</th>
									<th scope="col">Email</th>
									<th scope="col">Mobile No</th>
									<th scope="col">Disease</th>
									<th scope="col">Status</th>
									<th scope="col">Action</th>
									
								</tr>
							</thead>
							<tbody>
							
							         <%
							            
							            Doctor d =(Doctor) session.getAttribute("docObj");
							            AppointmentDAO dao = new AppointmentDAO(DbConnect.getcon());
							            List<Appointment> list = dao.getAllAppointmentByDoctor(d.getId());
							            
							            for(Appointment ap : list)
							            {%>
							            
							            	<tr>
											<th><%=ap.getFullName() %></th>
											<td><%=ap.getGender() %></td>
											<td><%=ap.getAge() %></td>
											<td><%=ap.getAppointDate() %></td>
											<td><%=ap.getEmail() %></td>
											<td><%=ap.getPhno() %></td>
											<td><%=ap. getDisease()%></td>
											<td><%=ap.getStatus() %></td>
											<td>
											
											<%
											   
											if("Pending".equals(ap.getStatus()))
											{%>
											
											        <a href="Comment.jsp?id=<%=ap.getId() %>" class="btn btn-success btn-sm">Comment</a>
												
											<%}else
											{%>
												 <a href="#" class="btn btn-success btn-sm disabled">Comment</a>
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