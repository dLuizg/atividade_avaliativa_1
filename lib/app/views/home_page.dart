import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:atividade_avaliativa_1/app/models/usuario_model.dart';

class HomePage extends StatefulWidget {
  final UsuarioModel usuario; // 👈 recebe quem logou
  const HomePage({super.key, required this.usuario});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _hora = "";

  @override
  void initState() {
    super.initState();
    _hora = _formatarDateTime(DateTime.now());
    Timer.periodic(const Duration(seconds: 1), (t) => _atualizaHora());
  }

  void _atualizaHora() {
    setState(() => _hora = _formatarDateTime(DateTime.now()));
  }

  String _formatarDateTime(DateTime dt) =>
      DateFormat('dd/MM - HH:mm:ss').format(dt);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 158, 158, 158),
        title: const Text(""),
        actions: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Text(_hora,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w500)),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Bem-vindo(a), ${widget.usuario.nome}!', // 👈 nome real
                style: const TextStyle(fontSize: 36),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              const Icon(Icons.home, size: 50, color: Colors.black),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.email), label: 'Email'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: 'Configurações'),
        ],
      ),
    );
  }
}