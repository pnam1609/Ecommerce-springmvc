package se.ptithcm.detai.model;

import java.io.Serializable;

public class NhanVien implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 9116630461413756433L;
	private long maNV;
	private String tenNV;
	private String soDienThoai;
	private TaiKhoan email;
	private String diaChi;
	public NhanVien() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public NhanVien(long maNV, String tenNV, String soDienThoai, String diaChi) {
		super();
		this.maNV = maNV;
		this.tenNV = tenNV;
		this.soDienThoai = soDienThoai;
		this.diaChi = diaChi;
	}

	public long getMaNV() {
		return maNV;
	}

	public void setMaNV(long maNV) {
		this.maNV = maNV;
	}

	public String getTenNV() {
		return tenNV;
	}

	public void setTenNV(String tenNV) {
		this.tenNV = tenNV;
	}

	public String getSoDienThoai() {
		return soDienThoai;
	}
	public void setSoDienThoai(String soDienThoai) {
		this.soDienThoai = soDienThoai;
	}
	public TaiKhoan getEmail() {
		return email;
	}
	public void setEmail(TaiKhoan email) {
		this.email = email;
	}

	public String getDiaChi() {
		return diaChi;
	}

	public void setDiaChi(String diaChi) {
		this.diaChi = diaChi;
	}

	@Override
	public String toString() {
		return "NhanVien [maNV=" + maNV + ", tenNV=" + tenNV + ", soDienThoai=" + soDienThoai + ", email=" + email
				+ ", diaChi=" + diaChi + "]";
	}
	
}
