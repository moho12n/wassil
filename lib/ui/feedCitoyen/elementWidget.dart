import 'package:flutter/material.dart';
import '../../main.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:math';

class ProblemWidget extends StatelessWidget {
  final String solution;
  final String title;
  final String type;
  final String description;

  const ProblemWidget({
    Key key,
    this.solution,
    this.title,
    this.type,
    this.description,
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
                    if (this.type == "Problem")
                      return ThemeColors.purple;
                    else if (this.type == "Idea")
                      return ThemeColors.amber;
                    else
                      return ThemeColors.mainGreen;
                  }(),
                ),
                child: () {
                  if (this.type == "Problem")
                    return Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: AssetImage('assets/img/pdp.jpg'))),
                    );
                  else if (this.type == "Idea")
                    return Icon(
                      Icons.poll,
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
                width: MediaQuery.of(context).size.width - 110,
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
                                  this.title,
                                  style: Theme.of(context).textTheme.headline1,
                                  overflow: TextOverflow.fade,
                                ),
                              ),
                              SizedBox(
                                height: 2,
                              ),
                              Text(
                                this.type == "Problem"
                                    ? "Problème"
                                    : "Proposition",
                                style: Theme.of(context).textTheme.headline3,
                              ),
                              SizedBox(
                                height: 2,
                              ),
                              Flexible(
                                  child: RichText(
                                text: TextSpan(children: [
                                  TextSpan(
                                      text: this.description,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1),
                                ]),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 4,
                              )),
                              (this.type == "Problem")
                                  ? Flexible(
                                      child: RichText(
                                      text: TextSpan(children: [
                                        TextSpan(
                                            text: ("solution : "),
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText2),
                                        TextSpan(
                                            text: this.solution,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText1),
                                      ]),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 4,
                                    ))
                                  : Flexible(
                                      child: SizedBox(),
                                    ),
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
                                        "voir plus",
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
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  SizedBox(
                                    width: 60,
                                  ),
                                  Center(
                                    child: SvgPicture.asset(
                                      "assets/heart.svg",
                                      width: 20,
                                      height: 12,
                                      color: ThemeColors.textColor3,
                                    ),
                                  ),
                                  Center(
                                    child: Text(
                                      "  ${Random().nextInt(30).toString()}",
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

class ProblemStatelessWidget extends StatelessWidget {
  final String solution;
  final String title;
  final String type;
  final String description;
  final Widget child;

  const ProblemStatelessWidget(
      {Key key,
      this.solution,
      this.title,
      this.type,
      this.description,
      this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProblemWidget(
      solution: this.solution,
      title: this.title,
      description: this.description,
      type: this.type,
    );
  }
}
