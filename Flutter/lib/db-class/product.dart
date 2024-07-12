class Product{

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


  Product({required this.id,  this.barcode, this.name, this.description, this.quantity,this.purchase_rate, this.sales_rate, this.size, this.category,this.colors, this.stock, this.supplier});
  factory Product.fromJson(Map<String,dynamic> json) => Product(id:json['id'], barcode: json['barcode'], name: json['name'], description: json['description'], quantity: json['quantity'],purchase_rate:json['purchase_rate'], sales_rate: json['sales_rate'], size: json['size'], category: json['category'], colors: json['colors'],stock: json['stock'], supplier: json['supplier']);
  Map<String,dynamic> toJson(){

    return{
      "id":id,
      "barcode":barcode,
      "name":name,
      "description":description,
      "quantity": quantity,
      "purchase_rate":purchase_rate,
      "sales_rate":sales_rate,
      "size":size,
      "category":category,
      "colors": colors,
      "stock":stock,
      "supplier": supplier
    };

  }

}