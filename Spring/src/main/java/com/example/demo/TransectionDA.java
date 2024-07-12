package com.example.demo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class TransectionDA {
//	.............................Sales table

	public void saveTransection(Transection t) {
		try {
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/pos", "root", "nclc123456");
			PreparedStatement ps = con.prepareStatement("insert into transection values(?,?,?,?,?)");
			ps.setInt(1, t.getTransectionId());
			ps.setString(2,t.getPaymentType());
			ps.setInt(3, t.getGrossSales());
			ps.setInt(4,t.getDiscount());
			ps.setInt(5, t.getNetSales());
			
			ps.executeUpdate();
			

		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e);
		}
	}
	
	
//	.........................Search By Transection Id
	Transection ransectionID=new Transection();
	public Transection getTransectionId() {
		try {
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/pos", "root", "nclc123456");
			PreparedStatement ps = con.prepareStatement("select * from transection where transectionId=max(transectionId)");
			ResultSet rs=ps.executeQuery();
			
			while (rs.next()) {
				ransectionID=new Transection(rs.getInt(1),rs.getString(2),rs.getInt(3),rs.getInt(4),rs.getInt(5));
			}

		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return ransectionID;
	}
	
//	Show Data in Transection Table
	
	public List<Transection> showalltransection() {
		List<Transection> tlist=new ArrayList<>();
		try {
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/pos", "root", "nclc123456");
			PreparedStatement ps = con.prepareStatement("select * from transection");
			
			ResultSet rs=ps.executeQuery();
			while (rs.next()) {
				tlist.add((new Transection(rs.getInt(1),rs.getString(2),rs.getInt(3),rs.getInt(4),rs.getInt(5))));
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e);
		}

		return tlist;
	}
}
