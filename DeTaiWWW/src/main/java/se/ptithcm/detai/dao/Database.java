package se.ptithcm.detai.dao;

import java.net.PasswordAuthentication;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Properties;
import java.util.logging.Logger;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import se.ptithcm.detai.model.CartItemBean;
import se.ptithcm.detai.model.ChiTietDonHang;
import se.ptithcm.detai.model.DanhMuc;
import se.ptithcm.detai.model.DonDatHang;
import se.ptithcm.detai.model.KhachHang;
import se.ptithcm.detai.model.SanPham;
import se.ptithcm.detai.model.TaiKhoan;

public class Database {
	JdbcTemplate template;

	public JdbcTemplate getTemplate() {
		return template;
	}

	public void setTemplate(JdbcTemplate template) {
		this.template = template;
	}

	public List<SanPham> getDSSP() {
		return template.query("select * from SanPham", new RowMapper<SanPham>() {

			@Override
			public SanPham mapRow(ResultSet rs, int rowNum) throws SQLException {
				SanPham sp = new SanPham();
				sp.setMaSP(rs.getString(1));
				sp.setTenSP(rs.getString(2));
				sp.setMoTa(rs.getString(3));
				sp.setGiaTien(rs.getDouble(4));
				sp.setImageURL(rs.getString(5));
				return sp;
			}
		});
	}

	public int addDonDatHang(DonDatHang ddh) {
		long millis = System.currentTimeMillis();
		long ID = new Date(millis).getTime();
		Date ngayDH = new Date(System.currentTimeMillis());
		ddh.setBillID(ID);
		ddh.setDate(ngayDH);
		String sql = "insert into DonDatHang(billID,date,payment,address,total,userName) values ('" + ddh.getBillID()
				+ "','" + ddh.getDate() + "','" + ddh.getPayment() + "','" + ddh.getAddress() + "','" + ddh.getTotal()
				+ "','" + ddh.getTaiKhoan().getUserName() + "')";
		return template.update(sql);
	}

	public int addChiTietDonHang(ChiTietDonHang ctdh, CartItemBean c) {
		String sql = "insert into ChiTietDonHang(billDetailID,price,quantity,billID,maSP) values ('"
				+ ctdh.getBillDetailID() + "','" + c.getUnitCost() + "','" + c.getQuantity() + "','"
				+ ctdh.getDonDatHang().getBillID() + "','" + ctdh.getSanPham().getMaSP() + "')";
		return template.update(sql);
	}

	public Boolean checkTK(String username) {
		String sql = "select * from TaiKhoan where userName=?";
		return template.queryForObject(sql, new Object[] { username }, new RowMapper<Boolean>() {

			@Override
			public Boolean mapRow(ResultSet rs, int rowNum) throws SQLException {
				TaiKhoan tk = new TaiKhoan();
				tk.setUserName(rs.getString("userName"));
				return null;
			}
		});
	}

//	public List<TaiKhoan> getListTaiKhoan(){
//		String sql = "select * from TaiKhoan";
//		return template.query(sql, new RowMapper<TaiKhoan>() {
//
//			@Override
//			public TaiKhoan mapRow(ResultSet rs, int rowNum) throws SQLException {
//				TaiKhoan tk = new TaiKhoan();
//				tk.setUserName(rs.getString(1));
//				tk.setPassWord(rs.getString(2));
//				tk.setHo(rs.getString(3));
//				tk.setTen(rs.getString(4));
//				tk.setDiachi(rs.getString(5));
//				
//				return tk;
//			}
//		});
//	}
//	
//	public TaiKhoan login(String userName, String passWord) {
//		
//		List<TaiKhoan> dstk = getListTaiKhoan();
//		for (TaiKhoan a : dstk) {
//			if(a.getUserName().equals(userName) && a.getPassWord().equals(passWord)) {
//				return a;
//			}
//		}
//		return null;
//	}

	public TaiKhoan login(String userName, String passWord) {
		try {
			String sql = "select * from TaiKhoan where userName=? and passWord=?";
			return template.queryForObject(sql, new Object[] { userName, passWord }, new RowMapper<TaiKhoan>() {

				@Override
				public TaiKhoan mapRow(ResultSet rs, int rowNum) throws SQLException {
					TaiKhoan tk = new TaiKhoan();
					tk.setUserName(rs.getString("userName"));
					tk.setPassWord(rs.getString("passWord"));
					tk.setAdmin(rs.getBoolean(6));
					return tk;
				}
			});
		} catch (EmptyResultDataAccessException e) {
			return null;
		}
	}

