package domain;


public class Goods {
	private Integer id;
	private String goodsname;
	private float price;
	private Integer number;
	private Integer salesvolume;
	public String getGoodsname() {
		return goodsname;
	}

	public void setGoodsname(String goodsname) {
		this.goodsname = goodsname;
	}

	public float getPrice() {
		return price;
	}

	public void setPrice(float price) {
		this.price = price;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}
	public void setNumber(Integer n) {
		this.number=n;
	}
	public Integer getNumber() {
		return number;
	}
	public void setSalesvolume(Integer n) {
		this.salesvolume=n;
	}
	public Integer getSalesvolume() {
		return salesvolume;
	}

}
