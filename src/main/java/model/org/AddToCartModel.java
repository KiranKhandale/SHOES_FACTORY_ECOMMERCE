package model.org;

import java.util.Base64;

public class AddToCartModel {
	
	private int oid;
	private String productname;
	private String description;
	private int price;
	private int quantity;
	private int size;
	private byte[] image;
	private int pid;
	private int uid;
	
	
	// ✅ Default Constructor
    public AddToCartModel() {
    }

    // ✅ Parameterized Constructor
    public AddToCartModel(int oid,   int quantity) {
       
    	this.oid = oid;
        this.quantity = quantity;
    }
	
    
    
	public String getProductname() {
		return productname;
	}

	public void setProductname(String productname) {
		this.productname = productname;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getOid() {
		return oid;
	}
	public void setOid(int oid) {
		this.oid = oid;
	}
	
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public int getSize() {
		return size;
	}

	public void setSize(int size) {
		this.size = size;
	}

	public byte[] getImage() {
		return image;
	}

	public void setImage(byte[] image) {
		this.image = image;
	}
	
	 public int getPid() {
		return pid;
	}

	public void setPid(int pid) {
		this.pid = pid;
	}

	public int getUid() {
		return uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}

	public String getBase64Image() {
	        if (this.image != null) {
	            return Base64.getEncoder().encodeToString(this.image);
	        }
	        return null;
	    }
	
}
