package bank_project;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bank_dao.UserDao;
import bank_dto.User;

@WebServlet("/register")
public class Register extends HttpServlet
{
	User user;
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		user=new User(req.getParameter("name"),Long.parseLong(req.getParameter("phone")),req.getParameter("email"),Integer.parseInt(req.getParameter("age")),req.getParameter("password"));
		try {
			int result= UserDao.registerUser(user);
			if(result==-1)
			{
				req.setAttribute("msg","phone number already exist!!");
				RequestDispatcher rd=req.getRequestDispatcher("register.jsp");
				rd.include(req, resp);
			}
			else if(result==1)
			{
				req.setAttribute("msg","congrats, account created, try logging in!!");
				RequestDispatcher rd=req.getRequestDispatcher("register.jsp");
				rd.include(req, resp);
			}
		} catch (ClassNotFoundException | SQLException e) 
		{
			req.setAttribute("msg","email id already taken try with another one");
			RequestDispatcher rd=req.getRequestDispatcher("register.jsp");
			rd.include(req, resp);
		}
	}
}
