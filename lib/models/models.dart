import 'dart:convert';

class Order {
  int id;
  String status;
  int price;
  String createdAt;
  Customer customer;
  List<Product> products;

  Order({
    required this.id,
    required this.status,
    required this.price,
    required this.createdAt,
    required this.customer,
    required this.products,
  });

  factory Order.fromRawJson(String str) => Order.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Order.fromJson(Map<String, dynamic> json) => Order(
        id: json["id"],
        status: json["status"],
        price: json["price"],
        createdAt: json["created_at"],
        customer: Customer.fromJson(json["customer"]),
        products: List<Product>.from(
            json["products"].map((x) => Product.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "status": status,
        "price": price,
        "created_at": createdAt,
        "customer": customer.toJson(),
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
      };

  String info() {
    return "Order #$id";
  }
}

class Customer {
  String id;
  String firstName;
  String lastName;
  String address;

  Customer({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.address,
  });

  factory Customer.fromRawJson(String str) =>
      Customer.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
        id: json["id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        address: json["address"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": firstName,
        "last_name": lastName,
        "address": address,
      };
}

class Product {
  String id;
  String name;
  String description;
  int price;
  int count;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.count,
  });

  factory Product.fromRawJson(String str) => Product.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        price: json["price"],
        count: json["count"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "price": price,
        "count": count,
      };
}

class AccountCredentials {
  String email;
  String password;

  AccountCredentials({
    required this.email,
    required this.password,
  });

  factory AccountCredentials.fromRawJson(String str) =>
      AccountCredentials.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AccountCredentials.fromJson(Map<String, dynamic> json) =>
      AccountCredentials(
        email: json["email"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
      };

  @override
  String toString() {
    return "$email:$password";
  }
}

class Account {
  String id;
  String email;
  String firstName;
  String lastName;

  Account({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
  });

  factory Account.fromRawJson(String str) => Account.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Account.fromJson(Map<String, dynamic> json) => Account(
        id: json["id"],
        email: json["email"],
        firstName: json["first_name"],
        lastName: json["last_name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "first_name": firstName,
        "last_name": lastName,
      };
}
