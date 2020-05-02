import 'package:yummi/models/pizzaModel.dart';

class CartItem {
  PizzaModel pizza;
  int quantity;
  double totalPrice;

  CartItem({this.pizza, this.quantity, this.totalPrice});
}
