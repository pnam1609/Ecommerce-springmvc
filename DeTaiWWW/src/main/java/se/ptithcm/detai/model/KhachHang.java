package se.ptithcm.detai.model;

import java.io.Serializable;

public class KhachHang implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 5457186341507874277L;
	private long maKH;
	private String tenKH;
	private String soDienThoai;
	private TaiKhoan email;
	private String diaChi;
	
	public KhachHang() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public KhachHang(long maKH, String tenKH, String soDienThoai, String diaChi) {
		super();
		this.maKH = maKH;
		this.tenKH = tenKH;
		this.soDienThoai = soDienThoai;
		this.diaChi = diaChi;
	}
	
	public KhachHang(long maKH, String tenKH, String soDienThoai, TaiKhoan email, String diaChi) {
		super();
		this.maKH = maKH;
		this.tenKH = tenKH;
		this.soDienThoai = soDienThoai;
		this.email = email;
		this.diaChi = diaChi;
	}

	public KhachHang(long maKH) {
		super();
		this.maKH = maKH;
	}
	
	public KhachHang(long maKH, String soDienThoai) {
		super();
		this.maKH = maKH;
		this.soDienThoai = soDienThoai;
	}

	public long getMaKH() {
		return maKH;
	}
	public void setMaKH(long maKH) {
		this.maKH = maKH;
	}
	public String getTenKH() {
		return tenKH;
	}
	public void setTenKH(String tenKH) {
		this.tenKH = tenKH;
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
		return "KhachHang [maKH=" + maKH + ", tenKH=" + tenKH + ", soDienThoai=" + soDienThoai + ", email=" + email
				+ ", diaChi=" + diaChi + "]";
	}
}
