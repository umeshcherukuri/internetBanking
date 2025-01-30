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
@WebServlet("/forgot")
public class Forgot extends HttpServlet
{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		String email=req.getParameter("email");
		String password=req.getParameter("password");
		try {
			int result= UserDao.forgotPassword(email,password);
			if(result==0)
			{
				req.setAttribute("msg", "give correct email!!!");
				RequestDispatcher rd = req.getRequestDispatcher("forgotpassword.jsp");
				rd.include(req, resp);
			}
			else 
			{
				req.setAttribute("msg", "password update succesfully, login now!");
				RequestDispatcher rd = req.getRequestDispatcher("forgotpassword.jsp");
				rd.include(req, resp);
				Thread.sleep(2000);
				RequestDispatcher rd2=req.getRequestDispatcher("index.jsp");
				rd2.forward(req, resp);
			}
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}

