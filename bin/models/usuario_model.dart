class UsuarioModel {
  final int id;
  final String name;
  final String email;
  final bool isActived;
  final DateTime dtCreated;
  final DateTime dtUpdated;

  UsuarioModel(
    this.id,
    this.name,
    this.email,
    this.isActived,
    this.dtCreated,
    this.dtUpdated,
  );

  factory UsuarioModel.fromMap(Map<String, dynamic> map) {
    return UsuarioModel(
      map['id']?.toInt() ?? 0,
      map['nome'] ?? '',
      map['email'] ?? '',
      map['is_ativo'] == 1,
      map['dt_criacao'],
      map['dt_autalizacao'],
    );
  }

  @override
  String toString() {
    return 'UsuarioModel(id: $id, name: $name, email: $email, isActived: $isActived, dtCreated: $dtCreated, dtUpdated: $dtUpdated)';
  }
}
