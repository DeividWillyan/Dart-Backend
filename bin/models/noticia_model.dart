class NoticiaModel {
  final int id;
  final String titulo;
  final String descricao;
  final String imagem;
  final DateTime dtPublicacao;
  final DateTime? dtAtualizacao;

  NoticiaModel(
    this.id,
    this.titulo,
    this.descricao,
    this.imagem,
    this.dtPublicacao,
    this.dtAtualizacao,
  );

  @override
  String toString() {
    return 'NoticiaModel(id: $id, titulo: $titulo, descricao: $descricao, imagem: $imagem, dtPublicacao: $dtPublicacao, dtAtualizacao: $dtAtualizacao)';
  }
}