	public boolean addTaiKhoan(TaiKhoan tk) {
		boolean admin = false;
		String sql = "insert into TaiKhoan(userName,passWord,ho,ten,diachi,admin,sodienthoai) values ('"
				+ tk.getUserName() + "','" + tk.getPassWord() + "','" + tk.getHo() + "','" + tk.getTen() + "','"
				+ tk.getDiachi() + "','" + admin + "','" + tk.getSodienthoai() + "')";
		int result = template.update(sql);
		return result > 0;
	}

	public List<DanhMuc> getListCategory() {
		return template.query("select * from DanhMuc", new RowMapper<DanhMuc>() {

			@Override
			public DanhMuc mapRow(ResultSet rs, int rowNum) throws SQLException {
				DanhMuc dm = new DanhMuc();
				dm.setMaDM(rs.getString(1));
				dm.setTenDM(rs.getString(2));
				return dm;
			}
		});
	}

	public List<SanPham> getListSanPhamByDanhMuc(String maDM) {
		return template.query("select * from SanPham WHERE maDM = '" + maDM + "'", new RowMapper<SanPham>() {

			@Override
			public SanPham mapRow(ResultSet rs, int rowNum) throws SQLException {
				SanPham sp = new SanPham();
				sp.setMaSP(rs.getString(1));
				sp.setTenSP(rs.getString(2));
				sp.setMoTa(rs.getString(3));
				sp.setGiaTien(rs.getDouble(4));
				sp.setImageURL(rs.getString(5));
				return sp;
			}
		});
	}

	public DanhMuc getDanhMuc(String maDM) {
		String sql = "SELECT * FROM DanhMuc WHERE maDM = ?";

		return template.queryForObject(sql, new Object[] { maDM }, new RowMapper<DanhMuc>() {

			@Override
			public DanhMuc mapRow(ResultSet rs, int rowNum) throws SQLException {
				DanhMuc dm = new DanhMuc();
				dm.setMaDM(rs.getString("maDM"));
				dm.setTenDM(rs.getString("tenDM"));
				return dm;
			}
		});
	}

	public SanPham getSanPham(String maSP) {
		String sql = "SELECT * FROM SanPham s WHERE s.maSP = ?";

		return template.queryForObject(sql, new Object[] { maSP }, new RowMapper<SanPham>() {

			@Override
			public SanPham mapRow(ResultSet rs, int rowNum) throws SQLException {
				SanPham sp = new SanPham();
				sp.setMaSP(rs.getString(1));
				sp.setTenSP(rs.getString(2));
				sp.setMoTa(rs.getString(3));
				sp.setGiaTien(rs.getDouble(4));
				sp.setImageURL(rs.getString(5));
				return sp;
			}
		});
	}

	public static void sendMail(String recepient) throws MessagingException {
		Properties properties = new Properties();

		properties.put("mail.smtp.auth", "true");
		properties.put("mail.smtp.starttls.enable", "true");
		properties.put("mail.smtp.host", "smtp.gmail.com");
		properties.put("mail.smtp.port", "587");

		final String myAccountEmail = "pnam16091999@gmail.com";
		final String password = "16lucifer09";

		Session session = Session.getInstance(properties, new Authenticator() {
			@Override
			protected javax.mail.PasswordAuthentication getPasswordAuthentication() {
				// TODO Auto-generated method stub
				return new javax.mail.PasswordAuthentication(myAccountEmail, password);
			}
		});

		Message message = prepareMessage(session, myAccountEmail, recepient);
		Transport.send(message);
	}

