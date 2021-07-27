package se.ptithcm.detai.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import se.ptithcm.detai.dao.Database;
import se.ptithcm.detai.model.CartBean;
import se.ptithcm.detai.model.CartItemBean;
import se.ptithcm.detai.model.ChiTietDonHang;
import se.ptithcm.detai.model.DonDatHang;
import se.ptithcm.detai.model.TaiKhoan;

/**
 * Servlet implementation class CartServlet
 */
public class CartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	private Database dao;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CartServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String strAction= request.getParameter("action");
		if(strAction !=null && !strAction.equals("")) {
			if(strAction.equals("add")) {
				addToCart(request);
				response.sendRedirect("cart");
			}else if(strAction.equals("Update")) {
				updateCart(request);
				response.sendRedirect("cart");
			}else if(strAction.equals("Delete")) {
				deleteCart(request);
				response.sendRedirect("cart");
			}//else if(strAction.equals("ThanhToan")) {
				//thanhToan(request, response);
				//response.sendRedirect("cart");
			//}
		}
	}
	
//	protected void thanhToan(HttpServletRequest request, HttpServletResponse response) {
//		HttpSession session = request.getSession();
//		CartBean cartBean = (CartBean) session.getAttribute("cart");	
//		TaiKhoan tk = (TaiKhoan) session.getAttribute("user");
//		try {
//			DonDatHang ddh = new DonDatHang();
//			dao.addDonDatHang(ddh);
//			ddh.setTaiKhoan((TaiKhoan) session.getAttribute("user"));
//			ChiTietDonHang ctdh = new ChiTietDonHang();
//			ctdh.setDonDatHang(ddh);
//			dao.addChiTietDonHang(ctdh);
//			//rm.guiEmail(tk.getUserName(), "Dat hang thanh cong" , "Xin chào, "+tk.getUserName()+"\nMã đơn hàng: #"+ddh.getBillID()+"\nNgày đặt hàng: "+ddh.getDate()+"\n Tổng thanh toán: "+ddh.getTotal()+"");
//			cartBean = new CartBean();
//			session.setAttribute("cart", cartBean);
//		}catch (Exception e) {
//			e.printStackTrace();
//		}
//	}
	
	protected void deleteCart(HttpServletRequest rq) {

		HttpSession session=rq.getSession();
		String strItemIndex=rq.getParameter("itemIndex");
		CartBean cartBean=null;

		Object objCartBean=session.getAttribute("cart");
		if(objCartBean !=null) {
			cartBean=(CartBean) objCartBean;
		}else {
			cartBean= new CartBean();
		}
		cartBean.deleteCartItem(strItemIndex);
	}

	protected void updateCart(HttpServletRequest rq) {
		// TODO Auto-generated method stub
		HttpSession session=rq.getSession();
		int strQuantity=Integer.parseInt(rq.getParameter("quantity"));
		String strItemIndex=rq.getParameter("itemIndex");
		CartBean cartBean=null;
		
		if(strQuantity==0) {
			deleteCart(rq);
		}
		
		Object objCartBean=session.getAttribute("cart");
		if(objCartBean !=null) {
			cartBean=(CartBean) objCartBean;
		}else {
			cartBean= new CartBean();
		}
		cartBean.updateCartItem(strItemIndex, strQuantity);
	}

	protected void addToCart(HttpServletRequest rq) {
		// TODO Auto-generated method stub
		HttpSession session=rq.getSession();
		String strModelNo=rq.getParameter("modelNo");
		String strDescription=rq.getParameter("description");
		String strPrice=rq.getParameter("price");
		String strQuantity=rq.getParameter("quantity");
		CartBean cartBean=null;
		Object objCartBean=session.getAttribute("cart");
		if(objCartBean !=null) {
			cartBean=(CartBean) objCartBean;
		}else {
			cartBean= new CartBean();
			session.setAttribute("cart", cartBean);
		}
		double price= Double.parseDouble(strPrice);
		int quantity= Integer.parseInt(strQuantity);
		double total=price*quantity;
		CartItemBean cartItem= new CartItemBean(strModelNo, strDescription,price,quantity,total);
		if(cartBean.getCartItems().size()==0) {
			cartBean.addCartItem(strModelNo, strDescription, strPrice, strQuantity);
		}
		else {
			for(CartItemBean c:cartBean.getCartItems()) {
				if(c.getPartNumber().equalsIgnoreCase(cartItem.getPartNumber())){
					c.setQuantity(cartItem.getQuantity()+c.getQuantity());
					c.setTotalCost(c.getUnitCost()*c.getQuantity());
					return;
				}
			}
			cartBean.addCartItem(strModelNo, strDescription, strPrice, strQuantity);
		}
	}

}
