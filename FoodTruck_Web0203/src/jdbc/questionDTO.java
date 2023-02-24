package jdbc;

public class questionDTO {
	private String qno, id, qtitle, mail, qcon, qpro;

	public String getQno() {
		return qno;
	}

	public void setQno(String qno) {
		this.qno = qno;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getQtitle() {
		return qtitle;
	}

	public void setQtitle(String qtitle) {
		this.qtitle = qtitle;
	}

	public String getMail() {
		return mail;
	}

	public void setMail(String mail) {
		this.mail = mail;
	}

	public String getQcon() {
		return qcon;
	}

	public void setQcon(String qcon) {
		this.qcon = qcon;
	}

	public String getQpro() {
		return qpro;
	}

	public void setQpro(String qpro) {
		this.qpro = qpro;
	}

	public questionDTO(String qno, String id, String qtitle, String mail, String qcon, String qpro) {
		this.qno = qno;
		this.id = id;
		this.qtitle = qtitle;
		this.mail = mail;
		this.qcon = qcon;
		this.qpro = qpro;
	}

	public questionDTO() {
		
	}
}
