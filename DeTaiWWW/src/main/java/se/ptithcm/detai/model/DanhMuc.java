package se.ptithcm.detai.model;

import java.io.Serializable;
import java.util.List;

public class DanhMuc implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String maDM;
	private String tenDM;
	
	private List<SanPham> sanPhams;
	public DanhMuc() {
		super();
		// TODO Auto-generated constructor stub
	}
	public DanhMuc(String maDM, String tenDM) {
		super();
		this.maDM = maDM;
		this.tenDM = tenDM;
	}
	
	public DanhMuc(String maDM) {
		super();
		this.maDM = maDM;
	}
	public String getMaDM() {
		return maDM;
	}
	public void setMaDM(String maDM) {
		this.maDM = maDM;
	}
	public String getTenDM() {
		return tenDM;
	}
	public void setTenDM(String tenDM) {
		this.tenDM = tenDM;
	}
	public List<SanPham> getSanPhams() {
		return sanPhams;
	}
	public void setSanPhams(List<SanPham> sanPhams) {
		this.sanPhams = sanPhams;
	}
	@Override
	public String toString() {
		return "DanhMuc [maDM=" + maDM + "]";
	}
	
	
	
}
