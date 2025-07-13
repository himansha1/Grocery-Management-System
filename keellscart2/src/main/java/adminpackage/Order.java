package adminpackage;

public class Order {
	private int orderid;
	private int cusid;
	private int itemid;
	private int quantity;
	private double total;
	private String date;
	
	public Order(int orderid, int cusid, int itemid, int quantity, double total, String date) {
		super();
		this.orderid = orderid;
		this.cusid = cusid;
		this.itemid = itemid;
		this.quantity = quantity;
		this.total = total;
		this.date = date;
	}

	public int getOrderid() {
		return orderid;
	}

	public void setOrderid(int orderid) {
		this.orderid = orderid;
	}

	public int getCusid() {
		return cusid;
	}

	public void setCusid(int cusid) {
		this.cusid = cusid;
	}

	public int getItemid() {
		return itemid;
	}

	public void setItemid(int itemid) {
		this.itemid = itemid;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public double getTotal() {
		return total;
	}

	public void setTotal(double total) {
		this.total = total;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}
	
}
