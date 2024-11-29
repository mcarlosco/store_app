import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../domain/entities.dart';
import '../../ui/notifiers.dart';
import '../../ui/screens.dart';

final class StoreApp extends StatelessWidget {
  const StoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ProductsNotifier>(
          create: (_) => ProductsNotifier(GetIt.instance()),
        ),
        ChangeNotifierProvider<UsersNotifier>(
          create: (_) => UsersNotifier(GetIt.instance()),
        ),
        ChangeNotifierProvider<ShoppingNotifier>(
          create: (_) => ShoppingNotifier(),
        ),
      ],
      child: MaterialApp(
        title: 'Store App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.brown),
          useMaterial3: true,
          textTheme: GoogleFonts.lexendTextTheme(),
        ),
        routes: {
          detailsScreenPath: (context) => DetailsScreen(
              product:
                  ModalRoute.of(context)!.settings.arguments as ProductEntity),
          catalogScreenPath: (_) => const CatalogScreen(),
        },
        home: const HomeScreen(),
      ),
    );
  }
}