	private static Message prepareMessage(Session session, String myAccountEmail, String recepient) {
		try {
			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress(myAccountEmail));
			message.setRecipient(Message.RecipientType.TO, new InternetAddress(recepient));
			message.setSubject("Dang ky tai khoan website ban thiet bi an ninh truc tuyen");
			message.setText("Dang ky tai khoan thanh cong");
			return message;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public static void sendMail1(String recepient, ChiTietDonHang ctdh) throws MessagingException {
		Properties properties = new Properties();

		properties.put("mail.smtp.auth", "true");
		properties.put("mail.smtp.starttls.enable", "true");
		properties.put("mail.smtp.host", "smtp.gmail.com");
		properties.put("mail.smtp.port", "587");

		final String myAccountEmail = "pnam16091999@gmail.com";
		final String password = "16lucifer09";

		Session session = Session.getInstance(properties, new Authenticator() {
			@Override
			protected javax.mail.PasswordAuthentication getPasswordAuthentication() {
				// TODO Auto-generated method stub
				return new javax.mail.PasswordAuthentication(myAccountEmail, password);
			}
		});

		Message message = prepareMessage1(session, myAccountEmail, recepient, ctdh);
		Transport.send(message);
	}

	private static Message prepareMessage1(Session session, String myAccountEmail, String recepient,
			ChiTietDonHang ctdh) {
		try {
			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress(myAccountEmail));
			message.setRecipient(Message.RecipientType.TO, new InternetAddress(recepient));
			message.setSubject("Dat hang thanh cong");
			message.setText("Dat hang thanh cong\nChi Tiết đơn hàng:\nMã đơn hàng: " + ctdh.getBillDetailID()
					+ "\nTên sản phẩm: " + ctdh.getSanPham() + "+\nGia" + ctdh.getPrice());
			return message;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	// quản lý sản phẩm

	// lấy danh sách sản phẩm

	public List<SanPham> getListSanPham() {
		return template.query("select * from SanPham", new RowMapper<SanPham>() {

			@Override
			public SanPham mapRow(ResultSet rs, int rowNum) throws SQLException {
				SanPham sp = new SanPham();
				DanhMuc dm = new DanhMuc();
				sp.setMaSP(rs.getString("maSP"));
				sp.setTenSP(rs.getString("tenSP"));
				sp.setMoTa(rs.getString("moTa"));
				sp.setGiaTien(rs.getDouble("giaTien"));
				sp.setImageURL(rs.getString("imageURL"));
				dm.setMaDM(rs.getString("maDM"));
				sp.setDanhMuc(dm);
				return sp;
			}
		});
	}

	// thêm sản phẩm
	public int addSanPham(SanPham sp) {
		String sql = "insert into SanPham(maSP,tenSP,moTa,giaTien,imageURL,maDM) values ('" + sp.getMaSP() + "',N'"
				+ sp.getTenSP() + "',N'" + sp.getMoTa() + "','" + sp.getGiaTien() + "','" + sp.getImageURL() + "','"
				+ sp.getDanhMuc().getMaDM() + "')";
		return template.update(sql);
	}

	// xóa sản phẩm
	public int deleteSanPham(String maSP) {
		String sql = "delete from SanPham where maSP='" + maSP + "'";
		return template.update(sql);
	}

	// sửa sản phẩm
	public int updateSanPham(SanPham sp) {
		String sql = "update SanPham set tenSP=N'" + sp.getTenSP() + "',giaTien=" + sp.getGiaTien() + " where maSP='"
				+ sp.getMaSP() + "'";
		return template.update(sql);
	}

	// lấy sản phẩm bằng mã sản phẩm
	public SanPham getSPByMaSP(String maSP) {
		String sql = "select * from SanPham where maSP=?";
		return template.queryForObject(sql, new Object[] { maSP }, new BeanPropertyRowMapper<SanPham>(SanPham.class));
	}

	// quản lý khách hàng

	public int saveKH(KhachHang kh) {
		String sql = "insert into KhachHang(maKH,tenKH,soDienThoai,email,diaChi) values(" + kh.getMaKH() + ",'"
				+ kh.getTenKH() + "','" + kh.getSoDienThoai() + "','" + kh.getEmail() + "','" + kh.getDiaChi() + "')";
		return template.update(sql);
	}

//	public int updateKH(KhachHang kh) {
//		String sql = "update KhachHang set soDienThoai='" + kh.getSoDienThoai() + "' where maKH=" + kh.getMaKH() + " ";
//		return template.update(sql);
//	}

	public int updateKH(TaiKhoan tk) {
		// String sql = "update TaiKhoan set passWord='"+tk.getPassWord()+"'"
		String sql = "update TaiKhoan set passWord='" + tk.getPassWord() + "',ho=N'" + tk.getHo() + "',ten=N'"
				+ tk.getTen() + "',diachi=N'" + tk.getDiachi() + "',sodienthoai='" + tk.getSodienthoai()
				+ "' where userName='" + tk.getUserName() + "'";
		return template.update(sql);
	}

	public int deleteKH(long id) {
		String sql = "delete from KhachHang where maKH=" + id + "";
		return template.update(sql);
	}

//	public KhachHang getKHByID(long maKH) {
//		String sql = "select * from KhachHang where maKH=?";
//		return template.queryForObject(sql, new Object[] { maKH },
//				new BeanPropertyRowMapper<KhachHang>(KhachHang.class));
//
//	}
	public TaiKhoan getKHByID(String userName) {
		try {
			String sql = "select * from TaiKhoan where userName=?";
			return template.queryForObject(sql, new Object[] { userName },
					new BeanPropertyRowMapper<TaiKhoan>(TaiKhoan.class));
		} catch (EmptyResultDataAccessException e) {
			return null;
		}

	}

	public List<TaiKhoan> getKhachHangs() {
		return template.query("select * from TaiKhoan where admin=" + 0 + "", new RowMapper<TaiKhoan>() {
			public TaiKhoan mapRow(ResultSet rs, int row) throws SQLException {
				TaiKhoan tk = new TaiKhoan();
				tk.setUserName(rs.getString(1));
				tk.setPassWord(rs.getString(2));
				tk.setHo(rs.getString(3));
				tk.setTen(rs.getString(4));
				tk.setDiachi(rs.getString(5));
				tk.setSodienthoai(rs.getString(7));
				return tk;

			}
		});
	}

	// quản lý đơn đặt hàng

	public int saveDH(DonDatHang ddh) {
		String sql = "insert into DonDatHang(billID,date,payment,address,total,userName) values(" + ddh.getBillID()
				+ ",'" + ddh.getDate() + "','" + ddh.getPayment() + "','" + ddh.getAddress() + "'," + ddh.getTotal()
				+ ",'" + ddh.getTaiKhoan().getUserName() + "')";
		return template.update(sql);
	}

	public List<DonDatHang> getDonDatHangs() {
		return template.query("select * from DonDatHang", new RowMapper<DonDatHang>() {
			public DonDatHang mapRow(ResultSet rs, int row) throws SQLException {
				DonDatHang ddh = new DonDatHang();
				TaiKhoan tk = new TaiKhoan();
				/*
				 * kh.setb(rs.getLong(1)); kh.setTenKH(rs.getString(2));
				 * kh.setSoDienThoai(rs.getString(3)); tk.setUserName(rs.getString(4));
				 * kh.setEmail(tk); kh.setDiaChi(rs.getString(5)); return kh;
				 */
				ddh.setBillID(rs.getLong(1));
				ddh.setDate(rs.getDate(2));
				ddh.setPayment(rs.getString(3));
				ddh.setAddress(rs.getString(4));
				ddh.setTotal(rs.getDouble(5));
				tk.setUserName(rs.getString(6));
				ddh.setTaiKhoan(tk);
				return ddh;
			}
		});
	}

	public List<DanhMuc> getAllDanhMuc() {
		return template.query("select * from DanhMuc", new RowMapper<DanhMuc>() {
			public DanhMuc mapRow(ResultSet rs, int row) throws SQLException {
				DanhMuc dm = new DanhMuc();
				dm.setMaDM(rs.getString(1));
				dm.setTenDM(rs.getString(2));
				return dm;
			}
		});
	}

	// quản lý danh mục

	public int LuuDanhMuc(DanhMuc dm) {
		String sql = "insert into DanhMuc values('" + dm.getMaDM() + "', '" + dm.getTenDM() + "')";
		return template.update(sql);
	}

	public int deleteDanhMuc(String maDM) {
		String sql = "delete from DanhMuc where maDM='" + maDM + "'";
		return template.update(sql);
	}

	public int suaDanhMuc(DanhMuc dm) {
		String sql = "update DanhMuc set tenDM='" + dm.getTenDM() + "' where maDM= '" + dm.getMaDM() + "' ";
		return template.update(sql);
	}

	public DanhMuc getDanhMucByMaDM(String maDM) {
		String sql = "select * from DanhMuc where maDM = ?";
		try {
			return template.queryForObject(sql, new Object[] { maDM },
					new BeanPropertyRowMapper<DanhMuc>(DanhMuc.class));
		} catch (EmptyResultDataAccessException e) {
			return null;
		}
	}

	// quản lý chi tiết đơn đặt hàng
	public List<ChiTietDonHang> getAllCTDDH() {
		return template.query("select * from ChiTietDonHang", new RowMapper<ChiTietDonHang>() {
			public ChiTietDonHang mapRow(ResultSet rs, int row) throws SQLException {
				ChiTietDonHang ctdh = new ChiTietDonHang();
				DonDatHang ddh = new DonDatHang();
				SanPham sp = new SanPham();
				ctdh.setBillDetailID(rs.getLong(1));
				ctdh.setPrice(rs.getDouble(2));
				ctdh.setQuantity(rs.getInt(3));
				ddh.setBillID(rs.getLong(4));
				ctdh.setDonDatHang(ddh);
				sp.setMaSP(rs.getString(5));
				ctdh.setSanPham(sp);
				return ctdh;
			}
		});
	}
}
