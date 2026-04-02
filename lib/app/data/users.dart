class AppUser {
  final String id;
  final String name;
  final String password;
  final String avatarInitial;

  const AppUser({
    required this.id,
    required this.name,
    required this.password,
    required this.avatarInitial,
  });

  Map<String, String> toMap() => {
    'id': id,
    'name': name,
    'password': password,
    'avatarInitial': avatarInitial,
  };

  factory AppUser.fromMap(Map<String, String> m) => AppUser(
    id: m['id']!,
    name: m['name']!,
    password: m['password']!,
    avatarInitial: m['avatarInitial']!,
  );
}