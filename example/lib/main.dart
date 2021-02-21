import 'package:flutter/material.dart';
import 'package:momentum/momentum.dart';

import 'src/_config/index.dart';
import 'src/_config/persistence/index.dart';
import 'src/_config/storage/index.dart';
import 'src/widgets/pages/home/index.dart';

void main() {
  runApp(momentum());
}

Momentum momentum() {
  return Momentum(
    child: MyApp(),
    initializer: () async {
      await initializeSharedPref();
    },
    controllers: controllers(),
    services: services(),
    persistSave: persistSave_SharedPref,
    persistGet: persistGet_SharedPref,
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Momentum Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.purple,
        accentColor: Colors.pink,
        colorScheme: ColorScheme.dark(
          primary: Colors.purple,
          onPrimary: Colors.white,
          secondary: Colors.pink,
          onSecondary: Colors.white,
        ),
        backgroundColor: Color(0xff222222),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
