import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:miniproject_1/bloc/cart_bloc/cart_bloc.dart';
import 'package:miniproject_1/bloc/cart_bloc/cart_event.dart';
import 'package:miniproject_1/bloc/product_bloc/product_bloc.dart';
import 'package:miniproject_1/bloc/product_bloc/product_event.dart';
import 'package:miniproject_1/routes/routers.dart';
import 'bloc/user_bloc/user_bloc.dart';
import 'bloc/user_bloc/user_event.dart';
import 'services/api_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //MultiBlocProvider: Menyediakan beberapa BLoC ke tree/context/setiap widget yang berhubungan.
    return MultiBlocProvider(
      providers: [
        //UserBloc: inisialisasi dengan ApiService dan LoadUserEvent.
        BlocProvider<UserBloc>(
          create: (context) => UserBloc(ApiService())..add(LoadUserEvent()),
        ),
        BlocProvider<CartBloc>(
          create: (context) => CartBloc(ApiService())..add(GetCartsEvent()),
        ),
        BlocProvider<ProductBloc>(
          create: (context) =>
              ProductBloc(ApiService())..add(LoadProductsEvent()),
        )
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'E-commerce App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routerConfig: AppRouter.shared.router,
      ),
    );
  }
}
