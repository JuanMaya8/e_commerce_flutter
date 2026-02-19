import '../models/product.dart';

/// Simple singleton-style service holding products added to the cart.
/// This is not thread-safe or persistent, but it's enough for the demo.
class CartService {
  CartService._();

  static final List<Product> _items = [];

  static void add(Product product) {
    _items.add(product);
  }

  static List<Product> get items => List.unmodifiable(_items);

  static double get total => _items.fold(0.0, (sum, p) => sum + p.price);

  static void clear() {
    _items.clear();
  }
}
