package bank_dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;

import com.mysql.cj.exceptions.RSAException;

import bank_dto.TransactionsDto;

public class TransactionsDao 
{
	public static Connection createConnection() throws ClassNotFoundException, SQLException
	{
		Class.forName("com.mysql.cj.jdbc.Driver");
		return DriverManager.getConnection("jdbc:mysql://localhost:3306/bank_db?createDatabaseIfNotExist=true&user=root&password=Umesh@123");
	}
	public static void transactions(TransactionsDto transaction) throws SQLException, ClassNotFoundException {
		Connection c=createConnection();
		PreparedStatement ps=c.prepareStatement("create table if not exists transactions(id int auto_increment primary key,sender bigint,reciever bigint,amount int,date varchar(20), time varchar(20))");
		ps.execute();
		ps.close();
		PreparedStatement ps2=c.prepareStatement("insert into transactions(sender,reciever,amount,date,time) value(?,?,?,?,?)");
		ps2.setLong(1, transaction.getSenderAccount());
		ps2.setLong(2, transaction.getRecieverAccount());
		ps2.setInt(3, transaction.getAmount());
		ps2.setString(4, transaction.getDate());
		ps2.setString(5, transaction.getTime());
		ps2.executeUpdate();
		ps2.close();
		c.close();
	}
	public static LinkedList<TransactionsDto> history(long sender) throws SQLException, ClassNotFoundException
	{
		LinkedList<TransactionsDto> tr=new LinkedList<TransactionsDto>();
		Connection c=createConnection();
		PreparedStatement ps1=c.prepareStatement("create table if not exists transactions(id int auto_increment primary key,sender bigint,reciever bigint,amount int,date varchar(20), time varchar(20))");
		ps1.execute();
		ps1.close();
		PreparedStatement ps=c.prepareStatement("select * from transactions where sender=? or reciever=?");
		ps.setLong(1, sender);
		ps.setLong(2, sender);
		ResultSet rs=ps.executeQuery();
		while(rs.next())
		{
			tr.add(new TransactionsDto(rs.getLong("sender"), rs.getLong("reciever"), rs.getInt("amount"), rs.getString("date"), rs.getString("time")));
		}
		c.close();
		return tr;
	}
}
