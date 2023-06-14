import 'package:flutter/material.dart';
import 'api_service.dart';

class Page1 extends StatefulWidget {
  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  APIService apiService = APIService();
  late Future<Map<String, ProductSchema>> _productsFuture;

  @override
  void initState() {
    super.initState();
    _productsFuture = apiService.fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Beast bytes'),
      ),
      body: FutureBuilder<Map<String, ProductSchema>>(
        future: _productsFuture,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final products = snapshot.data!.values.toList();
            return ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return ListTile(
                  leading: Image.network(product.image),
                  title: Text(product.particular),
                  subtitle: Text(product.description),
                  trailing: Text('\$${product.price.toStringAsFixed(2)}'),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
