package customerpackage;

public class CartItem {
	private int itemid;
    private String itemname;
    private double price;
    private int quantity;

    public CartItem(int itemid, String itemname, double price, int quantity) {
        this.itemid = itemid;
        this.itemname = itemname;
        this.price = price;
        this.quantity = quantity;
    }

    public int getItemid() {
    	return itemid; 
    }
    
    public String getItemname() { 
    	return itemname; 
    }
    
    public double getPrice() { 
    	return price; 
    }
    
    public int getQuantity() { 
    	return quantity; 
    }
}
