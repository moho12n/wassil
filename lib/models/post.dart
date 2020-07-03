import 'package:wassil/controllers/feedController.dart';
import 'package:wassil/models/postModel.dart';

import 'postNews.dart';
import 'postProject.dart';
import 'postPoll.dart';

class Post {
  int id;
  String institution;
  String title;
  String description;
  Post(this.title, this.institution, this.description);
  int get getId => id;

  String get getInstitution => institution;

  String get getTitle => title;

  String get getDescription => description;

  static List<Post> localPosts = List();
  static List<Post> nationalPosts = List();
  /*
  static List<Post> localPosts = [
    Project(
        "Projet de construction d'un terrain de jeu pour les enfants de la commune",
        "Commune Belouizdad",
        '''Le maire de Belouzidad annonce ce dimanche 31/05/2020 le lancement d'un projet de construction d'un terrain de jeu et d'un espace de détente au profit des enfants et des citoyens de sa commune. Le projet surrera 3 mois et se voit attribué un budget de 3.500.000 de dinars algériens.''',
        [
          "assets/img/projet_local1.jpg",
        ]),
  ];

  static List<Post> nationalPosts = [
    Poll(
        "Que pensez-vous de rendre la langue Angalise la langue officielle de la recherche scientifique en Algérie ?",
        "Ministère de l'enseignement supérieur et de la recherche scientifique",
        "Que pensez-vous de rendre la langue Angalise la langue officielle de la recherche scientifique en Algérie ?"),
    News(
        "Programme nationale de reboisement",
        "Ministère de l'agriculture et du développement rural",
        '''Le Gouvernement a tenu, mercredi 14 août 2019, une réunion présidée par Monsieur le Premier ministre Noureddine Bedoui, au cours de laquelle Monsieur le ministre de l’Agriculture, du Développement rural et de la Pêche a été chargé de préparer le lancement d’une large campagne nationale de reboisement avec la contribution de toutes les autorités locales et centrales ainsi que les organisations de la société civile et les citoyens.''',
        ["assets/img/news1.jpg"]),
    Project(
        "Projet de construction d'un terrain de jeu pour les enfants de la commune",
        "Commune Belouizdad",
        '''Le maire de Belouzidad annonce ce dimanche 31/05/2020 le lancement d'un projet de construction d'un terrain de jeu et d'un espace de détente au profit des enfants et des citoyens de sa commune. Le projet surrera 3 mois et se voit attribué un budget de 3.500.000 de dinars algériens.''',
        [
          "assets/img/projet1.jpg",
          "assets/img/projet2.jpg",
          "assets/img/projet3.jpg",
          "assets/img/projet4.jpg",
        ]),
  ];
*/

  List<PostModel> listPostRegional;
  List<PostModel> listPostNational;
  fetchPost() async {
    listPostNational = await makeGetRequestFeed("national");
    listPostRegional = await makeGetRequestFeed("regional");
    listPostRegional.forEach((element) {
      element.post_type == "survey"
          ? localPosts.add(Poll(
              element.title,
              element.ministryName,
              element.title,
            ))
          : element.post_type == "project"
              ? localPosts.add(Project(
                  element.title, element.townName, element.description, [
                  "assets/img/projet1.jpg",
                  "assets/img/projet2.jpg",
                  "assets/img/projet3.jpg",
                  "assets/img/projet4.jpg",
                ]))
              : localPosts.add(News(element.title, element.ministryName,
                  element.description, ["assets/img/news1.jpg"]));
    });
    listPostNational.forEach((element) {
      element.post_type == "survey"
          ? nationalPosts.add(Poll(
              element.title,
              element.ministryName,
              element.title,
            ))
          : element.post_type == "project"
              ? nationalPosts.add(Project(
                  element.title, element.townName, element.description, [
                  "assets/img/projet1.jpg",
                  "assets/img/projet2.jpg",
                  "assets/img/projet3.jpg",
                  "assets/img/projet4.jpg",
                ]))
              : nationalPosts.add(News(element.title, element.ministryName,
                  element.description, ["assets/img/news1.jpg"]));
    });
  }
}
