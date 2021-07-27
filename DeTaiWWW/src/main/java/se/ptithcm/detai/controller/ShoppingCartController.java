package se.ptithcm.detai.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.sql.Date;
import java.util.List;

import javax.mail.MessagingException;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartException;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.view.RedirectView;

import se.ptithcm.detai.dao.Database;
import se.ptithcm.detai.model.CartBean;
import se.ptithcm.detai.model.CartItemBean;
import se.ptithcm.detai.model.ChiTietDonHang;
import se.ptithcm.detai.model.DanhMuc;
import se.ptithcm.detai.model.DonDatHang;
import se.ptithcm.detai.model.KhachHang;
import se.ptithcm.detai.model.SanPham;
import se.ptithcm.detai.model.TaiKhoan;

@Controller
public class ShoppingCartController {
	@Autowired
	Database dao;

	@RequestMapping(value = "/homepage", method = RequestMethod.GET)
	public String showDSSP(Model model) {
		List<SanPham> list = dao.getDSSP();
		model.addAttribute("ds", list);
		List<DanhMuc> dsdm = dao.getListCategory();
		model.addAttribute("dsdm", dsdm);
		return "homepage";
	}

	@RequestMapping(value = "/homepage1", method = RequestMethod.GET)
	public String showDSSP1(Model model) {
		List<SanPham> list = dao.getDSSP();
		model.addAttribute("ds", list);
		List<DanhMuc> dsdm = dao.getListCategory();
		model.addAttribute("dsdm", dsdm);
		return "homepage1";
	}

	@RequestMapping(value = "/dssptdm/{danhmuc}", method = RequestMethod.GET)
	//@RequestMapping(value = "/{danhmuc}", method = RequestMethod.GET)
	public String showDanhSachSPTheoDanhMuc(Model model, @ModelAttribute(name = "danhmuc") String danhmuc) {
		List<DanhMuc> dsdm = dao.getListCategory();
		model.addAttribute("dsdm", dsdm);
		List<SanPham> dssp = dao.getListSanPhamByDanhMuc(danhmuc);
		// DanhMuc dm = dao.getDanhMuc("DanhMuc1");
		// model.addAttribute("dm", dm);
		model.addAttribute("dssp", dssp);
		return "DanhSachSPTheoDanhMuc";
	}

	@RequestMapping(value = "/dssptdm1/{danhmuc}", method = RequestMethod.GET)
	public String showDanhSachSPTheoDanhMuc1(Model model, @ModelAttribute(name = "danhmuc") String danhmuc) {
		List<DanhMuc> dsdm = dao.getListCategory();
		model.addAttribute("dsdm", dsdm);
		List<SanPham> dssp = dao.getListSanPhamByDanhMuc(danhmuc);
		// DanhMuc dm = dao.getDanhMuc("DanhMuc1");
		// model.addAttribute("dm", dm);
		model.addAttribute("dssp", dssp);
		return "DanhSachSPTheoDanhMuc1";
	}

	@RequestMapping(value = "/ctsp/{maSP}", method = RequestMethod.GET)
	public String showChiTietSanPham(Model model, @PathVariable(name = "maSP") String maSP) {
		List<DanhMuc> dsdm = dao.getListCategory();
		model.addAttribute("dsdm", dsdm);
		SanPham sp = dao.getSanPham(maSP);
		model.addAttribute("sp", sp);
		// DanhMuc dm = dao.getDanhMuc("DanhMuc1");
		// model.addAttribute("dm", dm);
		return "ChiTietSanPham";
	}

	@RequestMapping(value = "/ctsp1/{maSP}", method = RequestMethod.GET)
	public String showChiTietSanPham1(Model model, @PathVariable(name = "maSP") String maSP) {
		List<DanhMuc> dsdm = dao.getListCategory();
		model.addAttribute("dsdm", dsdm);
		SanPham sp = dao.getSanPham(maSP);
		model.addAttribute("sp", sp);
		// DanhMuc dm = dao.getDanhMuc("DanhMuc1");
		// model.addAttribute("dm", dm);
		return "ChiTietSanPham1";
	}

	@RequestMapping(value = "/cart")
	public ModelAndView showCart(HttpSession session, ModelMap model) {
//		TaiKhoan tk = (TaiKhoan) session.getAttribute("user");
//		model.addAttribute("tk", tk);
//		if (tk.isAdmin())
//			return new ModelAndView("homepage1");
//			//return "redirect:/homepage1";
//		// tk.isAdmin();
//		CartBean cartBean = (CartBean) session.getAttribute("cart");
//		if (cartBean == null) {
//			cartBean = new CartBean();
//			session.setAttribute("cart", cartBean);
//		}
		return new ModelAndView("cart");
	}

