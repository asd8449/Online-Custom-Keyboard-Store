package kr.ac.kopo.item.vo;

public class ItemVO {

	private int no;
	private String name;
	private String category;
	private int stock;
	private String regDate;
	private String manufacturer;
	private int price;
	private String description;
	public ItemVO() {

	}
	

	public ItemVO(String category) {
		this.category = category;
	}


	public ItemVO(int no, String name, String category, int stock, String regDate, String manufacturer, int price,
			String description) {
		this.no = no;
		this.name = name;
		this.category = category;
		this.stock = stock;
		this.regDate = regDate;
		this.manufacturer = manufacturer;
		this.price = price;
		this.description = description;
	}

	public ItemVO(int no) {
		this.no = no;
	}


	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public int getStock() {
		return stock;
	}
	public void setStock(int stock) {
		this.stock = stock;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public String getManufacturer() {
		return manufacturer;
	}
	public void setManufacturer(String manufacturer) {
		this.manufacturer = manufacturer;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	@Override
	public String toString() {
		return category +" : [no=" + no + ", name=" + name + ", stock=" + stock + ", regDate="
				+ regDate + ", manufacturer=" + manufacturer + ", price=" + price + ", description=" + description
				+ "]";
	}
	
}
