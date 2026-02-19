import '../models/product.dart';

class ProductService {
  /// Returns a hard‑coded list of products after a short delay to mimic
  /// fetching from a remote API. The delay allows callers such as
  /// [FutureBuilder] to behave as expected.
  static Future<List<Product>> fetchProducts() async {
    await Future.delayed(const Duration(milliseconds: 500));
    return getProducts();
  }

  /// Synchronous helper used internally and also useful for tests.
  static List<Product> getProducts() {
    return [
      Product(
        id: 1,
        title: 'Laptop Gamer',
        description: 'Laptop de alto rendimiento para gaming.',
        price: 1200.0,
        imageUrl: 'https://images.unsplash.com/photo-1640955014216-75201056c829?q=80&w=1632&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      ),
      Product(
        id: 2,
        title: 'Smartphone Pro',
        description: 'Teléfono inteligente de última generación.',
        price: 899.0,
        imageUrl: 'https://images.unsplash.com/photo-1595941069915-4ebc5197c14a?q=80&w=880&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      ),
      Product(
        id: 3,
        title: 'Audífonos',
        description: 'Audífonos inalámbricos con cancelación de ruido.',
        price: 199.0,
        imageUrl: 'https://plus.unsplash.com/premium_photo-1679513691474-73102089c117?q=80&w=1113&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      ),
      Product(
        id: 4,
        title: 'Smartwatch',
        description: 'Reloj inteligente deportivo.',
        price: 299.0,
        imageUrl: 'https://images.unsplash.com/photo-1579586337278-3befd40fd17a?q=80&w=1172&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      ),
    ];
  }
}
