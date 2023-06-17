import 'dart:convert';
import 'package:http/http.dart' as http;

class APIService {
  static const String baseURL =
      'https://pfeqsoeas0.execute-api.us-east-1.amazonaws.com/v1/beastxd';

  Future<Map<String, ProductSchema>> fetchProducts() async {
    try {
      final response = await http.get(Uri.parse(baseURL));
      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);
        Map<String, ProductSchema> products = {};
        responseData.forEach((key, value) {
          products[key] = ProductSchema.fromJson(value);
        });
        return products;
      } else {
        throw Exception('Failed to fetch products');
      }
    } catch (e) {
      throw Exception('Failed to connect to the API');
    }
  }
}

class ProductSchema {
  final String availability;
  final String categoryName;
  final String categoryType;
  final String department;
  final String description;
  final int foodQuantity;
  final String gst;
  final String image;
  final String kitchen;
  final String menuId;
  final String particular;
  final int price;
  final String productId;
  final String restaurantId;
  final String timeFrom;
  final String timeFrom2;
  final String timeFrom3;
  final String timeTo;
  final String timeTo2;
  final String timeTo3;

  ProductSchema({
    required this.availability,
    required this.categoryName,
    required this.categoryType,
    required this.department,
    required this.description,
    required this.foodQuantity,
    required this.gst,
    required this.image,
    required this.kitchen,
    required this.menuId,
    required this.particular,
    required this.price,
    required this.productId,
    required this.restaurantId,
    required this.timeFrom,
    required this.timeFrom2,
    required this.timeFrom3,
    required this.timeTo,
    required this.timeTo2,
    required this.timeTo3,
  });

  factory ProductSchema.fromJson(Map<String, dynamic> json) {
    return ProductSchema(
      availability: json['availability'],
      categoryName: json['categoryName'],
      categoryType: json['categoryType'],
      department: json['department'],
      description: json['description'],
      foodQuantity: json['foodQuantity'],
      gst: json['gst'],
      image: json['image'],
      kitchen: json['kitchen'],
      menuId: json['menuId'],
      particular: json['particular'],
      price: json['price'],
      productId: json['productId'],
      restaurantId: json['restaurantId'],
      timeFrom: json['timeFrom'],
      timeFrom2: json['timeFrom2'],
      timeFrom3: json['timeFrom3'],
      timeTo: json['timeTo'],
      timeTo2: json['timeTo2'],
      timeTo3: json['timeTo3'],
    );
  }
}
