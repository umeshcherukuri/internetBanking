package bank_dto;

public class User 
{
	private String name;
	private long mobile;
	private String email;
	private int age;
	private String password;
	public User(String name, long mobile, String email, int age, String password) {
		this.name = name;
		this.mobile = mobile;
		this.email = email;
		this.age = age;
		this.password = password;
	}
	public User() {
		super();
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public long getMobile() {
		return mobile;
	}
	public void setMobile(long mobile) {
		this.mobile = mobile;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	@Override
	public String toString() {
		return "User [name=" + name + ", mobile=" + mobile + ", email=" + email + ", age=" + age + ", password="
				+ password + "]";
	}
	
}
