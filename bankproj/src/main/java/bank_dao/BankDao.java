package bank_dao;

import java.security.PublicKey;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import com.mysql.cj.protocol.Resultset;

import bank_dto.Bank;

public class BankDao {
	public static void createtable() throws Exception
	{
		Connection con=CreationofStatement();
		Statement s=con.createStatement();
		s.execute("Create TABLE IF NOT EXISTS bank_details ( account_number BIGINT PRIMARY KEY , phone_number BIGINT,account_type VARCHAR(50),address VARCHAR(45),aadhar_number BIGINT unique,balance INT,ifsc_code varchar(50))");
	}
	public static Connection CreationofStatement() throws Exception {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bank_db?createDatabaseIfNotExist=true", "root", "Umesh@123");
		return con;
	}
	public static int savedetails(Bank bank) throws Exception
	{
		Connection con=CreationofStatement();
		createtable();
		PreparedStatement ps=con.prepareStatement("insert into bank_details values(?,?,?,?,?,?,?)");
		ps.setLong(1, bank.getAccountnumber());
		ps.setLong(2, bank.getPhonenumber());
		ps.setString(3, bank.getAccounttype());
		ps.setString(4, bank.getAddress());
		ps.setLong(5, bank.getAadharnumber());
		ps.setInt(6, bank.getBalance());
		ps.setString(7, bank.getIfsccode());
		int result= ps.executeUpdate();
		ps.close();
		con.close();
		return result;
	}
	public static Bank getBank(long mobile) throws Exception
	{
		createtable();
		Connection con=CreationofStatement();
		PreparedStatement ps=con.prepareStatement("select * from bank_details where phone_number=?");
		ps.setLong(1, mobile);
		ResultSet rs=ps.executeQuery();
		Bank bank=null;
		while(rs.next())
		{
			bank=new Bank(rs.getLong("account_number"), rs.getLong("phone_number"), rs.getString("account_type"), rs.getString("address"), rs.getLong("aadhar_number"), rs.getInt("balance"), rs.getString("ifsc_code"));
		}
		ps.close();
		con.close();
		return bank;
	}
	public static int transaction(int amount,long sender,long reciever,String ifsc)throws Exception
	{
		Connection con=CreationofStatement();
		PreparedStatement ps=con.prepareStatement("update bank_details set balance=balance+? where account_number=? and ifsc_code=?");
		ps.setInt(1, amount);
		ps.setLong(2, reciever);
		ps.setString(3, ifsc);
		int result=ps.executeUpdate();
		if(result>0)
		{
			PreparedStatement ps2=con.prepareStatement("update bank_details set balance=balance-? where account_number=?");
			ps2.setInt(1, amount);
			ps2.setLong(2, sender);
			result=ps2.executeUpdate();
			ps2.close();
		}
		else 
		{
			result=-1;
		}
		ps.close();
		con.close();
		return result;
	}
	public static void updateMobile(long mobile,long account) throws Exception{
		Connection con=CreationofStatement();
		PreparedStatement ps=con.prepareStatement("update bank_details set phone_number=? where account_number=?");
		ps.setLong(1, mobile);
		ps.setLong(2, account);
		ps.execute();
		ps.close();
		con.close();
	}
}

