import 'package:flutter/material.dart';
import 'package:wassil/ui/homePage/commentPopUp.dart';
import '../../main.dart';
import 'package:wassil/models/post.dart';
import 'package:wassil/models/postNews.dart';
import 'package:wassil/models/postPoll.dart';
import 'package:wassil/models/postProject.dart';

class PostWidget extends StatelessWidget {
  final String institution;
  final String title;
  final String type;
  final String description;
  final Widget child;
  final String projectId;
  const PostWidget(
      {Key key,
      this.institution,
      this.title,
      this.type,
      this.description,
      this.child,
      this.projectId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
          child: Container(
              child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: () {
                    if (this.type == "News")
                      return ThemeColors.purple;
                    else if (this.type == "Sondage")
                      return ThemeColors.amber;
                    else if (this.type == "Projet")
                      return ThemeColors.red;
                    else
                      return ThemeColors.mainGreen;
                  }(),
                ),
                child: () {
                  if (this.type == "News")
                    return Icon(
                      Icons.description,
                      color: Colors.white,
                    );
                  else if (this.type == "Sondage")
                    return Icon(
                      Icons.poll,
                      color: Colors.white,
                    );
                  else if (this.type == "Projet")
                    return Icon(
                      Icons.work,
                      color: Colors.white,
                    );
                  else
                    return Icons.error_outline;
                }(),
              ),
              SizedBox(
                width: 16,
              ),
              Container(
                width: MediaQuery.of(context).size.width - 88,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Flexible(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Flexible(
                                child: Text(
                                  this.institution,
                                  style: Theme.of(context).textTheme.headline1,
                                  overflow: TextOverflow.fade,
                                ),
                              ),
                              SizedBox(
                                height: 2,
                              ),
                              Text(
                                this.type,
                                style: Theme.of(context).textTheme.headline3,
                              ),
                              SizedBox(
                                height: 2,
                              ),
                              (this.type == "Sondage")
                                  ? Flexible(
                                      child: Text(
                                        this.description,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1,
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis,
                                        textScaleFactor: 1.1,
                                      ),
                                    )
                                  : Flexible(
                                      child: RichText(
                                      text: TextSpan(children: [
                                        TextSpan(
                                            text: (this.title + " : "),
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText2),
                                        TextSpan(
                                            text: this.description,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText1),
                                      ]),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 4,
                                    )),
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            width: 16,
                            child: Icon(
                              Icons.more_vert,
                              color: ThemeColors.textColor1,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    this.child,
                    Container(
                      height: 36,
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  avisPopup(context, this.projectId, comment);
                                },
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    SizedBox(
                                      width: 12,
                                    ),
                                    Container(
                                      height: 20,
                                      width: 20,
                                      child: Icon(
                                        Icons.comment,
                                        color: ThemeColors.textColor3,
                                        size: 16,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Center(
                                      child: Text(
                                        "Commenter",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                                child: InkWell(
                              onTap: () {},
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  SizedBox(
                                    width: 12,
                                  ),
                                  Container(
                                    height: 20,
                                    width: 20,
                                    child: Icon(
                                      Icons.visibility,
                                      color: ThemeColors.textColor3,
                                      size: 16,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Center(
                                    child: Text(
                                      "Voir plus",
                                      style:
                                          Theme.of(context).textTheme.bodyText1,
                                    ),
                                  )
                                ],
                              ),
                            ))
                          ]),
                    ),
                  ],
                ),
              ),
            ],
          )),
        ),
        Divider(
          color: ThemeColors.backgroundLight,
          thickness: 1,
          height: 0,
        ),
      ],
    );
  }
}

class NewsWidget extends StatelessWidget {
  final News news;

