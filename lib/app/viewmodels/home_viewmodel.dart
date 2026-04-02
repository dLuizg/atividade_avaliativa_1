import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomeViewModel extends ChangeNotifier {
  String horaAtual = '';
  late final Timer _timer;

  HomeViewModel() {
    _atualizar();
    _timer = Timer.periodic(const Duration(seconds: 1), (_) => _atualizar());
  }

  void _atualizar() {
    horaAtual = DateFormat('dd/MM - HH:mm:ss').format(DateTime.now());
    notifyListeners();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}
