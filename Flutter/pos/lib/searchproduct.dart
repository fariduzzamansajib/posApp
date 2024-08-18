import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pos/db-class/product.dart';
import 'dart:developer' as developer;

import 'package:pos/db-class/transection.dart';
import 'package:pos/main.dart';

class SearchProduct extends StatefulWidget {
  const SearchProduct({super.key});

  @override
  State<SearchProduct> createState() => _SearchProductState();
}

class _SearchProductState extends State<SearchProduct> {
  final TextEditingController _barcodeController = TextEditingController();
  final List<Map<String, dynamic>> _cart = [];
  final List<Product> _productList = []; // Array to store products with updated stock

  Future<Product?> fetchProductByBarcode(int barcode) async {
    final String baseUrl = 'http://192.168.0.111:8080';
    final String endpoint = '/searchbybarcode/$barcode';
    final Uri url = Uri.parse('$baseUrl$endpoint');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        return Product.fromJson(data);
      } else {
        print('Failed to load product: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('Error occurred: $e');
      return null;
    }
  }

  void _showProductDialog(Product product) {
    final TextEditingController _quantityController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Product Details'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Name: ${product.name}'),
              Text('Price: \$${product.sales_rate ?? 0.0}'),
              Text('Stock: ${product.stock ?? 0}'),
              SizedBox(height: 16),
              TextField(
                controller: _quantityController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Enter quantity'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                final int quantity = int.tryParse(_quantityController.text) ?? 0;

                if (quantity > 0) {
                  setState(() {
                    final existingProductIndex = _cart.indexWhere((item) => item['product'].barcode == product.barcode);

                    if (existingProductIndex != -1) {
                      _cart[existingProductIndex]['quantity'] += quantity;
                    } else {
                      _cart.add({'product': product, 'quantity': quantity});
                    }

                    final existingProductInListIndex = _productList.indexWhere((p) => p.barcode == product.barcode);

                    if (existingProductInListIndex != -1) {
                      final currentStock = _productList[existingProductInListIndex].stock ?? 0;
                      _productList[existingProductInListIndex].stock = (currentStock - quantity).clamp(0, double.infinity).toInt();
                    } else {
                      final updatedProduct = Product(
                        id: product.id,
                        barcode: product.barcode,
                        name: product.name,
                        description: product.description,
                        quantity: product.quantity,
                        purchase_rate: product.purchase_rate,
                        sales_rate: product.sales_rate,
                        size: product.size,
                        category: product.category,
                        colors: product.colors,
                        stock: (product.stock ?? 0) - quantity,
                        supplier: product.supplier,
                      );
                      _productList.add(updatedProduct);
                    }
                    developer.log('Product List: ${_productList.map((p) => p.toJson()).toList()}',
                        name: 'SearchProduct',
                        level: 800);
                  });
                }
              },
              child: Text('Add to Cart'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  void _searchProduct() async {
    final int barcode = int.tryParse(_barcodeController.text) ?? 0;

    if (barcode > 0) {
      final Product? product = await fetchProductByBarcode(barcode);

      if (product != null) {
        _showProductDialog(product);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Product not found')));
      }
    }
  }

  void _showSaleDialog() {
    final TextEditingController _discountController = TextEditingController(text: '0');

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Enter Discount'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _discountController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Enter discount amount'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () async {
                final int discount = int.tryParse(_discountController.text) ?? 0;

                final double totalAmount = _cart.fold<double>(0.0, (sum, item) => sum + (item['quantity'] as int) * (item['product'].sales_rate ?? 0.0));
                final double netAmount = totalAmount - discount;

                final transaction = Transection(
                  transectionId: null,
                  paymentType: 'Cash Payment',
                  grossSales: totalAmount.toInt(),
                  discount: discount,
                  netSales: netAmount.toInt(),
                );
                Navigator.of(context).pop();

                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('Sale Summary'),
                      content: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ..._cart.map((item) {
                              final Product product = item['product'];
                              final int quantity = item['quantity'];
                              final double total = quantity * (product.sales_rate ?? 0.0);

                              return ListTile(
                                title: Text('${product.name} (x$quantity)'),
                                subtitle: Text('Price: \$${product.sales_rate}'),
                                trailing: Text('Total: \$${total.toStringAsFixed(2)}'),
                              );
                            }).toList(),
                            SizedBox(height: 16),
                            Text('Total Amount: \$${totalAmount.toStringAsFixed(2)}'),
                            Text('Discount: \$${discount.toStringAsFixed(2)}'),
                            Text('Net Amount: \$${netAmount.toStringAsFixed(2)}'),
                          ],
                        ),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () async{
                            // Confirm Sale action
                            // TODO: Implement the confirm sale functionality
                            //Navigator.of(context).pop();  // Close the dialog
                            // Show progress indicator while processing
                            showDialog(
                              context: context,
                              barrierDismissible: false,
                              builder: (context) {
                                return Center(
                                  child: CircularProgressIndicator(),
                                );
                              },
                            );

                            try {
                              // Save transaction
                              final saveResponse = await http.post(
                                Uri.parse('http://192.168.0.111:8080/saveTransection'),
                                headers: {'Content-Type': 'application/json'},
                                body: json.encode(transaction.toJson()),
                              );

                              if (saveResponse.statusCode == 200) {
                                // Update sale products
                                final updateResponse = await http.post(
                                  Uri.parse('http://192.168.0.111:8080/salesProductUpdate'),
                                  headers: {'Content-Type': 'application/json'},
                                  body: json.encode(_productList.map((p) => p.toJson()).toList()),
                                );

                                if (updateResponse.statusCode == 200) {
                                  // Fetch last transaction
                                  final lastTransaction = await _fetchLastTransaction();

                                  if (lastTransaction != null) {
                                    Navigator.of(context).pop(); // Close the progress indicator
                                    Navigator.of(context).pop();
                                    // Show invoice
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return Scaffold(
                                          appBar: AppBar(title: Text('Invoice')),
                                          body: SingleChildScrollView(
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text('Invoice No: ${lastTransaction.transectionId}'),
                                                Text('Payment Type: ${lastTransaction.paymentType}'),
                                                ..._cart.map((item) {
                                                  final Product product = item['product'];
                                                  final int quantity = item['quantity'];
                                                  final double total = quantity * (product.sales_rate ?? 0.0);

                                                  return ListTile(
                                                    title: Text('${product.name} (x$quantity)'),
                                                    subtitle: Text('Price: \$${product.sales_rate}'),
                                                    trailing: Text('Total: \$${total.toStringAsFixed(2)}'),
                                                  );
                                                }).toList(),
                                                SizedBox(height: 16),
                                                Text('Total Amount: \$${(lastTransaction.grossSales ?? 0.0).toStringAsFixed(2)}'),
                                                Text('Discount: \$${(lastTransaction.discount ?? 0.0).toStringAsFixed(2)}'),
                                                Text('Net Amount: \$${(lastTransaction.netSales ?? 0.0).toStringAsFixed(2)}'),
                                                SizedBox(height: 16),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                  children: [
                                                    ElevatedButton(
                                                      onPressed: () {
                                                        // Implement the print functionality here
                                                      },
                                                      child: Text('Print'),
                                                    ),
                                                    ElevatedButton(
                                                      onPressed: () { 
                                                        Navigator.of(context).pop();
                                                        Navigator.push(context, MaterialPageRoute(builder: (context)=>MyApp()));
                                                        },
                                                      child: Text('Cancel'),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  } else {
                                    Navigator.of(context).pop(); // Close the progress indicator
                                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Failed to fetch transaction details')));
                                  }
                                } else {
                                  Navigator.of(context).pop(); // Close the progress indicator
                                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Failed to update sale products')));
                                }
                              } else {
                                Navigator.of(context).pop(); // Close the progress indicator
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Failed to save transaction')));
                              }
                            } catch (e) {
                              Navigator.of(context).pop(); // Close the progress indicator
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('An error occurred: $e')));
                            }
                          },
                          child: Text('Confirm Sale'),
                        ),
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: Text('Cancel'),
                        ),
                      ],
                    );
                  },
                );


              },
              child: Text('OK'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  Future<Transection?> _fetchLastTransaction() async {
    final String baseUrl = 'http://192.168.0.111:8080';
    final String endpoint = '/lasttransection';
    final Uri url = Uri.parse('$baseUrl$endpoint');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        if (response.body.isNotEmpty) {
          final Map<String, dynamic> data = json.decode(response.body);
          return Transection.fromJson(data);
        } else {
          print('Empty response body');
          return null;
        }
      } else {
        print('Failed to fetch last transaction: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('Error occurred while fetching last transaction: $e');
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    int totalQuantity = _cart.fold<int>(0, (sum, item) => sum + (item['quantity'] as int));
    double totalBill = _cart.fold<double>(0.0, (sum, item) => sum + (item['quantity'] as int) * (item['product'].sales_rate ?? 0.0));

    return Scaffold(
      appBar: AppBar(title: Text('Search Product')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _barcodeController,
              decoration: InputDecoration(
                labelText: 'Enter Barcode',
                suffixIcon: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: _searchProduct,
                ),
              ),
              keyboardType: TextInputType.number,
            ),
            Expanded(
              child: ListView(
                children: _cart.map((item) {
                  final Product product = item['product'];
                  final int quantity = item['quantity'];

                  return ListTile(
                    title: Text('${product.name} (x$quantity)'),
                    subtitle: Text('Price: \$${product.sales_rate}'),
                    trailing: Text('Total: \$${(quantity * product.sales_rate!).toStringAsFixed(2)}'),
                  );
                }).toList(),
              ),
            ),
            SizedBox(height: 16),
            Text('Total Quantity: $totalQuantity'),
            Text('Total Bill: \$${totalBill.toStringAsFixed(2)}'),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _showSaleDialog,
              child: Text('Sale'),
            ),
          ],
        ),
      ),
    );
  }
}
