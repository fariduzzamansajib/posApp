package com.example.demo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ProductDA {

	public Product add(Product s) {

		try {
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/pos", "root", "nclc123456");
			PreparedStatement ps = con.prepareStatement("INSERT INTO product VALUES (?,?,?,?,?,?,?,?,?,?,?,?)");
			ps.setInt(1, s.getId());
			ps.setInt(2, s.getBarcode());
			ps.setString(3, s.getName());
			ps.setString(4, s.getDescription());
			ps.setInt(5, s.getQuantity());
			ps.setDouble(6, s.getPurchase_rate());
			ps.setDouble(7, s.getSales_rate());
			ps.setString(8, s.getSize());
			ps.setString(9, s.getCategory());
			ps.setString(10, s.getColors());
			ps.setInt(11, s.getStock());
			ps.setString(12, s.getSupplier());

			ps.executeUpdate();

		} catch (Exception e) {
			// TODO: handle exception
		}

		return s;
	}

//	------------------------------ search by barcode ----------------------------

	public List<Product> searchbybarcode(int barcode) {
		List<Product> slist=new ArrayList<>();
		try {
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/pos", "root", "nclc123456");
			PreparedStatement ps = con.prepareStatement("select * from product where barcode=? and stock>0");
			ps.setInt(1, barcode);
			
			
			ResultSet rs=ps.executeQuery();
			while (rs.next()) {
				slist.add(new Product(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4), 
						rs.getInt(5), rs.getDouble(6), rs.getDouble(7),rs.getString(8), rs.getString(9),
						rs.getString(10), rs.getInt(11),rs.getString(12)));
			}
			

		} catch (Exception e) {
			// TODO: handle exception
		}

		return slist;
	}
	
//	-------------------------- show all products ------------------------
	
	public List<Product> showallproduct() {
		List<Product> slist=new ArrayList<>();
		try {
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/pos", "root", "nclc123456");
			PreparedStatement ps = con.prepareStatement("select * from product");
			
			ResultSet rs=ps.executeQuery();
			while (rs.next()) {
				slist.add(new Product(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4), 
						rs.getInt(5), rs.getDouble(6), rs.getDouble(7),rs.getString(8), rs.getString(9),
						rs.getString(10), rs.getInt(11),rs.getString(12)));
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e);
		}

		return slist;
	}
	
	
//	...................Update Product (Quantity) 
	public void updateProduct(List<Product> product) {
		
		try {
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/pos", "root", "nclc123456");
			for(int i=0;i<product.size();i++) {
				PreparedStatement ps = con.prepareStatement("update product set stock=? where barcode=?");
				ps.setInt(1, product.get(i).getStock());
				ps.setInt(2, product.get(i).getBarcode());
				ps.executeUpdate();
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e);
		}
	}

	
	public Product salesProductUpdateown(Product s) {
		
		try {
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/pos", "root", "nclc123456");
				PreparedStatement ps = con.prepareStatement(
						"update product set name=?,description=?, quantity=?, purchase_rate=?, sales_rate=?, size=?, category=?, colors=?, stock=?, supplier=?, where barcode=?");

				ps.setString(1, s.getName());
				ps.setString(2, s.getDescription());
				ps.setInt(3, s.getQuantity());
				ps.setDouble(4, s.getPurchase_rate());
				ps.setDouble(5, s.getSales_rate());
				ps.setString(6, s.getSize());
				ps.setString(7, s.getCategory());
				ps.setString(8, s.getColors());
				ps.setInt(9, s.getStock());
				ps.setString(10, s.getSupplier());
				ps.setInt(11, s.getBarcode());
				
				ps.executeUpdate();
			
			
		} catch (Exception ex) {
			// TODO: handle exception
			System.out.println(ex);
		}
		
		return s;
	}

}
