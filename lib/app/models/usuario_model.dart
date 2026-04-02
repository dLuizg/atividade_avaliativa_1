class UsuarioModel {
  final String nome;
  final String email;
  final String senha;

  UsuarioModel({
    required this.nome,
    required this.email,
    required this.senha,
  });

  Map<String, String> toMap() => {
    'nome': nome,
    'email': email,
    'senha': senha,
  };

  factory UsuarioModel.fromMap(Map<String, dynamic> m) => UsuarioModel(
    nome: m['nome'] as String,
    email: m['email'] as String,
    senha: m['senha'] as String,
  );
}