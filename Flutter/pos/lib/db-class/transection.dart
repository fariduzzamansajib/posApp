class Transection {
  int? transectionId;  // Changed to nullable to match JSON mapping
  String? paymentType;  // Changed to nullable to match JSON mapping
  int? grossSales;      // Changed to nullable to match JSON mapping
  int? discount;        // Changed to nullable to match JSON mapping
  int? netSales;        // Changed to nullable to match JSON mapping

  Transection({
    this.transectionId,  // Changed to optional (nullable) parameter
    this.paymentType,    // Changed to optional (nullable) parameter
    this.grossSales,     // Changed to optional (nullable) parameter
    this.discount,       // Changed to optional (nullable) parameter
    this.netSales,       // Changed to optional (nullable) parameter
  });

  factory Transection.fromJson(Map<String, dynamic> json) => Transection(
    transectionId: json['transectionId'] as int?,  // Cast to int? for nullable
    paymentType: json['paymentType'] as String?,   // Cast to String? for nullable
    grossSales: json['grossSales'] as int?,        // Cast to int? for nullable
    discount: json['discount'] as int?,             // Cast to int? for nullable
    netSales: json['netSales'] as int?,             // Cast to int? for nullable
  );

  Map<String, dynamic> toJson() {
    return {
      "transectionId": transectionId,  // No change
      "paymentType": paymentType,      // No change
      "grossSales": grossSales,        // No change
      "discount": discount,            // No change
      "netSales": netSales,            // No change
    };
  }
}