  const NewsWidget({
    Key key,
    this.news,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> _listImage = news.getImages;
    return PostWidget(
      institution: this.news.getInstitution,
      title: this.news.getTitle,
      description: this.news.getDescription,
      type: "News",
      projectId: this.news.id.toString(),
      child: Container(
        height: 140,
        width: MediaQuery.of(context).size.width - 88,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: ThemeColors.backgroundDark,
          border: Border.all(color: ThemeColors.backgroundLight, width: 1),
        ),
        child: () {
          if (news.getImages.length == 0) {
            return Container();
          } else if (news.getImages.length == 1) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(6.5),
              child: FittedBox(
                child: Image.asset(news.getImages[0]),
                fit: BoxFit.cover,
              ),
            );
          } else if (news.getImages.length == 2) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(6.5),
              child: Row(
                children: <Widget>[
                  Container(
                    height: 140,
                    width: (MediaQuery.of(context).size.width - 91) / 2,
                    child: FittedBox(
                      child: Image.asset(news.getImages[0]),
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    height: 140,
                    width: 1,
                    color: ThemeColors.backgroundLight,
                  ),
                  Container(
                    height: 140,
                    width: (MediaQuery.of(context).size.width - 91) / 2,
                    child: FittedBox(
                      child: Image.asset(news.getImages[1]),
                      fit: BoxFit.cover,
                    ),
                  )
                ],
              ),
            );
          } else if (news.getImages.length == 3) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(6.5),
              child: Row(
                children: <Widget>[
                  Container(
                    height: 140,
                    width: ((MediaQuery.of(context).size.width - 91) / 3) * 2,
                    child: FittedBox(
                      child: Image.asset(news.getImages[0]),
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    height: 140,
                    width: 1,
                    color: ThemeColors.backgroundLight,
                  ),
                  Column(
                    children: <Widget>[
                      Container(
                        height: 68.5,
                        width: (MediaQuery.of(context).size.width - 91) / 3,
                        child: FittedBox(
                          child: Image.asset(news.getImages[1]),
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        height: 1,
                        width: (MediaQuery.of(context).size.width - 91) / 3,
                        color: ThemeColors.backgroundLight,
                      ),
                      Container(
                        height: 68.5,
                        width: (MediaQuery.of(context).size.width - 91) / 3,
                        child: FittedBox(
                          child: Image.asset(news.getImages[2]),
                          fit: BoxFit.cover,
                        ),
                      )
                    ],
                  )
                ],
              ),
            );
          } else {
            return ClipRRect(
              borderRadius: BorderRadius.circular(6.5),
              child: Row(
                children: <Widget>[
                  Container(
                    height: 140,
                    width: ((MediaQuery.of(context).size.width - 91) / 3) * 2,
                    child: FittedBox(
                      child: Image.asset(news.getImages[0]),
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    height: 140,
                    width: 1,
                    color: ThemeColors.backgroundLight,
                  ),
                  Column(
                    children: <Widget>[
                      Container(
                        height: 136 / 3,
                        width: (MediaQuery.of(context).size.width - 91) / 3,
                        child: FittedBox(
                          child: Image.asset(news.getImages[1]),
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        height: 1,
                        width: (MediaQuery.of(context).size.width - 91) / 3,
                        color: ThemeColors.backgroundLight,
                      ),
                      Container(
                        height: 136 / 3,
                        width: (MediaQuery.of(context).size.width - 91) / 3,
                        child: FittedBox(
                          child: Image.asset(news.getImages[2]),
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        height: 1,
                        width: (MediaQuery.of(context).size.width - 91) / 3,
                        color: ThemeColors.backgroundLight,
                      ),
                      Container(
                        height: 136 / 3,
                        width: (MediaQuery.of(context).size.width - 91) / 3,
                        child: FittedBox(
                          child: Image.asset(news.getImages[3]),
                          fit: BoxFit.cover,
                        ),
                      )
                    ],
                  )
                ],
              ),
            );
          }
        }(),
      ),
    );
  }
}

class PollWidget extends StatelessWidget {
  final Poll poll;

  const PollWidget({
    Key key,
    this.poll,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PostWidget(
      institution: this.poll.getInstitution,
      title: this.poll.getTitle,
      description: this.poll.getDescription,
      type: "Sondage",
      projectId: this.poll.id.toString(),
      child: Container(
        height: 140,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: ThemeColors.backgroundDark,
          border: Border.all(color: ThemeColors.backgroundLight, width: 1),
        ),
        child: () {
          // if (news.getImages.length == 0) {
          return Container();
        }(),
      ),
    );
  }
}

