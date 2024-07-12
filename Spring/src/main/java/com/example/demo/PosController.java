package com.example.demo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
//This is anular conntect link
//@CrossOrigin(origins="http://localhost:4200/")

@CrossOrigin(origins = "*")
//This is flutter connect link

public class PosController {
	
//	Registration
	@PostMapping("/insert")
	public Employee doSave(@RequestBody Employee s) {
		
		EmployeeDA da = new EmployeeDA();
		Employee data=  da.save(s);

		return data;
	}
	
	
//	Login 
	@GetMapping("/{email}/{password}")
	public Employee login(@PathVariable String email,@PathVariable String password) {
		EmployeeDA da= new EmployeeDA();
		Employee data = da.login(email,password);
		return data;
	}
	
//	------------------------ search by barcode --------------------- showallproduct
	List<Product> slist=new ArrayList<>();
	
	@GetMapping("/searchbybarcode/{barcode}")
	public List<Product> searchbybarcode(@PathVariable int barcode) {
		ProductDA da = new ProductDA();
		slist=  da.searchbybarcode(barcode);

		return slist;
	}
	
//	------------------------show all product --------------------- 
	@GetMapping("/showallproduct")
	public List<Product> showallproduct() {
		ProductDA da = new ProductDA();
		slist=null;
		slist=  da.showallproduct();
		return slist;
	}
	
//	Add Product
	
	@PostMapping("/addProducts")
	public Product add(@RequestBody Product s) {
		
		ProductDA da = new ProductDA();
		Product data=  da.add(s);

		return data;
	}
	
//	------------------------show all Employee --------------------- 
	List<Employee> elist=new ArrayList<>();
	@GetMapping("/showallemployee")
	public List<Employee> showallemployee(){
		EmployeeDA da = new EmployeeDA();
		elist=null;
		elist= da.showallemployee();
		return elist;
		
		
	}

	@PostMapping("/salesProductUpdate")
	public void salesProductUpdate(@RequestBody List<Product> product) {
		ProductDA da=new ProductDA();
		da.updateProduct(product);
		System.out.println("Product update works");
	}
	

	@PostMapping("/saveSales")
	public void saveSales(@RequestBody List<Sales> sales) {
		SalesDA da=new SalesDA();
		da.saveSales(sales);
		System.out.println("Sales save works");
	}
	
	@GetMapping("/transectionId")
	
	public Transection transectionId(){
		
		TransectionDA da=new TransectionDA();
		return da.getTransectionId();
		
		
	}
	
	@PostMapping("/saveTransection")
	public void saveTransection(@RequestBody Transection t) {
		TransectionDA da = new TransectionDA();
		da.saveTransection(t);
		System.out.println("saveTransection save works");
	}
	
	
//	------------------------show all Transection --------------------- 
	List<Transection> tlist=new ArrayList<>();
	@GetMapping("/showalltransection")
	public List<Transection> showalltransection(){
		TransectionDA da = new TransectionDA();
		tlist=null;
		tlist= da.showalltransection();
		return tlist;
		
		
	}
	
}
