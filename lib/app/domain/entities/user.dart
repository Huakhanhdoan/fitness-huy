class User {
  final String id;
  final String name;
  final String email;
  final String password;

  User(
      {required this.id,
      required this.name,
      required this.email,
      required this.password});

  User copyWith({String? id, String? name, String? email, String? password}) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  @override
  String toString() {
    return 'User{id: $id, name: $name, email: $email, password: $password}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is User &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          email == other.email &&
          password == other.password;

  @override
  int get hashCode =>
      id.hashCode ^ name.hashCode ^ email.hashCode ^ password.hashCode;
}
