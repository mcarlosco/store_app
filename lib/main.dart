import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';

import 'src/data/repositories.dart';
import 'src/ui/widgets.dart';

void main() {
  GoogleFonts.config.allowRuntimeFetching = false;

  LicenseRegistry.addLicense(() async* {
    yield LicenseEntryWithLineBreaks(['google_fonts'],
        await rootBundle.loadString('assets/fonts/Lexend/OFL.txt'));
  });

  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations(const [DeviceOrientation.portraitUp]);

  _registerDataRepositories();

  runApp(const StoreApp());
}

void _registerDataRepositories() {
  GetIt.instance
    ..registerLazySingleton<ProductsRepository>(() => FakeProductsApi())
    ..registerLazySingleton<UsersRepository>(() => FakeUsersApi());
}
