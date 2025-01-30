package bank_project;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bank_dao.BankDao;
import bank_dao.TransactionsDao;
import bank_dao.UserDao;
import bank_dto.Bank;
import bank_dto.TransactionsDto;
@WebServlet("/transfer")
public class Transaction extends HttpServlet
{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		HttpSession session=req.getSession();
		int amount=((Bank)session.getAttribute("bank")).getBalance();
		long accountNumber =((Bank)session.getAttribute("bank")).getAccountnumber();
		long recieverNumber=Long.parseLong((String)req.getParameter("anotherAccountNumber"));
		String ifsc=req.getParameter("ifsc");
		String date=req.getParameter("date");
		String time=req.getParameter("time");
		int transerAmount=Integer.parseInt(req.getParameter("amount"));
		if(amount<transerAmount)
		{
			req.setAttribute("msg", "insufficient funds!!!");
			RequestDispatcher rd=req.getRequestDispatcher("transactionsuccessful.jsp");
			rd.include(req, resp);
		}
		else 
		{
			try 
			{
				int result= BankDao.transaction(transerAmount,accountNumber,recieverNumber,ifsc);
				if(result>0)
				{
					Thread.sleep(2000);
					TransactionsDao.transactions(new TransactionsDto(accountNumber, recieverNumber, transerAmount, date, time));
					Bank bank=(Bank)session.getAttribute("bank");
					bank.setBalance(bank.getBalance()-transerAmount);
					session.setAttribute("bank", bank);
					RequestDispatcher rd=req.getRequestDispatcher("Home.jsp");
					rd.forward(req, resp);
				}
				else if(result==-1)
				{
					req.setAttribute("msg", "invalid reciever details");
					RequestDispatcher rd=req.getRequestDispatcher("Transaction.jsp");
					rd.include(req, resp);
				}
			} 
			catch (Exception e) 
			{
				e.printStackTrace();
			}
		}
	}
}
