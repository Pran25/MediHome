package com.doctor.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Db.DbConnect;
import com.dao.Doctordao;
import com.dao.Userdao;
import com.entity.Doctor;
import com.entity.User;

@WebServlet("/doctorLogin")
public class DoctorLogin extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		

		String email = req.getParameter("email");
		String password = req.getParameter("password");
		HttpSession session = req.getSession();		
		
		Doctordao dao = new Doctordao(DbConnect.getcon());
	     Doctor doctor = dao.login(email, password);
		
		if(doctor!=null)
		{
			session.setAttribute("docObj",doctor);
			resp.sendRedirect("Doctor/index.jsp");
		}else
		{
			session.setAttribute("errorMsg","Invalid Email & Password");
			resp.sendRedirect("doctor_login.jsp");
		}
		
		
	}

}
