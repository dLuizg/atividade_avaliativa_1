import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/usuario_model.dart';

class UsuarioMockStore {
  static const _key = 'usuarios_db';

  static final List<UsuarioModel> _seed = [
    UsuarioModel(nome: 'Augusto', email: 'augusto@email.com', senha: '123456'),
    UsuarioModel(nome: 'Matteo',  email: 'matteo@email.com',  senha: '123456'),
    UsuarioModel(nome: 'Samara',  email: 'samara@email.com',  senha: '123456'),
  ];

  static List<UsuarioModel> usuarios = [];

  /// Chama uma vez no main() antes do runApp
  static Future<void> init() async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString(_key);

    if (raw == null) {
      // primeira execução: grava o seed
      usuarios = List.from(_seed);
      await _persistir(prefs);
    } else {
      final List decoded = jsonDecode(raw);
      usuarios = decoded.map((e) => UsuarioModel.fromMap(e)).toList();
    }
  }

  static bool emailExiste(String email) =>
      usuarios.any((u) => u.email.toLowerCase() == email.toLowerCase());

  static UsuarioModel? login(String email, String senha) {
    try {
      return usuarios.firstWhere(
        (u) => u.email.toLowerCase() == email.toLowerCase() &&
               u.senha == senha,
      );
    } catch (_) {
      return null;
    }
  }

  /// Adiciona usuário e salva no disco
  static Future<void> adicionar(UsuarioModel usuario) async {
    usuarios.add(usuario);
    final prefs = await SharedPreferences.getInstance();
    await _persistir(prefs);
  }

  static Future<void> _persistir(SharedPreferences prefs) async {
    final encoded = jsonEncode(usuarios.map((u) => u.toMap()).toList());
    await prefs.setString(_key, encoded);
  }
}