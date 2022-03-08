class User {
  User({
    required this.id,
    this.name = '',
    this.lastname = '',
    required this.email,
    required this.token,
  });
  final int id; // non-nullable
  final String name;
  final String lastname; // nullable
  final String email; // non-nullable
  final String token;

  factory User.fromJson(Map<String, dynamic> data) {
    final id = data['id'] as int; // cast as non-nullable String
    final name = data['Nombre'] as String; // cast as non-nullable String
    final lastname = data['Apellido'] as String; // cast as nullable int
    final email = data['email'] as String; // cast as nullable int
    final token = data['token'] as String; // cast as nullable int
    return User(
      id: id,
      name: name,
      lastname: lastname,
      email: email,
      token: token,
    );
  }
}
