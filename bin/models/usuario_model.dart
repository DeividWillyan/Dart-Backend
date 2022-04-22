class UsuarioModel {
  int? id;
  String? name;
  String? email;
  String? password;
  bool? isActived;
  DateTime? dtCreated;
  DateTime? dtUpdated;

  UsuarioModel();

  UsuarioModel.create(
    this.id,
    this.name,
    this.email,
    this.isActived,
    this.dtCreated,
    this.dtUpdated,
  );

  factory UsuarioModel.fromMap(Map<String, dynamic> map) {
    return UsuarioModel.create(
      map['id']?.toInt() ?? 0,
      map['nome'] ?? '',
      map['email'] ?? '',
      map['is_ativo'] == 1,
      map['dt_criacao'],
      map['dt_autalizacao'],
    );
  }

  factory UsuarioModel.fromEmail(Map map) {
    return UsuarioModel()
      ..id = map['id'].toInt()
      ..password = map['password'];
  }

  factory UsuarioModel.fromBodyRequest(Map<String, dynamic> map) {
    return UsuarioModel()
      ..name = map['name']
      ..email = map['email']
      ..password = map['password'];
  }

  @override
  String toString() {
    return 'UsuarioModel(id: $id, name: $name, email: $email, isActived: $isActived, dtCreated: $dtCreated, dtUpdated: $dtUpdated)';
  }

  UsuarioModel copyWith({
    int? id,
    String? name,
    String? email,
    bool? isActived,
    DateTime? dtCreated,
    DateTime? dtUpdated,
  }) {
    return UsuarioModel.create(
      id ?? this.id,
      name ?? this.name,
      email ?? this.email,
      isActived ?? this.isActived,
      dtCreated ?? this.dtCreated,
      dtUpdated ?? this.dtUpdated,
    );
  }
}
