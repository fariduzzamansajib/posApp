class Employee {
  int? id;
  String? name;
  String? phone;
  String? email;
  String? password;
  String? role;

  Employee(
      {required this.id,
      required this.name,
      required this.phone,
      required this.email,
      required this.password,
      required this.role});
  factory Employee.fromJson(Map<String, dynamic> json) => Employee(
      id: json['id'],
      name: json['name'],
      phone: json['phone'],
      email: json['email'],
      password: json['password'],
      role: json['role']);
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "phone": phone,
      "email": email,
      "password": password,
      "role": role,
    };
  }
}