class ProjectWidget extends StatelessWidget {
  final Project project;

  const ProjectWidget({
    Key key,
    this.project,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PostWidget(
      institution: this.project.getInstitution,
      title: this.project.getTitle,
      description: this.project.getDescription,
      type: "Projet",
      projectId: this.project.id.toString(),
      child: Container(
        height: 140,
        width: MediaQuery.of(context).size.width - 88,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: ThemeColors.backgroundDark,
          border: Border.all(color: ThemeColors.backgroundLight, width: 1),
        ),
        child: () {
          if (project.getImages.length == 0) {
            return Container();
          } else if (project.getImages.length == 1) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(6.5),
              child: FittedBox(
                child: Image.asset(project.getImages[0]),
                fit: BoxFit.cover,
              ),
            );
          } else if (project.getImages.length == 2) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(6.5),
              child: Row(
                children: <Widget>[
                  Container(
                    height: 140,
                    width: (MediaQuery.of(context).size.width - 91) / 2,
                    child: FittedBox(
                      child: Image.asset(project.getImages[0]),
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    height: 140,
                    width: 1,
                    color: ThemeColors.backgroundLight,
                  ),
                  Container(
                    height: 140,
                    width: (MediaQuery.of(context).size.width - 91) / 2,
                    child: FittedBox(
                      child: Image.asset(project.getImages[1]),
                      fit: BoxFit.cover,
                    ),
                  )
                ],
              ),
            );
          } else if (project.getImages.length == 3) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(6.5),
              child: Row(
                children: <Widget>[
                  Container(
                    height: 140,
                    width: ((MediaQuery.of(context).size.width - 91) / 3) * 2,
                    child: FittedBox(
                      child: Image.asset(project.getImages[0]),
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    height: 140,
                    width: 1,
                    color: ThemeColors.backgroundLight,
                  ),
                  Column(
                    children: <Widget>[
                      Container(
                        height: 68.5,
                        width: (MediaQuery.of(context).size.width - 91) / 3,
                        child: FittedBox(
                          child: Image.asset(project.getImages[1]),
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        height: 1,
                        width: (MediaQuery.of(context).size.width - 91) / 3,
                        color: ThemeColors.backgroundLight,
                      ),
                      Container(
                        height: 68.5,
                        width: (MediaQuery.of(context).size.width - 91) / 3,
                        child: FittedBox(
                          child: Image.asset(project.getImages[2]),
                          fit: BoxFit.cover,
                        ),
                      )
                    ],
                  )
                ],
              ),
            );
          } else {
            return ClipRRect(
              borderRadius: BorderRadius.circular(6.5),
              child: Row(
                children: <Widget>[
                  Container(
                    height: 140,
                    width: ((MediaQuery.of(context).size.width - 91) / 3) * 2,
                    child: FittedBox(
                      child: Image.asset(project.getImages[0]),
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    height: 140,
                    width: 1,
                    color: ThemeColors.backgroundLight,
                  ),
                  Column(
                    children: <Widget>[
                      Container(
                        height: 136 / 3,
                        width: (MediaQuery.of(context).size.width - 91) / 3,
                        child: FittedBox(
                          child: Image.asset(project.getImages[1]),
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        height: 1,
                        width: (MediaQuery.of(context).size.width - 91) / 3,
                        color: ThemeColors.backgroundLight,
                      ),
                      Container(
                        height: 136 / 3,
                        width: (MediaQuery.of(context).size.width - 91) / 3,
                        child: FittedBox(
                          child: Image.asset(project.getImages[2]),
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        height: 1,
                        width: (MediaQuery.of(context).size.width - 91) / 3,
                        color: ThemeColors.backgroundLight,
                      ),
                      Container(
                        height: 136 / 3,
                        width: (MediaQuery.of(context).size.width - 91) / 3,
                        child: FittedBox(
                          child: Image.asset(project.getImages[3]),
                          fit: BoxFit.cover,
                        ),
                      )
                    ],
                  )
                ],
              ),
            );
          }
        }(),
      ),
    );
  }
}
