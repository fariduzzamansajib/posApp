import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AddProductPage extends StatefulWidget {
  @override
  _AddProductPageState createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  final _formKey = GlobalKey<FormState>();
  final _product = Product(
    id: 0, // id will be assigned by the backend or can be optional
    barcode: null,
    name: '',
    description: '',
    quantity: null,
    purchase_rate: null,
    sales_rate: null,
    size: '',
    category: '',
    colors: '',
    stock: null,
    supplier: '',
  );

  final TextEditingController _barcodeController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();
  final TextEditingController _purchaseRateController = TextEditingController();
  final TextEditingController _salesRateController = TextEditingController();
  final TextEditingController _sizeController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();
  final TextEditingController _colorsController = TextEditingController();
  final TextEditingController _stockController = TextEditingController();
  final TextEditingController _supplierController = TextEditingController();

  @override
  void dispose() {
    _barcodeController.dispose();
    _nameController.dispose();
    _descriptionController.dispose();
    _quantityController.dispose();
    _purchaseRateController.dispose();
    _salesRateController.dispose();
    _sizeController.dispose();
    _categoryController.dispose();
    _colorsController.dispose();
    _stockController.dispose();
    _supplierController.dispose();
    super.dispose();
  }

  Future<void> _addProduct() async {
    if (_formKey.currentState!.validate()) {
      // Update the product object with the form data
      _product.barcode = int.tryParse(_barcodeController.text);
      _product.name = _nameController.text;
      _product.description = _descriptionController.text;
      _product.quantity = int.tryParse(_quantityController.text);
      _product.purchase_rate = double.tryParse(_purchaseRateController.text);
      _product.sales_rate = double.tryParse(_salesRateController.text);
      _product.size = _sizeController.text;
      _product.category = _categoryController.text;
      _product.colors = _colorsController.text;
      _product.stock = int.tryParse(_stockController.text);
      _product.supplier = _supplierController.text;

      final url = Uri.parse('http://192.168.0.111:8080/addProducts');
      final headers = {'Content-Type': 'application/json'};
      final body = jsonEncode(_product.toJson());

      try {
        final response = await http.post(
          url,
          headers: headers,
          body: body,
        );

        if (response.statusCode == 200) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Product added successfully!')),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Failed to add product. Status code: ${response.statusCode}')),
          );
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error occurred: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Purchase Product'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              _buildTextField(
                controller: _barcodeController,
                label: 'Barcode',
                keyboardType: TextInputType.number,
                validator: (value) => value == null || value.isEmpty ? 'Please enter a barcode' : null,
              ),
              _buildTextField(
                controller: _nameController,
                label: 'Name',
                validator: (value) => value == null || value.isEmpty ? 'Please enter a name' : null,
              ),
              _buildTextField(
                controller: _descriptionController,
                label: 'Description',
              ),
              _buildTextField(
                controller: _quantityController,
                label: 'Quantity',
                keyboardType: TextInputType.number,
                validator: (value) => value == null || value.isEmpty ? 'Please enter a quantity' : null,
              ),
              _buildTextField(
                controller: _purchaseRateController,
                label: 'Purchase Rate',
                keyboardType: TextInputType.numberWithOptions(decimal: true),
              ),
              _buildTextField(
                controller: _salesRateController,
                label: 'Sales Rate',
                keyboardType: TextInputType.numberWithOptions(decimal: true),
              ),
              _buildTextField(
                controller: _sizeController,
                label: 'Size',
              ),
              _buildTextField(
                controller: _categoryController,
                label: 'Category',
              ),
              _buildTextField(
                controller: _colorsController,
                label: 'Colors',
              ),
              _buildTextField(
                controller: _stockController,
                label: 'Stock',
                keyboardType: TextInputType.number,
              ),
              _buildTextField(
                controller: _supplierController,
                label: 'Supplier',
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _addProduct,
                child: Text('Add Product'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    TextInputType? keyboardType,
    String? Function(String?)? validator,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(color: Colors.pink), // Color of the label
          hintText: label,
          hintStyle: TextStyle(color: Colors.pink[300]), // Color of the hint text
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.pink, width: 2), // Border color when not focused
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.pinkAccent, width: 2), // Border color when focused
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        validator: validator,
      ),
    );
  }
}

class Product {
  int? id;
  int? barcode;
  String? name;
  String? description;
  int? quantity;
  double? purchase_rate;
  double? sales_rate;
  String? size;
  String? category;
  String? colors;
  int? stock;
  String? supplier;

  Product({
    required this.id,
    this.barcode,
    this.name,
    this.description,
    this.quantity,
    this.purchase_rate,
    this.sales_rate,
    this.size,
    this.category,
    this.colors,
    this.stock,
    this.supplier,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json['id'],
    barcode: json['barcode'],
    name: json['name'],
    description: json['description'],
    quantity: json['quantity'],
    purchase_rate: json['purchase_rate'],
    sales_rate: json['sales_rate'],
    size: json['size'],
    category: json['category'],
    colors: json['colors'],
    stock: json['stock'],
    supplier: json['supplier'],
  );

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "barcode": barcode,
      "name": name,
      "description": description,
      "quantity": quantity,
      "purchase_rate": purchase_rate,
      "sales_rate": sales_rate,
      "size": size,
      "category": category,
      "colors": colors,
      "stock": stock,
      "supplier": supplier,
    };
  }
}
