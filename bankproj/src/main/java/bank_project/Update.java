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
import bank_dto.User;

@WebServlet("/update")
public class Update extends HttpServlet
{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		HttpSession session=req.getSession();
		Bank bank=(Bank)session.getAttribute("bank");
		String email =((User)session.getAttribute("user")).getEmail();
		User user=new User(req.getParameter("name"), Long.parseLong(req.getParameter("mobile")), email, Integer.parseInt(req.getParameter("age")), req.getParameter("password"));
		try {
			int result = UserDao.updateUser(user);
			if(result>0)
			{
				session.setAttribute("user", user);
				if(bank!=null)
				{
					BankDao.updateMobile(user.getMobile(),bank.getAccountnumber());
				}
				Thread.sleep(2000);
				RequestDispatcher rd=req.getRequestDispatcher("Home.jsp");
				rd.forward(req, resp);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
