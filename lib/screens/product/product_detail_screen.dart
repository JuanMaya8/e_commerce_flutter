import 'package:flutter/material.dart';
import '../../models/product.dart';
import '../../services/cart_service.dart';

class ProductDetailScreen extends StatelessWidget {
  final Product product;

  const ProductDetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(product.title)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Hero(
                tag: 'product-${product.id}',
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(product.imageUrl,
                      height: 200, fit: BoxFit.cover),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(product.title,
                style: const TextStyle(
                    fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text('\$${product.price}',
                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87)),
            const SizedBox(height: 16),
            Text(product.description,
                style: const TextStyle(color: Colors.black54)),
            const SizedBox(height: 24),
            Center(
              child: ElevatedButton.icon(
                onPressed: () {
                  CartService.add(product);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Producto agregado al carrito')),
                  );
                },
                icon: const Icon(Icons.add_shopping_cart),
                label: const Text('Añadir al carrito'),
                style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 32)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
