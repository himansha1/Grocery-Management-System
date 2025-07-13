package customerpackage;

public class Product {
	private int itemid;
    private String itemname;
    private double price;

	public Product(int itemid, String itemname, double price) {
    	super();
        this.itemid = itemid;
        this.itemname = itemname;
        this.price = price;
    }

    public int getItemid() { return itemid; }
    public String getItemname() { return itemname; }
    public double getPrice() { return price; }
    
    public void setItemid(int itemid) {
		this.itemid = itemid;
	}

	public void setItemname(String itemname) {
		this.itemname = itemname;
	}

	public void setPrice(double price) {
		this.price = price;
	}
}
