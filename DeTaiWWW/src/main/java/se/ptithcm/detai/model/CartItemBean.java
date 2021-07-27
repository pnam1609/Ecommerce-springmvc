package se.ptithcm.detai.model;

public class CartItemBean {

	private String PartNumber;
	private String ModelDescription;
	private double UnitCost;
	private int Quantity;
	private double TotalCost;
	public CartItemBean(String partNumber, String modelDescription, double unitCost, int quantity, double totalCost) {
		super();
		PartNumber = partNumber;
		ModelDescription = modelDescription;
		UnitCost = unitCost;
		Quantity = quantity;
		TotalCost = totalCost;
	}
	public String getPartNumber() {
		return PartNumber;
	}
	public void setPartNumber(String partNumber) {
		PartNumber = partNumber;
	}
	public String getModelDescription() {
		return ModelDescription;
	}
	public void setModelDescription(String modelDescription) {
		ModelDescription = modelDescription;
	}
	public double getUnitCost() {
		return UnitCost;
	}
	public void setUnitCost(double unitCost) {
		UnitCost = unitCost;
	}
	public int getQuantity() {
		return Quantity;
	}
	public void setQuantity(int quantity) {
		Quantity = quantity;
	}
	public double getTotalCost() {
		return TotalCost;
	}
	public void setTotalCost(double totalCost) {
		TotalCost = totalCost;
	}
	public CartItemBean() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}
