import 'package:flutter/foundation.dart';
import '../models/product.dart';

/// Simple singleton-style service holding products added to the cart.
/// Implements a [ValueNotifier] to allow widgets to react when the
/// content changes. This keeps the rest of the app decoupled from
/// any state-management package.
class CartService {
  CartService._();

  static final List<Product> _items = [];

  /// Notifies listeners whenever the number of items changes.
  static final ValueNotifier<int> itemCount = ValueNotifier<int>(0);

  static void add(Product product) {
    _items.add(product);
    itemCount.value = _items.length;
  }

  static List<Product> get items => List.unmodifiable(_items);

  static double get total => _items.fold(0.0, (sum, p) => sum + p.price);

  static void clear() {
    _items.clear();
    itemCount.value = 0;
  }
}
