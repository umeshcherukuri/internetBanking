1package bank_project;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bank_dao.TransactionsDao;
import bank_dto.Bank;
@WebServlet("/history")
public class History extends HttpServlet
{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session=req.getSession();
		long sender= ((Bank)session.getAttribute("bank")).getAccountnumber();
		try 
		{
			session.setAttribute("transactions", TransactionsDao.history(sender));
			RequestDispatcher rd=req.getRequestDispatcher("history.jsp");
			rd.forward(req, resp);
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
