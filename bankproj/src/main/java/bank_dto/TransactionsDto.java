package bank_dto;

public class TransactionsDto 
{
	private long senderAccount;
	private long recieverAccount;
	private int amount;
	private String date;
	private String time;
	public TransactionsDto(long senderAccount, long recieverAccount, int amount, String date,String time) 
	{
		this.senderAccount = senderAccount;
		this.recieverAccount = recieverAccount;
		this.amount = amount;
		this.date = date;
		this.time = time;
	}
	@Override
	public String toString() {
		return "TransactionsDto [senderAccount=" + senderAccount + ", recieverAccount=" + recieverAccount + ", amount="
				+ amount +  ", date=" + date + ", time=" + time + "]";
	}
	public long getSenderAccount() {
		return senderAccount;
	}
	public void setSenderAccount(long senderAccount) {
		this.senderAccount = senderAccount;
	}
	public long getRecieverAccount() {
		return recieverAccount;
	}
	public void setRecieverAccount(long recieverAccount) {
		this.recieverAccount = recieverAccount;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	
}
