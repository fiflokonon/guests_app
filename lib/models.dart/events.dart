class Event {
  final int id, id_utilisateur;
  final String titre,
      slogan,
      description,
      lieu,
      date_de_debut,
      date_de_fin,
      created_at;

  Event(
      {required this.id,
      required this.titre,
      required this.slogan,
      required this.description,
      required this.lieu,
      required this.date_de_debut,
      required this.date_de_fin,
      required this.id_utilisateur,
      required this.created_at});
}
