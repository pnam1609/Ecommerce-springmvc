package se.ptithcm.detai.model;

import java.util.ArrayList;

public class CartBean {
	
	private ArrayList<CartItemBean> alCartItems= new ArrayList<CartItemBean>();
	private double OrderTotal;
	
	public int getLineItemCount() {
		return alCartItems.size();
	}
	
	public double getOrderTotal() {
		return OrderTotal;
	}

	public void setOrderTotal(double orderTotal) {
		OrderTotal = orderTotal;
	}
	
	
	public ArrayList<CartItemBean> getCartItems() {
		return alCartItems;
	}

	public void setCartItems(ArrayList<CartItemBean> alCartItems) {
		this.alCartItems = alCartItems;
	}

	protected void calculateOrderTotal() {
		double dblTotal=0;
		for(int counter=0;counter<alCartItems.size();counter++) {
			CartItemBean cartItemBean= (CartItemBean)alCartItems.get(counter);
			dblTotal+=cartItemBean.getTotalCost();
		}
		setOrderTotal(dblTotal);
	}
	public void deleteCartItem(String strItemIndex) {
		int index=0;
		try {
			index=Integer.parseInt(strItemIndex);
			alCartItems.remove(index-1);
			calculateOrderTotal();
		}catch (NumberFormatException e) {
			// TODO: handle exception
			System.out.println("Error while deleting cart item"+e.getMessage());
			e.printStackTrace();
		}
	}
	public void updateCartItem(String strItemIndex, int strQuality) {
		double dblTotalCost=0.0;
		double dblUnitCost=0.0;
		int ItemIndex=0;
		int Quality=0;
		CartItemBean cartItem=null;
		try {
			ItemIndex= Integer.parseInt(strItemIndex);
			Quality=strQuality;
			if(Quality>0) {
				cartItem= (CartItemBean)alCartItems.get(ItemIndex-1);
				dblUnitCost=cartItem.getUnitCost();
				dblTotalCost=Quality*dblUnitCost;
				cartItem.setQuantity(Quality);
				cartItem.setTotalCost(dblTotalCost);
				calculateOrderTotal();
			}
		} catch (NumberFormatException e) {
			System.out.println("Error while update cart item"+e.getMessage());
			e.printStackTrace();
		}
	}
	public CartItemBean getCartItem(int iItemIndex) {
		CartItemBean cartItem=null;
		if(alCartItems.size()>iItemIndex) {
			cartItem=(CartItemBean)alCartItems.get(iItemIndex);
		}
		return cartItem;
	}
	public void addCartItem(String strModelNo,String strDescription, 
			String strUnitcost,String strQuatity) {
		double dblTotalCost=0.0;
		double dblUnitcost=0.0;
		int iQuatity=0;
		CartItemBean cartItem= new CartItemBean();
		try {
			dblUnitcost=Double.parseDouble(strUnitcost);
			iQuatity=Integer.parseInt(strQuatity);
			if(iQuatity>0) {
				dblTotalCost=dblUnitcost*iQuatity;
				cartItem.setPartNumber(strModelNo);
				cartItem.setModelDescription(strDescription);
				cartItem.setUnitCost(dblUnitcost);
				cartItem.setQuantity(iQuatity);
				cartItem.setTotalCost(dblTotalCost);
				alCartItems.add(cartItem);
				calculateOrderTotal();
			}
		} catch (NumberFormatException e) {
			System.out.println("Error while adding cart item"+e.getMessage());
			e.printStackTrace();
		}
	}
	public void addCartItem(CartItemBean cartItem) {
		alCartItems.add(cartItem);
	}
	public int countItem() {
		return alCartItems.size();
	}
}
