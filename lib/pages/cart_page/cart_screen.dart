import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:miniproject_1/bloc/cart_bloc/cart_bloc.dart';
import 'package:miniproject_1/bloc/cart_bloc/cart_event.dart';
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
        title: Text('Cart'),
      ),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state is CartLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is CartError) {
            return Center(child: Text(state.error));
          } else if (state is CartLoaded) {
             final cart = state.cart;
                  final productIds = cart.products.map((product) => product.productId).toList();
            return contentBodyCart(cart);
           

          } else {
            return Container();
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          BlocProvider.of<CartBloc>(context).add(GetCartsEvent());
        },
        child: Icon(Icons.refresh),
      ),
    );
  }

  Widget contentBodyCart(CartModel cart){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Cart ID: ${cart.id}, User ID: ${cart.userId}'),
        SizedBox(height: 30,),
        contentProduct(cart.products)
      ],

    );
  }

  Widget contentProduct(List<Products>  product) {
    return FutureBuilder<List<ProductModel>>(
       future: futureProduct,
       builder: (context, snapshot) {
        final productIds =
            product.map((product) => product.productId).toList();
         List<ProductModel> filteredProducts = snapshot.data!
            .where((product) => productIds.contains(product.id))
            .toList();
       

          if (snapshot.data == null) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          } else if (snapshot.hasData) {
            return ListViewWidget(data: filteredProducts,);
          } else {
            return const Text('No comments found');
          }
        },
        );
  }
}
