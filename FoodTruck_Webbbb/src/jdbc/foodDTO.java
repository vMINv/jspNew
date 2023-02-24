package jdbc;

public class foodDTO {
	private String fno, id, fname, fphoto, flocation, ftime, fmenu, fprice, fpro, flat, flon;
	

	public foodDTO(String fno, String id, String fname, String fphoto, String flocation, String ftime, String fmenu,
			String fprice, String fpro, String flat, String flon) {
		super();
		this.fno = fno;
		this.id = id;
		this.fname = fname;
		this.fphoto = fphoto;
		this.flocation = flocation;
		this.ftime = ftime;
		this.fmenu = fmenu;
		this.fprice = fprice;
		this.fpro = fpro;
		this.flat = flat;
		this.flon = flon;
	}


	public String getFno() {
		return fno;
	}


	public void setFno(String fno) {
		this.fno = fno;
	}


	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}


	public String getFname() {
		return fname;
	}


	public void setFname(String fname) {
		this.fname = fname;
	}


	public String getFphoto() {
		return fphoto;
	}


	public void setFphoto(String fphoto) {
		this.fphoto = fphoto;
	}


	public String getFlocation() {
		return flocation;
	}


	public void setFlocation(String flocation) {
		this.flocation = flocation;
	}


	public String getFtime() {
		return ftime;
	}


	public void setFtime(String ftime) {
		this.ftime = ftime;
	}


	public String getFmenu() {
		return fmenu;
	}


	public void setFmenu(String fmenu) {
		this.fmenu = fmenu;
	}


	public String getFprice() {
		return fprice;
	}


	public void setFprice(String fprice) {
		this.fprice = fprice;
	}


	public String getFpro() {
		return fpro;
	}


	public void setFpro(String fpro) {
		this.fpro = fpro;
	}


	public String getFlat() {
		return flat;
	}


	public void setFlat(String flat) {
		this.flat = flat;
	}


	public String getFlon() {
		return flon;
	}


	public void setFlon(String flon) {
		this.flon = flon;
	}


	public foodDTO() {
		
	}
	
	
	
}
