class Employee{

  int? id;
  String? name;
  String? phone;
  String? email;
  String? password;
  String? role;

  Employee({required this.id,  this.name, this.email, this.password, this.role });
  factory Employee.fromJson(Map<String,dynamic> json) => Employee(id:json['id'], name: json['name'], email: json['email'], password: json['password'], role: json['role'] );
  Map<String,dynamic> toJson(){

    return{
      "id":id,
      "name":name,
      "email":email,
      "password":password,
      "role": role
    };

  }

}