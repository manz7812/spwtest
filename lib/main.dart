import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:spwtest/bloc/favorite_bloc/favorite_bloc.dart';
import 'package:spwtest/bloc/product_bloc/product_bloc.dart';
import 'package:spwtest/model/favorite_model.dart';
import 'package:spwtest/screen/cart_page.dart';
import 'package:spwtest/screen/home.dart';
import 'package:spwtest/screen/product_detail_page.dart';
import 'package:spwtest/screen/product_page.dart';
import 'injection.dart' as di;
import 'model/cart_model.dart';

void main() {
  runApp(MyApp());
  WidgetsFlutterBinding.ensureInitialized();
  di.init();
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//
//   }
// }
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => di.locator<ProductBloc>(),),
          BlocProvider(create: (context) => di.locator<FavoriteBloc>(),)
        ],
        child: ScopedModel<CartModel>(
          model: CartModel(),
          child: MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              // useMaterial3: true,
            ),
            home: const MyHomePage(),
            onGenerateRoute: (route) {},
            routes: {
              '/cart': (context) => CartPage(),
              '/productdetail': (context) => ProductDetailPage(id: null)
            },
          ),
        )
    );
  }
}


