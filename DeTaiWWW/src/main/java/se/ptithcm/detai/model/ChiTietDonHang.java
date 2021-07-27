package se.ptithcm.detai.model;

import java.io.Serializable;

public class ChiTietDonHang implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = -3325312829194706579L;
	private long billDetailID;	
	private double price;
	private int quantity;
	
	private DonDatHang donDatHang;
	private SanPham sanPham;
	public ChiTietDonHang() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ChiTietDonHang(long billDetailID, double price, int quantity) {
		super();
		this.billDetailID = billDetailID;
		this.price = price;
		this.quantity = quantity;
	}
	
	public ChiTietDonHang(long billDetailID, double price, int quantity, DonDatHang donDatHang, SanPham sanPham) {
		super();
		this.billDetailID = billDetailID;
		this.price = price;
		this.quantity = quantity;
		this.donDatHang = donDatHang;
		this.sanPham = sanPham;
	}
	public long getBillDetailID() {
		return billDetailID;
	}
	public void setBillDetailID(long billDetailID) {
		this.billDetailID = billDetailID;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public DonDatHang getDonDatHang() {
		return donDatHang;
	}
	public void setDonDatHang(DonDatHang donDatHang) {
		this.donDatHang = donDatHang;
	}
	public SanPham getSanPham() {
		return sanPham;
	}
	public void setSanPham(SanPham sanPham) {
		this.sanPham = sanPham;
	}
	@Override
	public String toString() {
		return "ChiTietDonHang [billDetailID=" + billDetailID + ", sanPham=" + sanPham + "]";
	}
	
	
}
