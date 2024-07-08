import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/user_bloc/user_bloc.dart';
import 'bloc/user_bloc/user_event.dart';
import 'pages/home_page/home_page.dart';
import 'services/api_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<UserBloc>(
          create: (context) => UserBloc(ApiService())..add(LoadUserEvent()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'E-commerce App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomePage(),
      ),
    );
  }
}