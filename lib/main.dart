import 'package:flutter/material.dart';
import 'package:atividade_avaliativa_1/app/data/usuario_mock_store.dart';
import 'package:atividade_avaliativa_1/app/views/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await UsuarioMockStore.init(); // carrega do disco (ou seed na 1ª vez)
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Atividade Avaliativa',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
      ),
      home: const LoginScreen(),
    );
  }
}