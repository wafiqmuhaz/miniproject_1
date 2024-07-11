import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:miniproject_1/bloc/cart_bloc/cart_bloc.dart';
import 'package:miniproject_1/bloc/cart_bloc/cart_state.dart';
import 'package:miniproject_1/model/cart_model.dart';
import 'package:miniproject_1/model/product_model.dart';
import 'package:miniproject_1/pages/cart_page/listview_cart.dart';
import 'package:miniproject_1/services/api_service.dart';

Future<List<ProductModel>> productFuture = ApiService().getProducts();

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<StatefulWidget> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  late Future<List<ProductModel>> futureProduct;
  @override
  void initState() {
    super.initState();
    futureProduct = productFuture;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const Text('Cart'),
            const SizedBox(
              width: 156,
            ),
            const Text(
              'Ubah',
              style: TextStyle(color: Colors.black54),
            ),
            const SizedBox(
              width: 8,
            ),
            IconButton(
                onPressed: () => {},
                icon: const Icon(
                  Icons.chat_bubble,
                  color: Colors.orange,
                ))
          ],
        ),
      ),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state is CartLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is CartError) {
            return Center(child: Text(state.error));
          } else if (state is CartLoaded) {
            final cart = state.cart;
            return contentBodyCart(cart);
          } else {
            return Container();
          }
        },
      ),
    );
  }

  Container bottomContent() => Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.6),
              offset: const Offset(2, 2),
              blurRadius: 3,
            ),
          ],
        ),
        child: Column(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total:',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Rp. 465858',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Container(
              width: 360,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
                onPressed: () {},
                child: const Text(
                  'Checkout',
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),
              ),
            )
          ],
        ),
      );

  Widget contentBodyCart(CartModel cart) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          contentProduct(cart.products),
          SizedBox(
            height: 70,
          ),
          bottomContent()
        ],
      ),
    );
  }

  Widget contentProduct(List<Products> product) {
    return FutureBuilder<List<ProductModel>>(
      future: futureProduct,
      builder: (context, snapshot) {
        final productIds = product.map((product) => product.productId).toList();
        List<ProductModel> filteredProducts = snapshot.data!
            .where((product) => productIds.contains(product.id))
            .toList();
        if (snapshot.data == null) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        } else if (snapshot.hasData) {
          return ListViewWidget(
            data: filteredProducts,
            cartProduct: product,
          );
        } else {
          return const Text('No products found');
        }
      },
    );
  }
}
