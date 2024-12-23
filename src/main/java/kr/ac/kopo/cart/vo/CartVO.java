package kr.ac.kopo.cart.vo;

public class CartVO {
	private int cartId;
	private String userId;
	private int itemCd;
	private String itemNm;
	private int price;
	private int quantity;
	public CartVO(int cartId, String userId, int itemCd, String itemNm, int price, int quantity) {
		this.cartId = cartId;
		this.userId = userId;
		this.itemCd = itemCd;
		this.itemNm = itemNm;
		this.price = price;
		this.quantity = quantity;
	}
	public CartVO() {

	}
	public int getCartId() {
		return cartId;
	}
	public void setCartId(int cartId) {
		this.cartId = cartId;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public int getItemCd() {
		return itemCd;
	}
	public void setItemCd(int itemCd) {
		this.itemCd = itemCd;
	}
	public String getItemNm() {
		return itemNm;
	}
	public void setItemNm(String itemNm) {
		this.itemNm = itemNm;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	@Override
	public String toString() {
		return "CartVO [cartId=" + cartId + ", userId=" + userId + ", itemCd=" + itemCd + ", itemNm=" + itemNm
				+ ", price=" + price + ", quantity=" + quantity + "]";
	}
	
}
