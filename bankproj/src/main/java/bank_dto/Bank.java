package bank_dto;

public class Bank {
	private  long accountnumber;
	private long phonenumber;
	private String address;
	private long Aadharnumber;
	private int balance;
	private String Accounttype;
	private String ifsccode;
	public Bank(long accountnumber, long phonenumber,String Accounttype, String address, long aadharnumber, int balance,String ifsccode) {
		super();
		this.accountnumber = accountnumber;
		this.phonenumber = phonenumber;
		this.Accounttype=Accounttype;
		this.address = address;
		Aadharnumber = aadharnumber;
		this.balance = balance;
		this.ifsccode=ifsccode;
	}
	
	
	public Bank() {
		super();
	}


	public String getIfsccode() {
		return ifsccode;
	}


	public void setIfsccode(String ifsccode) {
		this.ifsccode = ifsccode;
	}


	public String getAccounttype() {
		return Accounttype;
	}

	public void setAccounttype(String accounttype) {
		Accounttype = accounttype;
	}

	public long getAccountnumber() {
		return accountnumber;
	}
	public void setAccountnumber(long accountnumber) {
		this.accountnumber = accountnumber;
	}
	public Long getPhonenumber() {
		return phonenumber;
	}
	public void setPhonenumber(Long phonenumber) {
		this.phonenumber = phonenumber;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public long getAadharnumber() {
		return Aadharnumber;
	}
	public void setAadharnumber(long aadharnumber) {
		Aadharnumber = aadharnumber;
	}
	public int getBalance() {
		return balance;
	}
	public void setBalance(int balance) {
		this.balance = balance;
	}
	@Override
	public String toString() {
		return "Bank [accountnumber=" + accountnumber + ", phonenumber=" + phonenumber + ", address=" + address
				+ ", Aadharnumber=" + Aadharnumber + ", balence=" + balance + "]";
	}
	
}
