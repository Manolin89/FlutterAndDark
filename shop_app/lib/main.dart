import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './screens/edit_prodct_screen.dart';
import './screens/user_product_screen.dart';

import './providers/orders.dart';
import './providers/cart.dart';
import './screens/cart_screen.dart';
import './providers/product.dart';
import './screens/products_overwiev_screen.dart';
import './screens/prodcut_detail_screen.dart';
import './providers/prodcuts.dart';
import './screens/orders_screen.dart';
import './screens/auth_screen.dart';
import './providers/auth.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Auth(),
        ),
        ChangeNotifierProxyProvider<Auth, Products>(
          update: (ctx, auth, previousProducts) => Products(
              auth.token,
              auth.userId,
              previousProducts == null ? [] : previousProducts.items),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Cart(),
        ),
        ChangeNotifierProxyProvider<Auth, Orders>(
          update: (ctx, auth, previousOrders) => Orders(
              auth.token, previousOrders == null ? [] : previousOrders.orders),
        ),
      ],
      child: Consumer<Auth>(
        builder: (ctx, auth, _) => MaterialApp(
          title: 'My shop',
          theme: ThemeData(
            primarySwatch: Colors.purple,
            accentColor: Colors.deepOrange,
            fontFamily: 'Lato',
          ),
          home: auth.isAuth ? ProdcutsOverviewScreen() : AuthScreen(),
          routes: {
            ProdcutDetailScreen.routeName: (ctx) => ProdcutDetailScreen(),
            CratScreen.routeName: (ctx) => CratScreen(),
            OrdersScreen.routeName: (ctx) => OrdersScreen(),
            UserProductScreen.routeName: (ctx) => UserProductScreen(),
            EditProductScreen.routeName: (ctx) => EditProductScreen(),
          },
        ),
      ),
    );
  }
}
