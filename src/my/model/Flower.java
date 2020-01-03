package my.model;

public class Flower {
	private String flowerName;
	private String mainPic;
	private int price;
	private int fav;
	private String pic1;
	private String explain1;
	private String pic2;
	private String explain2;
	private String pic3;
	private String explain3;
	private String type;
	
	public Flower() {}

	public Flower(String flowerName, String mainPic, int price, String pic1, String explain1, String pic2,
			String explain2, String pic3, String explain3, String type) {
		super();
		this.flowerName = flowerName;
		this.mainPic = mainPic;
		this.price = price;
		this.pic1 = pic1;
		this.explain1 = explain1;
		this.pic2 = pic2;
		this.explain2 = explain2;
		this.pic3 = pic3;
		this.explain3 = explain3;
		this.type = type;
	}

	public String getFlowerName() {
		return flowerName;
	}

	public void setFlowerName(String flowerName) {
		this.flowerName = flowerName;
	}

	public String getMainPic() {
		return mainPic;
	}

	public void setMainPic(String mainPic) {
		this.mainPic = mainPic;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getFav() {
		return fav;
	}

	public void setFav(int fav) {
		this.fav = fav;
	}

	public String getPic1() {
		return pic1;
	}

	public void setPic1(String pic1) {
		this.pic1 = pic1;
	}

	public String getExplain1() {
		return explain1;
	}

	public void setExplain1(String explain1) {
		this.explain1 = explain1;
	}

	public String getPic2() {
		return pic2;
	}

	public void setPic2(String pic2) {
		this.pic2 = pic2;
	}

	public String getExplain2() {
		return explain2;
	}

	public void setExplain2(String explain2) {
		this.explain2 = explain2;
	}

	public String getPic3() {
		return pic3;
	}

	public void setPic3(String pic3) {
		this.pic3 = pic3;
	}

	public String getExplain3() {
		return explain3;
	}

	public void setExplain3(String explain3) {
		this.explain3 = explain3;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}
	
	
	
}
