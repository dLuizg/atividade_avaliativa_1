import '../data/usuario_mock_store.dart';
import '../models/usuario_model.dart';

class SignupViewModel {
  bool emailExiste(String email) => UsuarioMockStore.emailExiste(email);

  Future<void> cadastrar({
    required String nome,
    required String email,
    required String senha,
  }) async {
    await Future.delayed(const Duration(seconds: 1));
    UsuarioMockStore.adicionar(
      UsuarioModel(nome: nome, email: email, senha: senha),
    );
  }
}
