import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:my_key_maker/auth/auth.dart';
import 'package:my_key_maker/blocks/auth_block.dart';
import 'package:my_key_maker/cart.dart';
import 'package:my_key_maker/categories.dart';
import 'package:my_key_maker/home/home.dart';
import 'package:my_key_maker/localizations.dart';
import 'package:my_key_maker/product_detail.dart';
import 'package:my_key_maker/settings.dart';
import 'package:my_key_maker/shop/shop.dart';
import 'package:my_key_maker/styles/colors.dart';
import 'package:my_key_maker/wishlist.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final Locale locale = Locale('en');
  runApp(MultiProvider(
    providers: [ChangeNotifierProvider<AuthBlock>.value(value: AuthBlock())],
    child: MaterialApp(
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: [Locale('en'), Locale('ar')],
      locale: locale,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: PrimaryColor,
          accentColor: AccentColor,
          secondaryHeaderColor: SecondaryColor,
          fontFamily: 'Lato'),
      initialRoute: '/auth',
      routes: <String, WidgetBuilder>{
        '/': (BuildContext context) => Home(),
        '/auth': (BuildContext context) => Auth(),
        '/shop': (BuildContext context) => Shop(),
        '/categories': (BuildContext context) => Categories(),
        '/wishlist': (BuildContext context) => WishList(),
        '/cart': (BuildContext context) => CartList(),
        '/settings': (BuildContext context) => Settings(),
        '/products': (BuildContext context) => Products()
      },
    ),
  ));
}
