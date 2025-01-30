package bank_project;

import java.io.IOException;
import java.util.HashMap;
import java.util.Random;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bank_dao.BankDao;
import bank_dto.Bank;
import bank_dto.User;
@WebServlet("/bankaccount")
public class CreateAccount extends HttpServlet
{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Random r=new Random();
		HashMap<String, String> ifsc=new HashMap<String, String>();
		ifsc.put("Kukatpally", "KUKA1234");
		ifsc.put("Gatchibowli", "GATC3423");
		ifsc.put("Secundrabad", "SECU2358");
		ifsc.put("Ameerpet", "AMEE0324");
		ifsc.put("Nijampet", "NIJA8935");
		Long accountno=r.nextLong(111111111111l, 999999999999l);
		HttpSession session=req.getSession();
		System.out.println(session.getAttribute("user").toString());
	    Long phone=((User)session.getAttribute("user")).getMobile();
		String accounttype=req.getParameter("type");
		String address=req.getParameter("address");
		Long Aadharnumber=Long.parseLong(req.getParameter("aadhar"));
		int balance=Integer.parseInt(req.getParameter("balance"));
		String branch =req.getParameter("branch");
		String ifsccode=ifsc.get(branch);
		try 
		{
			int result= BankDao.savedetails(new Bank(accountno,phone,accounttype,address,Aadharnumber,balance,ifsccode));
			if(result>0)
			{
				session.setAttribute("bank", new Bank(accountno,phone,accounttype,address,Aadharnumber,balance,ifsccode));
			}
			session.setAttribute("status", "created");
			Thread.sleep(2000);
			RequestDispatcher rd=req.getRequestDispatcher("Home.jsp");
			rd.forward(req, resp);
		} catch (Exception e) 
		{
			req.setAttribute("msg", "account with given aadhar number already exists");
			RequestDispatcher rd=req.getRequestDispatcher("bankaccount.jsp");
			rd.include(req, resp);
		}
	}
}

