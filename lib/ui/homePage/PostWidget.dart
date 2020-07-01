import 'package:flutter/material.dart';
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

  const PostWidget({
    Key key,
    this.institution,
    this.title,
    this.type,
    this.description,
    this.child,
  }) : super(key: key);

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
                    else if (this.type == "Poll")
                      return ThemeColors.amber;
                    else if (this.type == "Project")
                      return ThemeColors.red;
                    else
                      return ThemeColors.mainGreen;
                  }(),
                ),
                child: () {
                  if (this.type == "News")
                    return Icon(Icons.description);
                  else if (this.type == "Poll")
                    return Icon(Icons.poll);
                  else if (this.type == "Project")
                    return Icon(Icons.work);
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
                              (this.type == "Poll")
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
                                      TextSpan(text: (this.title+" : "), style: Theme.of(context).textTheme.bodyText2),
                                      TextSpan(text: this.description, style: Theme.of(context).textTheme.bodyText1),
                                    ]),overflow: TextOverflow.ellipsis,
                                        maxLines: 4,
                                      )),
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            width: 16,
                            child: Icon(Icons.more_vert, color: ThemeColors.textColor1,),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Container(
                      height: 140,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        border: Border.all(
                            color: ThemeColors.backgroundLight, width: 1),
                      ),
                      child: this.child,
                    ),
                    Container(
                      height: 36,
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
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
                                      child: Icon(Icons.comment, color: ThemeColors.textColor3, size: 16,),
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
                                    child: Icon(Icons.visibility, color: ThemeColors.textColor3, size: 16,),
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
  final Widget child;

  const NewsWidget({
    Key key,
    this.news,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PostWidget(
      institution: this.news.getInstitution,
      title: this.news.getTitle,
      description: this.news.getDescription,
      type: "News",
      child: this.child,
    );
  }
}

class PollWidget extends StatelessWidget {
  final Poll poll;
  final Widget child;

  const PollWidget({
    Key key,
    this.poll,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PostWidget(
      institution: this.poll.getInstitution,
      title: this.poll.getTitle,
      description: this.poll.getDescription,
      type: "Poll",
      child: this.child,
    );
  }
}

class ProjectWidget extends StatelessWidget {
  final Project project;
  final Widget child;

  const ProjectWidget({
    Key key,
    this.project,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PostWidget(
      institution: this.project.getInstitution,
      title: this.project.getTitle,
      description: this.project.getDescription,
      type: "Project",
      child: this.child,
    );
  }
}
/*
class ProjectWidget extends StatelessWidget {
  final Project project;

  ProjectWidget(this.project);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Column(
        children: <Widget>[
          Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    width: 16,
                  ),
                  SvgPicture.asset(
                    'assets/projet.svg',
                    height: 40,
                    width: 40,
                  ),
                  SizedBox(
                    width: 18,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width - 80,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          height: 6,
                        ),
                        Row(
                          children: <Widget>[
                            Container(
                              width: MediaQuery.of(context).size.width - 120,
                              child: new Text(
                                title,
                                style: TextStyle(
                                  fontFamily: "Montserrat",
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                  color: Color(0xffffffff),
                                ),
                              ),
                            ),
                            Expanded(
                              child: SizedBox(),
                            ),
                            InkWell(
                              onTap: () {},
                              child: SvgPicture.asset(
                                "assets/post_options.svg",
                                width: 4,
                                height: 16,
                              ),
                            ),
                            SizedBox(
                              width: 13,
                            )
                          ],
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        new Text(
                          "Projet",
                          style: TextStyle(
                            fontFamily: "Montserrat",
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            color: Color(0xff8e9ba7),
                          ),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        new Text(
                          description,
                          style: TextStyle(
                            fontFamily: "Segoe UI",
                            fontSize: 10,
                            color: Color(0xffc4ced8),
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 12),
                          height: 140,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              color: Colors.green,
                              border:
                              Border.all(color: Color(0xff44484F), width: 2),
                              image: DecorationImage(
                                  fit: BoxFit.fill, image: NetworkImage(picture))),
                        ),
                        Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(top: 16, left: 8),
                                child: InkWell(
                                  onTap: () {},
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      SvgPicture.asset(
                                        "assets/commenter.svg",
                                        width: 16,
                                        height: 16,
                                      ),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      Center(
                                        child: Text(
                                          "Commenter",
                                          style: TextStyle(
                                            fontFamily: "Segoe UI",
                                            fontSize: 10,
                                            color: Color(0xffc4ced8),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 60,
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 16, left: 8),
                                child: InkWell(
                                  onTap: () {},
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      SvgPicture.asset(
                                        "assets/voir plus.svg",
                                        width: 16,
                                        height: 16,
                                      ),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      Center(
                                        child: Text(
                                          "Voir plus",
                                          style: TextStyle(
                                            fontFamily: "Segoe UI",
                                            fontSize: 10,
                                            color: Color(0xffc4ced8),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ]),
                        SizedBox(
                          height: 10,
                        )
                      ],
                    ),
                  ),
                ],
              )),
          Divider(
            color: Color(0xff44484F),
            thickness: 1.5,
          ),
        ],
      ),
    );
  }
}

class PollWidget extends StatelessWidget {
  final String title;
  final String description;
  final String picture;

  PollWidget(this.title, this.description, this.picture);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Column(
        children: <Widget>[
          Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    width: 16,
                  ),
                  SvgPicture.asset(
                    'assets/poll.svg',
                    height: 40,
                    width: 40,
                  ),
                  SizedBox(
                    width: 18,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width - 80,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          height: 6,
                        ),
                        Row(
                          children: <Widget>[
                            Container(
                              width: MediaQuery.of(context).size.width - 120,
                              child: new Text(
                                title,
                                style: TextStyle(
                                  fontFamily: "Montserrat",
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                  color: Color(0xffffffff),
                                ),
                              ),
                            ),
                            Expanded(
                              child: SizedBox(),
                            ),
                            InkWell(
                              onTap: () {},
                              child: SvgPicture.asset(
                                "assets/post_options.svg",
                                width: 4,
                                height: 16,
                              ),
                            ),
                            SizedBox(
                              width: 13,
                            )
                          ],
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        new Text(
                          "Sondage",
                          style: TextStyle(
                            fontFamily: "Montserrat",
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            color: Color(0xff8e9ba7),
                          ),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        new Text(
                          description,
                          style: TextStyle(
                            fontFamily: "Segoe UI",
                            fontSize: 10,
                            color: Color(0xffc4ced8),
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 12),
                          width: MediaQuery.of(context).size.width,
                          height: 140,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            border: Border.all(color: Color(0xff44484F), width: 2),
                          ),
                          child: Column(
                            children: <Widget>[],
                          ),
                        ),
                        Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(top: 16, left: 8),
                                child: InkWell(
                                  onTap: () {},
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      SvgPicture.asset(
                                        "assets/commenter.svg",
                                        width: 16,
                                        height: 16,
                                      ),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      Center(
                                        child: Text(
                                          "Commenter",
                                          style: TextStyle(
                                            fontFamily: "Segoe UI",
                                            fontSize: 10,
                                            color: Color(0xffc4ced8),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 60,
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 16, left: 8),
                                child: InkWell(
                                  onTap: () {},
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      SvgPicture.asset(
                                        "assets/voir plus.svg",
                                        width: 16,
                                        height: 16,
                                      ),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      Center(
                                        child: Text(
                                          "Voir plus",
                                          style: TextStyle(
                                            fontFamily: "Segoe UI",
                                            fontSize: 10,
                                            color: Color(0xffc4ced8),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ]),
                        SizedBox(
                          height: 10,
                        )
                      ],
                    ),
                  ),
                ],
              )),
          Divider(
            color: Color(0xff44484F),
            thickness: 1.5,
          ),
        ],
      ),
    );
  }
}
*/
