package com.model;

public class Score  implements java.io.Serializable{
	
	private static final long serialVersionUID = 1L;
	
	private Integer uid;
	
	private Integer zongfen;
	
	private Integer zongshu;
	
	private Integer num;
	
	private Integer defen;
    //
	private String okdaan;
	
	private String mydaan;

	
	
	
	public Integer getUid() {
		return uid;
	}

	public void setUid(Integer uid) {
		this.uid = uid;
	}

	public Integer getZongfen() {
		return zongfen;
	}

	public void setZongfen(Integer zongfen) {
		this.zongfen = zongfen;
	}

	public Integer getDefen() {
		return defen;
	}

	public void setDefen(Integer defen) {
		this.defen = defen;
	}

	
	public Integer getNum() {
		return num;
	}

	public void setNum(Integer num) {
		this.num = num;
	}

	public Integer getZongshu() {
		return zongshu;
	}

	public void setZongshu(Integer zongshu) {
		this.zongshu = zongshu;
	}

	public String getOkdaan() {
		return okdaan;
	}

	public void setOkdaan(String okdaan) {
		this.okdaan = okdaan;
	}

	public String getMydaan() {
		return mydaan;
	}

	public void setMydaan(String mydaan) {
		this.mydaan = mydaan;
	}
	
	
	
}
