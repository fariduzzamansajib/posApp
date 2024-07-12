package com.example.demo;

public class Transection {
	int transectionId;
	String paymentType;
	int grossSales;
	int discount;
	int netSales;
	public Transection() {
		super();
	}
	public Transection(int transectionId, String paymentType, int grossSales, int discount, int netSales) {
		super();
		this.transectionId = transectionId;
		this.paymentType = paymentType;
		this.grossSales = grossSales;
		this.discount = discount;
		this.netSales = netSales;
	}
	public int getTransectionId() {
		return transectionId;
	}
	public void setTransectionId(int transectionId) {
		this.transectionId = transectionId;
	}
	public String getPaymentType() {
		return paymentType;
	}
	public void setPaymentType(String paymentType) {
		this.paymentType = paymentType;
	}
	public int getGrossSales() {
		return grossSales;
	}
	public void setGrossSales(int grossSales) {
		this.grossSales = grossSales;
	}
	public int getDiscount() {
		return discount;
	}
	public void setDiscount(int discount) {
		this.discount = discount;
	}
	public int getNetSales() {
		return netSales;
	}
	public void setNetSales(int netSales) {
		this.netSales = netSales;
	}
	@Override
	public String toString() {
		return "Transection [transectionId=" + transectionId + ", paymentType=" + paymentType + ", grossSales="
				+ grossSales + ", discount=" + discount + ", netSales=" + netSales + ", getTransectionId()="
				+ getTransectionId() + ", getPaymentType()=" + getPaymentType() + ", getGrossSales()=" + getGrossSales()
				+ ", getDiscount()=" + getDiscount() + ", getNetSales()=" + getNetSales() + ", getClass()=" + getClass()
				+ ", hashCode()=" + hashCode() + ", toString()=" + super.toString() + "]";
	}
	
	

}
