class Auteur {
  String nom;
  String prenom;
  String avatar;
  Auteur(this.nom, this.prenom, this.avatar);

}

class PostInformations {
  String imageAdresse;
  Auteur auteur;
  String description;
  int nbCommentaires;
  int nbLikes;
  DateTime dateTime;



  PostInformations(this.imageAdresse, this.auteur, this.description,
      this.nbCommentaires, this.nbLikes, this.dateTime);
}