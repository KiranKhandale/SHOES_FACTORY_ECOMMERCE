package model.org;

public class User {

	private String name;
	private String email;
	private int uid;
	private String phone;
	private String street;
	private String city;
	private int pin;
	
	
	public void setName(String name) {
		// TODO Auto-generated method stub
		this.name=name;
	}

	public void setEmail(String email) {
		// TODO Auto-generated method stub
		this.email=email;
	}


	public String getName() {
		return name;
	}

	public String getEmail() {
		return email;
	}

	public int getUid() {
		return uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getStreet() {
		return street;
	}

	public void setStreet(String street) {
		this.street = street;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public int getPin() {
		return pin;
	}

	public void setPin(int pin) {
		this.pin = pin;
	}

	
	
	
}
