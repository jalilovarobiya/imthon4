import 'package:flutter/material.dart';
import 'package:imthon3/viewmodels/card_viewmodel.dart';
import 'package:imthon3/viewmodels/orders_viewmodel.dart';
import 'package:imthon3/views/screens/delivary.dart';
import 'package:provider/provider.dart';

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
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        backgroundColor: Colors.amber,
        title: Text("Savatcha"),
      ),
      body: Consumer<CartViewmodel>(
        builder: (context, cartView, child) {
          return ListView.separated(
            padding: EdgeInsets.all(20),
            itemCount: cartView.cartProducts.length,
            separatorBuilder: (context, index) => SizedBox(height: 20),
            itemBuilder: (ctx, index) {
              final product = cartView.cartProducts[index];
              return ListTile(
                leading: Image.network(product.image),
                title: Text("- ${product.name} \$${product.price}"),
                trailing: IconButton(
                  onPressed: () {
                    cartView.removeFromCart(product.id);
                  },
                  icon: Icon(Icons.remove),
                ),
              );
            },
          );
        },
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(20),
        width: double.infinity,
        height: 100,
        decoration: BoxDecoration(
          color: Colors.red,
          border: Border(top: BorderSide()),
        ),
        child: Consumer<CartViewmodel>(
          builder: (context, cartView, child) {
            return Row(
              children: [
                Text(
                  "Umumiy: \$${cartView.getTotal()}",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                Spacer(),
                Consumer<OrdersVievmodel>(
                  builder: (context, orderModel, child) {
                    return FilledButton(
                      onPressed: () {
                        orderModel.addToOrder(cartView.cartProducts);
                        cartView.order();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (ctx) {
                              return Delivary();
                            },
                          ),
                        );
                      },
                      child: Text("Buyurtma bersh"),
                    );
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
