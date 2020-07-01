import 'postNews.dart';
import 'postProject.dart';
import 'postPoll.dart';

class Post {
  int id;
  String institution;
  String title;
  String description;

  int get getId => id;
  String get getInstitution => institution;
  String get getTitle => title;
  String get getDescription => description;

  static List<Post> localPosts = [
    Project("Projet de construction d'un terrain de jeu pour les enfants de la commune", "Commune Belouizdad", '''Le maire de Belouzidad annonce ce dimanche 31/05/2020 le lancement d'un projet de construction d'un terrain de jeu et d'un espace de détente au profit des enfants et des citoyens de sa commune. Le projet surrera 3 mois et se voit attribué un budget de 3.500.000 de dinars algériens.''', 'majd'),
   ];

  static List<Post> nationalPosts = [
    News("Programme nationale de reboisement", "Ministère de l'agriculture et du développement rural", '''Le Gouvernement a tenu, mercredi 14 août 2019, une réunion présidée par Monsieur le Premier ministre Noureddine Bedoui, au cours de laquelle Monsieur le ministre de l’Agriculture, du Développement rural et de la Pêche a été chargé de préparer le lancement d’une large campagne nationale de reboisement avec la contribution de toutes les autorités locales et centrales ainsi que les organisations de la société civile et les citoyens.''', 'majd'),
    Poll("Que pensez-vous de rendre la langue Angalise la langue officielle de la recherche scientifique en Algérie ?", "Ministère de l'enseignement supérieur et de la recherche scientifique", "Que pensez-vous de rendre la langue Angalise la langue officielle de la recherche scientifique en Algérie ?"),
  ];

  Post(this.title, this.institution, this.description);
}