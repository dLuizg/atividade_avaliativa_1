import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _hora = "";

  @override
  void initState() {
    super.initState();
    _hora = _formatarDateTime(DateTime.now());
    Timer.periodic(Duration(seconds: 1), (Timer t) => _atualizaHora());
  }

  void _atualizaHora() {
    final DateTime now = DateTime.now();
    final String dateTimeFormatada = _formatarDateTime(now);
    setState(() {
      _hora = dateTimeFormatada;
    });
  }

  String _formatarDateTime(DateTime dateTime) {
    return DateFormat('dd/MM - HH:mm:ss').format(dateTime);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: const Text(""),
        actions: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: Text(
                _hora,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Bem-vindo(a), usuário!",
                style: TextStyle(
                  fontSize: 36,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Icon(
                Icons.home,
                size: 50,
                color: Colors.black,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.email),
            label: 'Email'),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Configurações'),
        ],
      ),
    );
  }
}
