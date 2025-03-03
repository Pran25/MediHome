<%@page import="com.entity.Doctor"%>
<%@page import="com.dao.Doctordao"%>
<%@page import="com.entity.Specialist"%>
<%@page import="java.util.List"%>
<%@page import="com.Db.DbConnect"%>
<%@page import="com.dao.SpecialistDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="../Component/allcss.jsp"%>

<style type="text/css">
.point-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}
</style>

</head>
<body>
	<%@include file="Navbar.jsp"%>

	<div class="container-fluid p-5">
		<div class="row">

			<div class="col-md-4 offset-md-4">
				<div class="card point-card">
					<div class="card-body">
						<p class="fs-3 text-center">Edit Doctor Details</p>

						<c:if test="${not empty sucMsg}">
							<p class="text-center text-success fs-3">${sucMsg}</p>
							<c:remove var="sucMsg" scope="session" />
						</c:if>

						<c:if test="${not empty errorMsg}">
							<p class="text-center text-danger fs-5">${errorMsg}</p>
							<c:remove var="errorMsg" scope="session" />
						</c:if>
						
						<%
						   
						  
						   int id = Integer.parseInt(request.getParameter("id"));
						   Doctordao dao2 = new Doctordao(DbConnect.getcon());
						   Doctor d = dao2.getDoctorsById(id);
						
						%>


						<form action="../updateDoctor" method="post">

							<div class="mb-3">
								<label class="form-label">Full Name</label> <input type="text"
									required name="fullname" class="form-control" value="<%=d.getDocname()%>">
							</div>

							<div class="mb-3">
								<label class="form-label">DOB</label> <input type="date"
									required name="dob" class="form-control" value="<%=d.getDob() %>">
							</div>

							<div class="mb-3">
								<label class="form-label">Qualification</label> <input
									type="text" required name="quali" class="form-control" value="<%=d.getQualification() %>">
							</div>

							<div class="mb-3">
								<label class="form-label">Specialist</label> <select name="spec"
									required class="form-control">
									<option><%=d.getSpecialist() %></option>

									<%
									SpecialistDao dao = new SpecialistDao(DbConnect.getcon());

									List<Specialist> list = dao.getallSpecialist();

									for (Specialist s : list) {
									%>
									<option><%=s.getSpecname()%></option>
									<%
									}
									%>



								</select>
							</div>

							<div class="mb-3">
								<label class="form-label">Email</label> <input type="text"
									required name="email" class="form-control" value="<%=d.getEmail() %>">
							</div>

							<div class="mb-3">
								<label class="form-label">Mobile no</label> <input type="text"
									required name="mobno" class="form-control" value="<%=d.getMobno() %>">
							</div>

							<div class="mb-3">
								<label class="form-label">Password</label> <input type="password"
									required name="password" class="form-control" value="<%=d.getPassword() %>">
							</div>
							
							<input type="hidden" name="id" value="<%=d.getId() %>">

							<button type="submit" class="btn btn-primary col-md-12">Update</button>
						</form>
					</div>
				</div>
			</div>
			
			
			
			
		</div>
	</div>





</body>
</html>