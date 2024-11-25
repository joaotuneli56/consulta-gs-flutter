import 'package:appgs/EletropostoPage.dart';
import 'package:appgs/EletropostoProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => EletropostoProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: EletropostoScreen(),
      ),
    );
  }
}
