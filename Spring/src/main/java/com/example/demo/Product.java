package com.example.demo;

public class Product {
    int id;
    int barcode;
    String name;
    String description;
    int quantity;
    double purchase_rate;
    double sales_rate;
    String size;
    String category;
    String colors;
    int stock;
    String supplier;
	public Product() {
		super();
	}
	public Product(int id, int barcode, String name, String description, int quantity, double purchase_rate,
			double sales_rate, String size, String category, String colors, int stock, String supplier) {
		super();
		this.id = id;
		this.barcode = barcode;
		this.name = name;
		this.description = description;
		this.quantity = quantity;
		this.purchase_rate = purchase_rate;
		this.sales_rate = sales_rate;
		this.size = size;
		this.category = category;
		this.colors = colors;
		this.stock = stock;
		this.supplier = supplier;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getBarcode() {
		return barcode;
	}
	public void setBarcode(int barcode) {
		this.barcode = barcode;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public double getPurchase_rate() {
		return purchase_rate;
	}
	public void setPurchase_rate(double purchase_rate) {
		this.purchase_rate = purchase_rate;
	}
	public double getSales_rate() {
		return sales_rate;
	}
	public void setSales_rate(double sales_rate) {
		this.sales_rate = sales_rate;
	}
	public String getSize() {
		return size;
	}
	public void setSize(String size) {
		this.size = size;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getColors() {
		return colors;
	}
	public void setColors(String colors) {
		this.colors = colors;
	}
	public int getStock() {
		return stock;
	}
	public void setStock(int stock) {
		this.stock = stock;
	}
	public String getSupplier() {
		return supplier;
	}
	public void setSupplier(String supplier) {
		this.supplier = supplier;
	}
	@Override
	public String toString() {
		return "Product [id=" + id + ", barcode=" + barcode + ", name=" + name + ", description=" + description
				+ ", quantity=" + quantity + ", purchase_rate=" + purchase_rate + ", sales_rate=" + sales_rate
				+ ", size=" + size + ", category=" + category + ", colors=" + colors + ", stock=" + stock
				+ ", supplier=" + supplier + ", getId()=" + getId() + ", getBarcode()=" + getBarcode() + ", getName()="
				+ getName() + ", getDescription()=" + getDescription() + ", getQuantity()=" + getQuantity()
				+ ", getPurchase_rate()=" + getPurchase_rate() + ", getSales_rate()=" + getSales_rate() + ", getSize()="
				+ getSize() + ", getCategory()=" + getCategory() + ", getColors()=" + getColors() + ", getStock()="
				+ getStock() + ", getSupplier()=" + getSupplier() + ", getClass()=" + getClass() + ", hashCode()="
				+ hashCode() + ", toString()=" + super.toString() + "]";
	}
    
    


}
