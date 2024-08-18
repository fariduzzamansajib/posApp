import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pos/db-class/product.dart';
import 'package:pos/inventory.dart'; // Make sure to update this import as per your app structure
import 'package:pos/main.dart';

// Helper function to convert JSON to Product list
List<Product> objectsFromJson(String str) =>
    List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

// Helper function to convert Product list to JSON
String objectsToJson(List<Product> data) =>
    json.encode(List<Product>.from(data).map((x) => x.toJson()));

class Addproduct extends StatefulWidget {
  const Addproduct({super.key, required this.product});
  final Product product;

  @override
  State<Addproduct> createState() => _AddproductState();
}

class _AddproductState extends State<Addproduct> {
  // URL for updating the product in the database
  final String _updateProductUrl = 'http://192.168.0.111:8080/salesProductUpdate';

  // TextEditingControllers for form fields
  final TextEditingController id = TextEditingController();
  final TextEditingController barcode = TextEditingController();
  final TextEditingController name = TextEditingController();
  final TextEditingController description = TextEditingController();
  final TextEditingController quantity = TextEditingController();
  final TextEditingController purchase_rate = TextEditingController();
  final TextEditingController sales_rate = TextEditingController();
  final TextEditingController size = TextEditingController();
  final TextEditingController category = TextEditingController();
  final TextEditingController colors = TextEditingController();
  final TextEditingController stock = TextEditingController();
  final TextEditingController supplier = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Initialize text controllers with current product values
    id.text = widget.product.id.toString();
    barcode.text = widget.product.barcode.toString();
    name.text = widget.product.name.toString();
    description.text = widget.product.description.toString();
    quantity.text = widget.product.quantity.toString();
    purchase_rate.text = widget.product.purchase_rate.toString();
    sales_rate.text = widget.product.sales_rate.toString();
    size.text = widget.product.size.toString();
    category.text = widget.product.category.toString();
    colors.text = widget.product.colors.toString();
    stock.text = widget.product.stock?.toString() ?? '';
    supplier.text = widget.product.supplier.toString();
  }

  // Method to update the product in the database
  Future<void> _updateProductInDatabase() async {
    // Prepare the updated product data
    final updatedProduct = Product(
      id: widget.product.id,
      barcode: widget.product.barcode,
      name: widget.product.name,
      description: widget.product.description,
      quantity: widget.product.quantity,
      purchase_rate: widget.product.purchase_rate,
      sales_rate: widget.product.sales_rate,
      size: widget.product.size,
      category: widget.product.category,
      colors: widget.product.colors,
      stock: widget.product.stock! + int.parse(stock.text),
      supplier: widget.product.supplier,
    );

    // Send POST request to update the product
    final response = await http.post(
      Uri.parse(_updateProductUrl),
      headers: {"Content-Type": "application/json"},
      body: json.encode(updatedProduct.toJson()),
    );

    // Check if the response is successful
    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Failed to update Inventory")));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Invantory updated successfully")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Add Products"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ..._buildTextFields(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: ElevatedButton(
                      onPressed: () async {
                        if (id.text.isEmpty || stock.text.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Please fill in all fields")));
                          return;
                        }
                        await _updateProductInDatabase();
                      },
                      child: Text(
                        "Update Product",
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurple,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: BottomNavigationBar(
                  backgroundColor: Colors.greenAccent,
                  items: [
                    BottomNavigationBarItem(
                      icon: Icon(Icons.home),
                      label: 'Home',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.person),
                      label: 'Profile',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.settings),
                      label: 'Settings',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MyApp(),
            ),
          );
        },
        tooltip: 'Back',
        child: const Icon(Icons.arrow_back),
      ),
    );
  }

  // Method to create text fields for the form
  List<Widget> _buildTextFields() {
    return [
      _buildTextField(controller: id, label: "Product Id"),
      _buildTextField(controller: barcode, label: "Barcode"),
      _buildTextField(controller: name, label: "Product Name"),
      _buildTextField(controller: description, label: "Description"),
      _buildTextField(controller: quantity, label: "Quantity"),
      _buildTextField(controller: purchase_rate, label: "Purchase Rate"),
      _buildTextField(controller: sales_rate, label: "Sales Rate"),
      _buildTextField(controller: size, label: "Size"),
      _buildTextField(controller: category, label: "Category"),
      _buildTextField(controller: colors, label: "Colors"),
      _buildTextField(controller: stock, label: "Stock"),
      _buildTextField(controller: supplier, label: "Supplier"),
    ];
  }

  // Method to build a single text field
  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
  }) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(30, 15, 30, 0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          hintText: label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
      ),
    );
  }
}
