import 'package:api/bloc/products_bloc.dart';
import 'package:api/repo/product_repo.dart';
import 'package:api/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import "./debug/bloc_observer.dart";

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(RepositoryProvider(
    lazy: true,
    create: (context) => ProductRepo(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      //here we have only one bloc we can add multiple bloc also with using multiblocprovider
      create: (context) => ProductsBloc(ProductRepo()),
      // ..add(ProductsLoadedEvent() //if we are using this than if our api is getting some issue in runtime then that will not affect to the user changes are only affect after restarting of the app
      //to overcome this we call the state in ui on product screen page
      // );

      child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const HomeScreen()),
    );
  }
}
