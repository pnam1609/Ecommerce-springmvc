package se.ptithcm.detai.model;

import java.io.Serializable;
import java.util.List;

public class SanPham implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = -1067733711708117858L;
	private String maSP;
	private String tenSP;
	private String moTa;
	private double giaTien;
	private String imageURL;
	
	private DanhMuc danhMuc; 
	private List<ChiTietDonHang> chiTietDonHangs;
	public SanPham() {
		super();
		// TODO Auto-generated constructor stub
	}
	public SanPham(String maSP, String tenSP, String moTa, double giaTien, String imageURL) {
		super();
		this.maSP = maSP;
		this.tenSP = tenSP;
		this.moTa = moTa;
		this.giaTien = giaTien;
		this.imageURL = imageURL;
	}
	
	public SanPham(String maSP, String tenSP, String moTa, double giaTien, String imageURL, DanhMuc danhMuc) {
		super();
		this.maSP = maSP;
		this.tenSP = tenSP;
		this.moTa = moTa;
		this.giaTien = giaTien;
		this.imageURL = imageURL;
		this.danhMuc = danhMuc;
	}
	
	public SanPham(String maSP, String tenSP, double giaTien) {
		super();
		this.maSP = maSP;
		this.tenSP = tenSP;
		this.giaTien = giaTien;
	}
	public SanPham(String maSP) {
		super();
		this.maSP = maSP;
	}
	public String getMaSP() {
		return maSP;
	}
	public void setMaSP(String maSP) {
		this.maSP = maSP;
	}
	public String getTenSP() {
		return tenSP;
	}
	public void setTenSP(String tenSP) {
		this.tenSP = tenSP;
	}
	public String getMoTa() {
		return moTa;
	}
	public void setMoTa(String moTa) {
		this.moTa = moTa;
	}
	public double getGiaTien() {
		return giaTien;
	}
	public void setGiaTien(double giaTien) {
		this.giaTien = giaTien;
	}
	public String getImageURL() {
		return imageURL;
	}
	public void setImageURL(String imageURL) {
		this.imageURL = imageURL;
	}	
	public List<ChiTietDonHang> getChiTietDonHangs() {
		return chiTietDonHangs;
	}
	public void setChiTietDonHangs(List<ChiTietDonHang> chiTietDonHangs) {
		this.chiTietDonHangs = chiTietDonHangs;
	}	
	public DanhMuc getDanhMuc() {
		return danhMuc;
	}
	public void setDanhMuc(DanhMuc danhMuc) {
		this.danhMuc = danhMuc;
	}
	@Override
	public String toString() {
		return "SanPham [maSP=" + maSP + "]";
	}
	
	
}
