import 'package:flutter/material.dart';
import '../../services/cart_service.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Carrito'),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              CartService.clear();
              setState(() {});
            },
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Builder(builder: (context) {
              final items = CartService.items;
              if (items.isEmpty) {
                return const Center(child: Text('Tu carrito está vacío'));
              }
              return ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: items.length,
                itemBuilder: (c, i) {
                  final p = items[i];
                  return Card(
                    child: ListTile(
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(p.imageUrl,
                            width: 56, height: 56, fit: BoxFit.cover),
                      ),
                      title: Text(p.title,
                          style: const TextStyle(fontSize: 16)),
                      subtitle: Text('\$${p.price}'),
                    ),
                  );
                },
              );
            }),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Text('Total: \$${CartService.total.toStringAsFixed(2)}',
                    style: const TextStyle(fontSize: 18,
                        fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Proceder al pago'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
