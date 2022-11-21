class Invitation {
  final int id, id_evenement, place, retour, statut_envoye;
  final String nom_prenoms, lien_carte, lien_code, created_at;

  Invitation(
      {required this.id,
      required this.id_evenement,
      required this.place,
      required this.retour,
      required this.statut_envoye,
      required this.nom_prenoms,
      required this.lien_carte,
      required this.lien_code,
      required this.created_at});
}
