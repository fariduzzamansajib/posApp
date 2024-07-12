package com.example.demo;

import java.sql.Date;

public class Sales {
	int salesId;
	Date salesDate;
	int quantity;
	int pId;
	int transectionId;
	public Sales() {
		super();
	}
	public Sales(int salesId, Date salesDate, int quantity, int pId, int transectionId) {
		super();
		this.salesId = salesId;
		this.salesDate = salesDate;
		this.quantity = quantity;
		this.pId = pId;
		this.transectionId = transectionId;
	}
	public int getSalesId() {
		return salesId;
	}
	public void setSalesId(int salesId) {
		this.salesId = salesId;
	}
	public Date getSalesDate() {
		return salesDate;
	}
	public void setSalesDate(Date salesDate) {
		this.salesDate = salesDate;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public int getpId() {
		return pId;
	}
	public void setpId(int pId) {
		this.pId = pId;
	}
	public int getTransectionId() {
		return transectionId;
	}
	public void setTransectionId(int transectionId) {
		this.transectionId = transectionId;
	}
	@Override
	public String toString() {
		return "Sales [salesId=" + salesId + ", salesDate=" + salesDate + ", quantity=" + quantity + ", pId=" + pId
				+ ", transectionId=" + transectionId + ", getSalesId()=" + getSalesId() + ", getSalesDate()="
				+ getSalesDate() + ", getQuantity()=" + getQuantity() + ", getpId()=" + getpId()
				+ ", getTransectionId()=" + getTransectionId() + ", getClass()=" + getClass() + ", hashCode()="
				+ hashCode() + ", toString()=" + super.toString() + "]";
	}
	
	
	

}
