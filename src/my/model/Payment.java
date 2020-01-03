package my.model;

public class Payment {
	private Integer orderId;
	private String memberId;
	private String memberName;
	private String memberEmail;
	private String receiveName;
	private String receiveAddress;
	private String receiveTel;
	private String receiveText;
	private String receiveDate;
	private String flowerName;
	private int amount;
	private int price;
	
	public Payment() {}
	
	public Payment(String memberId, String memberName, String memberEmail, String receiveName, String receiveAddress,
			String receiveTel, String receiveText, String receiveDate, String flowerName, int amount, int price) {
		super();
		this.memberId = memberId;
		this.memberName = memberName;
		this.memberEmail = memberEmail;
		this.receiveName = receiveName;
		this.receiveAddress = receiveAddress;
		this.receiveTel = receiveTel;
		this.receiveText = receiveText;
		this.receiveDate = receiveDate;
		this.flowerName = flowerName;
		this.amount = amount;
		this.price = price;
	}

	public Integer getOrderId() {
		return orderId;
	}
	public void setOrderId(Integer orderId) {
		this.orderId = orderId;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public String getMemberEmail() {
		return memberEmail;
	}
	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}
	public String getReceiveName() {
		return receiveName;
	}
	public void setReceiveName(String receiveName) {
		this.receiveName = receiveName;
	}
	public String getReceiveAddress() {
		return receiveAddress;
	}
	public void setReceiveAddress(String receiveAddress) {
		this.receiveAddress = receiveAddress;
	}
	public String getReceiveTel() {
		return receiveTel;
	}
	public void setReceiveTel(String receiveTel) {
		this.receiveTel = receiveTel;
	}
	public String getReceiveText() {
		return receiveText;
	}
	public void setReceiveText(String receiveText) {
		this.receiveText = receiveText;
	}
	public String getReceiveDate() {
		return receiveDate;
	}
	public void setReceiveDate(String receiveDate) {
		this.receiveDate = receiveDate;
	}

	public String getFlowerName() {
		return flowerName;
	}

	public void setFlowerName(String flowerName) {
		this.flowerName = flowerName;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	
}

