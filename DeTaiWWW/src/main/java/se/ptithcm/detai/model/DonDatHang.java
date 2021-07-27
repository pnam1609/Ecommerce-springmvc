package se.ptithcm.detai.model;

import java.io.Serializable;
import java.sql.Date;
import java.util.List;

public class DonDatHang implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 4420986343538841936L;
	private long billID;
	private Date date;
	private String payment;
	private String address;
	private double total;
	
	private List<ChiTietDonHang> chiTietDonHangs;
	private TaiKhoan taiKhoan;
	public DonDatHang() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public DonDatHang(long billID) {
		super();
		this.billID = billID;
	}
	
	public DonDatHang(long billID, Date date, String payment, String address, double total, TaiKhoan taiKhoan) {
		super();
		this.billID = billID;
		this.date = date;
		this.payment = payment;
		this.address = address;
		this.total = total;
		this.taiKhoan = taiKhoan;
	}
	
	public long getBillID() {
		return billID;
	}
	public void setBillID(long billID) {
		this.billID = billID;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public String getPayment() {
		return payment;
	}
	public void setPayment(String payment) {
		this.payment = payment;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public double getTotal() {
		return total;
	}
	public void setTotal(double total) {
		this.total = total;
	}
	public TaiKhoan getTaiKhoan() {
		return taiKhoan;
	}
	public void setTaiKhoan(TaiKhoan taiKhoan) {
		this.taiKhoan = taiKhoan;
	}
	public List<ChiTietDonHang> getChiTietDonHangs() {
		return chiTietDonHangs;
	}
	public void setChiTietDonHangs(List<ChiTietDonHang> chiTietDonHangs) {
		this.chiTietDonHangs = chiTietDonHangs;
	}

	@Override
	public String toString() {
		return "DonDatHang [billID=" + billID + "]";
	}
	
	
}
