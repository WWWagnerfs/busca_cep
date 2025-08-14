import 'package:busca_cep/core/theme/app_theme.dart';
import 'package:busca_cep/ui/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const BuscaCepApp());
}

class BuscaCepApp extends StatelessWidget {
  const BuscaCepApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Consulta de Cep',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      home: HomeScreen(),
    );
  }
}
