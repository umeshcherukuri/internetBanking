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

import bank_dao.UserDao;
import bank_dto.User;
@WebServlet("/delete")
public class Delete extends HttpServlet
{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		try 
		{
			HttpSession session=req.getSession();
			String email=((User)session.getAttribute("user")).getEmail();
			int result=UserDao.deleteUser( req.getParameter("email"), req.getParameter("password"));
			if(result>0 && req.getParameter("email").equals(email))
			{
				Thread.sleep(2000);
				RequestDispatcher rd=req.getRequestDispatcher("index.jsp");
				rd.forward(req, resp);
			}
			else 
			{
				req.setAttribute("msg", "invalid credentials try again!!!");
				RequestDispatcher rd=req.getRequestDispatcher("Delete.jsp");
				rd.include(req, resp);
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
