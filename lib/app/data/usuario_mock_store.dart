import '../models/usuario_model.dart';

class UsuarioMockStore {
  UsuarioMockStore._();

  static final List<UsuarioModel> _usuarios = [
    UsuarioModel(nome: 'Augusto', email: 'augusto@email.com', senha: '123456'),
    UsuarioModel(nome: 'Matteo', email: 'matteo@email.com', senha: '123456'),
    UsuarioModel(nome: 'Samara', email: 'samara@email.com', senha: '123456'),
  ];

  static bool emailExiste(String email) =>
      _usuarios.any((u) => u.email.toLowerCase() == email.toLowerCase());

  static UsuarioModel? login(String email, String senha) {
    try {
      return _usuarios.firstWhere(
        (u) => u.email.toLowerCase() == email.toLowerCase() && u.senha == senha,
      );
    } catch (_) {
      return null;
    }
  }

  static void adicionar(UsuarioModel usuario) => _usuarios.add(usuario);
}
