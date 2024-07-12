package com.example.demo;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class EmployeeDA {
	public Employee save(Employee s) {

		try {
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/pos", "root", "nclc123456");
			PreparedStatement ps = con.prepareStatement("INSERT INTO employee VALUES (?,?,?,?,?,?)");
			ps.setInt(1, s.getId());
			ps.setString(2, s.getName());
			ps.setString(3, s.getPhone());
			ps.setString(4, s.getEmail());
			ps.setString(5, s.getPassword());
			ps.setString(6, s.getRole());

			ps.executeUpdate();

		} catch (Exception e) {
			// TODO: handle exception
		}

		return s;
	}
	
//	------------Login
	
	public Employee login(String email, String password) {
		Employee e =null;
		try {
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/pos", "root", "nclc123456");
			PreparedStatement pst1 = con.prepareStatement("select * from employee where email=? AND password=?");
			pst1.setString(1, email);
			pst1.setString(2, password);
			ResultSet rs = pst1.executeQuery();
			while (rs.next()) {
				e=new Employee(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6));
			}

		} catch (Exception ex) {
			// TODO: handle exception
		}

		return e;
	}
	
//	----------------Show all employee
	
	
	
	public List<Employee> showallemployee() {
		List<Employee> elist=new ArrayList<>();
		try {
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/pos", "root", "nclc123456");
			PreparedStatement ps = con.prepareStatement("select * from employee");
			
			ResultSet rs=ps.executeQuery();
			while (rs.next()) {
				elist.add(new Employee(rs.getInt(1),rs.getString(2), rs.getString(3),rs.getString(4),rs.getString(5),
						rs.getString(6)));
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			
		}

		return elist;
	}

}
