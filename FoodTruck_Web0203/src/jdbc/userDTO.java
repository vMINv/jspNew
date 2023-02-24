package jdbc;


public class userDTO {
	private String id, per ,password, mail, name;
		
	
	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}


	public String getper() {
		return per;
	}


	public void setper(String per) {
		this.per = per;
	}


	public String getPassword() {
		return password;
	}


	public void setPassword(String password) {
		this.password = password;
	}


	public String getMail() {
		return mail;
	}


	public void setMail(String mail) {
		this.mail = mail;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}

	
	public userDTO(String id, String per, String password, String mail, String name) {
		super();
		this.id = id;
		this.per = per;
		this.password = password;
		this.mail = mail;
		this.name = name;
	}


	public userDTO() {
		
	}
}
