import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_demo/ui/my_home_page.dart';
import 'package:provider_demo/view_models/data_view_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider(
        create: (context) => DataViewModel(),
        child: const MyHomePage(),
      ),
    );
  }
}
