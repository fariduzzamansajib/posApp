package com.example.demo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.List;

public class SalesDA {
	public void saveSales(List<Sales> s) {

		try {
			for(int i=0;i<s.size();i++) {
				Connection con = DriverManager.getConnection("jdbc:mysql://localhost/pos", "root", "nclc123456");
				PreparedStatement ps = con.prepareStatement("INSERT INTO sales(salesDate,quantity,pId,transectionId) VALUES ('NOW()',?,?,?)");
				ps.setInt(1, s.get(i).getQuantity());
				ps.setInt(2, s.get(i).getpId());
				ps.setInt(3, s.get(i).getTransectionId());
				

				ps.executeUpdate();
			}
			

		} catch (Exception e) {
			// TODO: handle exception
		}

		
	}
}
