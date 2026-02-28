class User {
  int? id;
  String nombre;
  String correo;
  String biografia;

  User({
    this.id,
    required this.nombre,
    required this.correo,
    required this.biografia,
  });

  // Convierte el usuario a un formato que SQLite entienda
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nombre': nombre,
      'correo': correo,
      'biografia': biografia,
    };
  }

  // Convierte los datos de SQLite de vuelta a un Usuario
  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'],
      nombre: map['nombre'],
      correo: map['correo'],
      biografia: map['biografia'],
    );
  }
}
