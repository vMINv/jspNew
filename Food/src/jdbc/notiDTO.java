package jdbc;

public class notiDTO {
	private String nno, ntitle, ncontent, nregtime, nupdatetime;

	public String getNno() {
		return nno;
	}

	public void setNno(String nno) {
		this.nno = nno;
	}

	public String getNtitle() {
		return ntitle;
	}

	public void setNtitle(String ntitle) {
		this.ntitle = ntitle;
	}

	public String getNcontent() {
		return ncontent;
	}

	public void setNcontent(String ncontent) {
		this.ncontent = ncontent;
	}

	public String getNregtime() {
		return nregtime;
	}

	public void setNregtime(String nregtime) {
		this.nregtime = nregtime;
	}

	public String getNupdatetime() {
		return nupdatetime;
	}

	public void setNupdatetime(String nupdatetime) {
		this.nupdatetime = nupdatetime;
	}

	public notiDTO(String nno, String ntitle, String ncontent, String nregtime, String nupdatetime) {
		super();
		this.nno = nno;
		this.ntitle = ntitle;
		this.ncontent = ncontent;
		this.nregtime = nregtime;
		this.nupdatetime = nupdatetime;
	}
	
	public notiDTO() {
	}
}
