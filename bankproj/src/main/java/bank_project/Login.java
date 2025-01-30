package bank_project;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bank_dao.BankDao;
import bank_dao.UserDao;
import bank_dto.Bank;

@WebServlet("/login")
public class Login extends HttpServlet
{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		try 
		{
			String email=req.getParameter("email");
			int result= UserDao.login(email, req.getParameter("password"));
			if(result==0)
			{
				req.setAttribute("msg", "email does not exist!!");
				RequestDispatcher same=req.getRequestDispatcher("index.jsp");
				same.include(req, resp);
			}
			else if(result==-1)
			{
				req.setAttribute("msg", "password incorrect!!");
				RequestDispatcher same=req.getRequestDispatcher("index.jsp");
				same.include(req, resp);
			}
			else if(result==1)
			{
				HttpSession session=req.getSession();
				session.setAttribute("user", UserDao.getUser(email));
				Long mobile=UserDao.getUser(email).getMobile();
				if(BankDao.getBank(mobile)!=null)
				{
					session.setAttribute("status", "created");
				}
				else {
					session.setAttribute("status", "no");
				}
				if(BankDao.getBank(mobile)==null)
				{
					session.setAttribute("bank",new Bank());
				}
				else {
					session.setAttribute("bank", BankDao.getBank(mobile));
				}
				RequestDispatcher home=req.getRequestDispatcher("Home.jsp");
				home.forward(req, resp);
			}
		} catch (ClassNotFoundException | SQLException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
