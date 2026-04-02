import 'package:flutter/material.dart';
import '../data/usuario_mock_store.dart';
import '../models/usuario_model.dart';

class LoginViewModel extends ChangeNotifier {
  bool carregando = false;
  String? erro;

  Future<UsuarioModel?> login(String email, String senha) async {
    carregando = true;
    erro = null;
    notifyListeners();

    await Future.delayed(const Duration(milliseconds: 600));

    final usuario = UsuarioMockStore.login(email, senha);
    if (usuario == null) erro = 'E-mail ou senha incorretos.';

    carregando = false;
    notifyListeners();
    return usuario;
  }
}