	@RequestMapping(value = "/signin")
	public ModelAndView showSignIn(HttpSession session) {
		if (session.getAttribute("user") != null) {
			session.invalidate();
		}
		return new ModelAndView("signin", "command", new TaiKhoan());
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	private RedirectView login(RedirectAttributes redirectAttributes, @ModelAttribute("tk") TaiKhoan tk,
			HttpSession session) {
		TaiKhoan login = dao.login(tk.getUserName(), tk.getPassWord());
		if (login == null) {
			redirectAttributes.addFlashAttribute("error", "wrong username or password");
			return new RedirectView("signin");
		} else if (login.isAdmin()) {
			session.setAttribute("user", dao.login(tk.getUserName(), tk.getPassWord()));
			return new RedirectView("homepage1");
		} else {
			session.setAttribute("user", dao.login(tk.getUserName(), tk.getPassWord()));
			return new RedirectView("homepage");
		}
	}

	@RequestMapping(value = "/signup", method = RequestMethod.GET)
	public String showSignUp(Model model, HttpSession session, ModelMap modelMap) {
		if (session.getAttribute("user") != null) {
			session.invalidate();
		}
		model.addAttribute("tk", new TaiKhoan());
		model.addAttribute("check", false);
		return "signup";
	}

	@RequestMapping(value = "/thanhvien")
	public String showThanhVien() {
		return "thanhvien";
	}

	@RequestMapping(value = "/thanhvien1")
	public String showThanhVien1() {
		return "thanhvien1";
	}

	@RequestMapping("/checkout")
	public ModelAndView showform() {
		return new ModelAndView("checkout", "command", new DonDatHang());
	}

	@RequestMapping("/checkout1")
	public ModelAndView showform1() {
		return new ModelAndView("checkout1", "command", new DonDatHang());
	}

	// lưu đơn đặt hàng, chi tiết đơn hàng
	@RequestMapping(value = "/addDonDatHang", method = RequestMethod.POST)
	public ModelAndView addDonDatHang(@ModelAttribute("ddh") DonDatHang ddh,
			@ModelAttribute("ctdh") ChiTietDonHang ctdh, HttpSession session) throws MessagingException {
		CartBean cartBean = (CartBean) session.getAttribute("cart");
		TaiKhoan tk = (TaiKhoan) session.getAttribute("user");
		ddh.setTaiKhoan(tk);
		dao.addDonDatHang(ddh);
		for (CartItemBean c : cartBean.getCartItems()) {
			long millis1 = System.currentTimeMillis();
			long ID1 = new Date(millis1).getTime();
			ctdh.setBillDetailID(ID1);
			ctdh.setDonDatHang(ddh);
			SanPham sp = new SanPham(c.getPartNumber());
			ctdh.setSanPham(sp);
			dao.addChiTietDonHang(ctdh, c);
			cartBean = new CartBean();
			session.setAttribute("cart", cartBean);
			dao.sendMail1(tk.getUserName(), ctdh);
		}
		return new ModelAndView("redirect:/homepage");
	}

	@RequestMapping(value = "savesignup", params = "action")
	public RedirectView save(@ModelAttribute(name = "tk") TaiKhoan tk, ModelMap model,
			RedirectAttributes redirectAttributes) throws MessagingException {
		try {
			dao.addTaiKhoan(tk);
			dao.sendMail(tk.getUserName());
			return new RedirectView("homepage");
		} catch (Exception e) {
			redirectAttributes.addFlashAttribute("message", "Tài khoản này đã tồn tại");
			return new RedirectView("signup");
		}
	}

	// quản lý
	@RequestMapping(value = "/quanly")
	public String showQuanLy() {
		return "QuanLy";
	}

	
	// thêm sản phẩm mới

		public static void saveFile(String Tryphoto,String fileName, MultipartFile multipartFile) throws IOException {
			Path uploadPath = Paths.get("C:\\Users\\DELL\\Desktop\\LTWWWJAVA_DHKTPM12A_BAITAPLON_NHOM09 (2)\\LTWWWJAVA_DHKTPM12A_BAITAPLON_NHOM09\\WEBSITE\\Eclipse Project\\DeTaiWWW\\src\\main\\webapp\\resources\\images");
			//Path uploadPath = Paths.get(Tryphoto);
			
			if (!Files.exists(uploadPath)) {
				Files.createDirectories(uploadPath);
			}

			try (InputStream inputStream = multipartFile.getInputStream()) {
				Path filePath = uploadPath.resolve(fileName);
				Files.copy(inputStream, filePath, StandardCopyOption.REPLACE_EXISTING);
			} catch (IOException ioe) {
				throw new IOException("Could not save image file: " + fileName, ioe);
			}
		}
	// quản lý sản phẩm
	@RequestMapping(value = "/quanlysanpham")
	public String showQuanLySanPham(Model model) {
		List<SanPham> dssp = dao.getListSanPham();
		model.addAttribute("dssp", dssp);
		return "QuanLySanPham";
	}
	// qua form thêm sản phẩm
	@RequestMapping("/addsp")
	public ModelAndView showformaddsp(Model model) {
		List<DanhMuc> dsdm = dao.getListCategory();
		model.addAttribute("dsdm", dsdm);
		return new ModelAndView("ThemSanPham", "command", new SanPham());
	}
	@RequestMapping(value = "/savesp", method = RequestMethod.POST)
	public ModelAndView savesp(@ModelAttribute("sp") SanPham sp,@RequestParam("image") MultipartFile photo)
			throws IOException {
		String filename = photo.getOriginalFilename();
		String TryPhoto = "images";
		sp.setImageURL("resources/images/"+filename);
		saveFile(TryPhoto,filename, photo);

		dao.addSanPham(sp);
		return new ModelAndView("redirect:/quanlysanpham");

	}
	// xóa sản phẩm
	@RequestMapping(value = "/deletesp/{maSP}", method = RequestMethod.GET)
	public ModelAndView deletesp(@PathVariable String maSP) {
		dao.deleteSanPham(maSP);
		return new ModelAndView("redirect:/quanlysanpham");
	}
	// qua form edit sản phẩm
	@RequestMapping(value = "editsp/{maSP}")
	public ModelAndView edit(@PathVariable String maSP) {
		SanPham sp = dao.getSPByMaSP(maSP);
		return new ModelAndView("SuaSanPham", "command", sp);
	}
	// lưu cập nhật sản phẩm
	@RequestMapping(value = "/editsavesp", method = RequestMethod.POST)
	public ModelAndView editsave(@ModelAttribute("emp") SanPham sp) {
		dao.updateSanPham(sp);
		return new ModelAndView("redirect:/quanlysanpham");
	}

	// quản lý khách hàng
	@RequestMapping("/quanlykhachhang")
	public ModelAndView QuanLyKhachHang() {
		List<TaiKhoan> list = dao.getKhachHangs();
		return new ModelAndView("QuanLyKhachHang", "list", list);
	}

	@RequestMapping(value = "/editkh/{userName}")
	public String edit1(ModelMap model,@PathVariable("userName") String userName) {
		TaiKhoan tk = dao.getKHByID(userName);
		model.addAttribute("tk", tk);
		return "SuaKhachHang";
	}

	// cập nhật khách hàng
	@RequestMapping(value = "/editsave", method = RequestMethod.POST)
	public ModelAndView editsave(@ModelAttribute("tk") TaiKhoan tk) {
		dao.updateKH(tk);
		return new ModelAndView("redirect:/quanlykhachhang");
	}

	// quản lý đơn đặt hàng
	@RequestMapping("/quanlydondathang")
	public ModelAndView QuanLyDonDatHang() {
		List<DonDatHang> list = dao.getDonDatHangs();
		return new ModelAndView("QuanLyDonDatHang", "list", list);
	}

	// quản lý danh mục
	@RequestMapping("/quanlydanhmuc")
	public ModelAndView QuanLyDanhMuc() {
		List<DanhMuc> list = dao.getAllDanhMuc();
		return new ModelAndView("QuanLyDanhMuc", "list", list);
	}

	// qua form danh mục
	@RequestMapping("/ThemDanhMuc")
	public ModelAndView showformAddDM() {
		return new ModelAndView("ThemDanhMuc", "command", new DanhMuc());
	}

	// thêm danh mục
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public ModelAndView luuDanhMuc(@ModelAttribute("dm") DanhMuc dm) {
		dao.LuuDanhMuc(dm);
		return new ModelAndView("redirect:/quanlydanhmuc");
	}

	// xóa danh mục
	@RequestMapping(value = "/xoaDanhMuc/{maDM}", method = RequestMethod.GET)
	public ModelAndView xoaDanhMuc(@PathVariable String maDM) {
		dao.deleteDanhMuc(maDM);
		return new ModelAndView("redirect:/quanlydanhmuc");
	}
	
	@RequestMapping(value = "/SuaDanhMuc/{maDM}")
	public String showformSuaDanhMuc(@PathVariable("maDM") String maDM,ModelMap model) {
		DanhMuc dm = dao.getDanhMucByMaDM(maDM);
		model.addAttribute("dm", dm);
		return "SuaDanhMuc";
	}

	// cập nhật danh mục
	@RequestMapping(value = "/editsavedm", method = RequestMethod.POST)
	public ModelAndView suaDanhMuc(@ModelAttribute("dm") DanhMuc dm) {
		dao.suaDanhMuc(dm);
		return new ModelAndView("redirect:/quanlydanhmuc");
	}

	// quản lý chi tiết đơn đặt hàng
	@RequestMapping("/quanlychitietdondathang")
	public ModelAndView QuanLyChiTietDonHang() {
		List<ChiTietDonHang> list = dao.getAllCTDDH();
		return new ModelAndView("QuanLyChiTietDonHang", "list", list);
	}
}
