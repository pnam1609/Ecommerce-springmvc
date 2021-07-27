package se.ptithcm.detai.model;

import java.io.Serializable;
import java.math.BigInteger;
import java.util.List;

public class TaiKhoan implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = -4745545831304540715L;
	private String userName;
	private String passWord;
	private String ho;
	private String ten;
	private String diachi;
	private boolean admin;
	private String sodienthoai;
	
	public boolean isAdmin() {
		return admin;
	}

	public void setAdmin(boolean admin) {
		this.admin = admin;
	}

	private List<DonDatHang> donDatHangs;
	private NhanVien nhanVien;
	private KhachHang khachHang;
	

	public String getUserName() {
		return userName;
	}

	public TaiKhoan() {
		userName = "";
		passWord ="";
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassWord() {
		return passWord;
	}

	public void setPassWord(String passWord) {
		this.passWord = passWord;
	}

	public String getHo() {
		return ho;
	}

	public void setHo(String ho) {
		this.ho = ho;
	}

	public String getTen() {
		return ten;
	}

	public void setTen(String ten) {
		this.ten = ten;
	}

	public String getDiachi() {
		return diachi;
	}

	public void setDiachi(String diachi) {
		this.diachi = diachi;
	}

	public List<DonDatHang> getDonDatHangs() {
		return donDatHangs;
	}

	public void setDonDatHangs(List<DonDatHang> donDatHangs) {
		this.donDatHangs = donDatHangs;
	}

	public NhanVien getNhanVien() {
		return nhanVien;
	}

	public void setNhanVien(NhanVien nhanVien) {
		this.nhanVien = nhanVien;
	}

	public KhachHang getKhachHang() {
		return khachHang;
	}

	public void setKhachHang(KhachHang khachHang) {
		this.khachHang = khachHang;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "TaiKhoan [userName=" + userName + "]";
	}

	public String getSodienthoai() {
		return sodienthoai;
	}

	public void setSodienthoai(String sodienthoai) {
		this.sodienthoai = sodienthoai;
	}

	

	
	
	
}
