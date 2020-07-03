import 'package:flutter/material.dart';
import 'package:wassil/controllers/propositionController.dart';
import 'package:wassil/main.dart';
import 'customSwitch.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:getflutter/getflutter.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:wassil/main.dart';
import 'dart:async';
import 'dart:io';
import '../common/dialogue.dart';
import 'package:http/http.dart';
import 'package:flutter/services.dart' show rootBundle;
//import 'package:flutter_absolute_path/flutter_absolute_path.dart';

List<Asset> images = List<Asset>();
List<String> pathsList = List<String>();

class AddPropositionScreen extends StatefulWidget {
  @override
  _AddPropositionScreenState createState() => _AddPropositionScreenState();
}

class _AddPropositionScreenState extends State<AddPropositionScreen> {
  String title = "";
  String contenu = "";
  String solution = "";

  List<Asset> images = List<Asset>();
  String _error = 'No Error Dectected';
  bool ideeProbleme = false, localNational = false;

  @override
  void initState() {
    super.initState();
  }

  Future<File> getImageFileFromAssets(String path) async {
    final byteData = await rootBundle.load('assets/$path');

    final file = File('$path');
    await file.writeAsBytes(byteData.buffer
        .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));

    return file;
  }

  Widget buildGridView() {
    return GridView.count(
      crossAxisCount: 1,
      children: List.generate(pathsList.length, (index) {
        File imageFile = File(pathsList[index]);
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Container(
            height: 140,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                border:
                    Border.all(color: ThemeColors.backgroundLight, width: 1),
                image: DecorationImage(
                    image: FileImage(imageFile), fit: BoxFit.fill)),
          ),
        );
      }),
    );
  }

  Future<void> loadAssets() async {
    List<Asset> resultList = List<Asset>();
    String error = 'No Error Dectected';

    try {
      resultList = await MultiImagePicker.pickImages(
        maxImages: 300,
        enableCamera: true,
        selectedAssets: images,
        cupertinoOptions: CupertinoOptions(takePhotoIcon: "chat"),
        materialOptions: MaterialOptions(
          actionBarColor: "#44484F",
          actionBarTitle: "Choisissez vos photos",
          allViewTitle: "All Photos",
          useDetailsView: false,
          selectCircleStrokeColor: "#3CB979",
        ),
      );
    } on Exception catch (e) {
      error = e.toString();
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      pathsList.clear();
      images = resultList;
      _error = error;
      /*resultList.forEach((f) async {
        pathsList.add(await FlutterAbsolutePath.getAbsolutePath(f.identifier));
      });*/
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: ThemeColors.background,
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.topCenter,
              child: new Container(
                height: 70.00,
                width: MediaQuery.of(context).size.width,
                color: ThemeColors.backgroundLight,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      width: 24,
                    ),
                    GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: SvgPicture.asset("assets/arrow-left (1).svg",
                            width: 19)),
                    SizedBox(
                      width: 16,
                    ),
                    Text(
                      "Exprimez-vous",
                      style: Theme.of(context).textTheme.headline1,
                      textScaleFactor: 1.4,
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
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 70.0),
              child: SingleChildScrollView(
                child: Stack(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.topCenter,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                            height: 14,
                          ),
                          // todo: khdam b hada f blasset toggle switch
                          Center(
                            child: Transform.scale(
                              scale: 1.2,
                              child: RoundedCheckBox(
                                onChanged: (index) {
                                  setState(() {
                                    ideeProbleme = index;
                                  });
                                },
                                yesNoText: true,
                                initialState: ideeProbleme,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 14,
                          ),

                          /// page 1 Proposition d'idée
                          !ideeProbleme
                              ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Divider(
                                      color: ThemeColors.backgroundLight,
                                      thickness: 1,
                                      height: 0,
                                    ),
                                    SizedBox(
                                      height: 16,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 12.0),
                                      child: Text(
                                        "Titre",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline1,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 16,
                                    ),
                                    Center(
                                      child: Container(
                                        height: 51.00,
                                        width:
                                            MediaQuery.of(context).size.width -
                                                24,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color:
                                                  ThemeColors.backgroundLight),
                                          color: Colors.transparent,
                                          borderRadius:
                                              BorderRadius.circular(10.00),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.only(left: 15.0),
                                          child: TextField(
                                            keyboardType: TextInputType.text,
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline4,
                                            cursorColor: ThemeColors.mainGreen,
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              hintText:
                                                  "Donnez un titre au proposition",
                                              hintStyle: Theme.of(context)
                                                  .textTheme
                                                  .headline5,
                                            ),
                                            onChanged: (input) {
                                              setState(() {
                                                title = input;
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 14,
                                    ),
                                    Divider(
                                      color: ThemeColors.backgroundLight,
                                      thickness: 1,
                                      height: 0,
                                    ),
                                    SizedBox(
                                      height: 16,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 12.0),
                                      child: Text(
                                        "Contenu",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline1,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 16,
                                    ),
                                    Center(
                                      child: Container(
                                        height: 140.00,
                                        width:
                                            MediaQuery.of(context).size.width -
                                                24,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color:
                                                  ThemeColors.backgroundLight),
                                          color: Colors.transparent,
                                          borderRadius:
                                              BorderRadius.circular(10.00),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.only(left: 15.0),
                                          child: TextField(
                                            maxLines: 10,
                                            keyboardType: TextInputType.text,
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline4,
                                            cursorColor: ThemeColors.mainGreen,
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              hintText:
                                                  "Décrivez la proposition",
                                              hintStyle: Theme.of(context)
                                                  .textTheme
                                                  .headline5,
                                            ),
                                            onChanged: (input) {
                                              setState(() {
                                                contenu = input;
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 14,
                                    ),
                                    Divider(
                                      color: ThemeColors.backgroundLight,
                                      thickness: 1,
                                      height: 0,
                                    ),
                                    SizedBox(
                                      height: 16,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 12.0),
                                      child: Text(
                                        "Ajouter des photos",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline1,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 16.0),
                                      child: Center(
                                        child: InkWell(
                                          onTap: loadAssets,
                                          child: () {
                                            if (pathsList.length == 0) {
                                              return Container(
                                                height: 50.00,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width -
                                                    24,
                                                decoration: BoxDecoration(
                                                  color: ThemeColors
                                                      .backgroundDark,
                                                  border: Border.all(
                                                    width: 1.00,
                                                    color: ThemeColors
                                                        .backgroundLight,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12.00),
                                                ),
                                                child: Center(
                                                  child: SvgPicture.asset(
                                                    "assets/Show more.svg",
                                                    width: 32,
                                                    height: 32,
                                                  ),
                                                ),
                                              );
                                            } else if (pathsList.length == 1) {
                                              return Container(
                                                height: 180.00,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width -
                                                    24,
                                                decoration: BoxDecoration(
                                                  color: ThemeColors
                                                      .backgroundDark,
                                                  border: Border.all(
                                                    width: 1.00,
                                                    color: ThemeColors
                                                        .backgroundLight,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12.00),
                                                ),
                                                child: Image(
                                                    fit: BoxFit.cover,
                                                    image: AssetImage(
                                                        pathsList[0])),
                                              );
                                            } else if (pathsList.length == 2) {
                                              return Container(
                                                height: 180.00,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width -
                                                    24,
                                                decoration: BoxDecoration(
                                                  color: ThemeColors
                                                      .backgroundDark,
                                                  border: Border.all(
                                                    width: 1.00,
                                                    color: ThemeColors
                                                        .backgroundLight,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12.00),
                                                ),
                                                child: Image(
                                                    fit: BoxFit.cover,
                                                    image: AssetImage(
                                                        pathsList[0])),
                                              );
                                            } else {
                                              return Container(
                                                height: 180.00,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width -
                                                    24,
                                                decoration: BoxDecoration(
                                                  color: ThemeColors
                                                      .backgroundDark,
                                                  border: Border.all(
                                                    width: 1.00,
                                                    color: ThemeColors
                                                        .backgroundLight,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12.00),
                                                ),
                                                child: Image(
                                                    fit: BoxFit.cover,
                                                    image: AssetImage(
                                                        pathsList[0])),
                                              );
                                            }
                                          }(),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 88,
                                    )
                                  ],
                                )

                              /// page 2 Signaler un probleme
                              : Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Divider(
                                      color: ThemeColors.backgroundLight,
                                      thickness: 1,
                                      height: 0,
                                    ),
                                    SizedBox(
                                      height: 16,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 12.0),
                                      child: Text(
                                        "Titre",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline1,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 16,
                                    ),
                                    Center(
                                      child: Container(
                                        height: 51.00,
                                        width:
                                            MediaQuery.of(context).size.width -
                                                24,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color:
                                                  ThemeColors.backgroundLight),
                                          color: Colors.transparent,
                                          borderRadius:
                                              BorderRadius.circular(10.00),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.only(left: 15.0),
                                          child: TextField(
                                            keyboardType: TextInputType.text,
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline4,
                                            cursorColor: ThemeColors.mainGreen,
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              hintText:
                                                  "Donnez un titre au problème",
                                              hintStyle: Theme.of(context)
                                                  .textTheme
                                                  .headline5,
                                            ),
                                            onChanged: (input) {
                                              setState(() {
                                                title = input;
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 14,
                                    ),
                                    Divider(
                                      color: ThemeColors.backgroundLight,
                                      thickness: 1,
                                      height: 0,
                                    ),
                                    SizedBox(
                                      height: 16,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 12.0),
                                      child: Text(
                                        "Contenu",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline1,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 16,
                                    ),
                                    Center(
                                      child: Container(
                                        height: 140.00,
                                        width:
                                            MediaQuery.of(context).size.width -
                                                24,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color:
                                                  ThemeColors.backgroundLight),
                                          color: Colors.transparent,
                                          borderRadius:
                                              BorderRadius.circular(10.00),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.only(left: 15.0),
                                          child: TextField(
                                            maxLines: 10,
                                            keyboardType: TextInputType.text,
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline4,
                                            cursorColor: ThemeColors.mainGreen,
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              hintText: "Décrivez le problème",
                                              hintStyle: Theme.of(context)
                                                  .textTheme
                                                  .headline5,
                                            ),
                                            onChanged: (input) {
                                              setState(() {
                                                contenu = input;
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 14,
                                    ),
                                    Divider(
                                      color: ThemeColors.backgroundLight,
                                      thickness: 1,
                                      height: 0,
                                    ),
                                    SizedBox(
                                      height: 16,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 12.0),
                                      child: Text(
                                        "Solution proposée",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline1,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 16,
                                    ),
                                    Center(
                                      child: Container(
                                        height: 140.00,
                                        width:
                                            MediaQuery.of(context).size.width -
                                                24,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color:
                                                  ThemeColors.backgroundLight),
                                          color: Colors.transparent,
                                          borderRadius:
                                              BorderRadius.circular(10.00),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.only(left: 15.0),
                                          child: TextField(
                                            maxLines: 10,
                                            keyboardType: TextInputType.text,
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline4,
                                            cursorColor: ThemeColors.mainGreen,
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              hintText:
                                                  "Quelle solution proposez-vous?",
                                              hintStyle: Theme.of(context)
                                                  .textTheme
                                                  .headline5,
                                            ),
                                            onChanged: (input) {
                                              setState(() {
                                                solution = input;
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 14,
                                    ),
                                    Divider(
                                      color: ThemeColors.backgroundLight,
                                      thickness: 1,
                                      height: 0,
                                    ),
                                    SizedBox(
                                      height: 16,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 12.0),
                                      child: Text(
                                        "Ajouter des photos",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline1,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 16.0),
                                      child: Center(
                                        child: InkWell(
                                          onTap: loadAssets,
                                          child: () {
                                            /// ani dayer 3la 7sab pathsList doka chouf nta ama list
                                            if (pathsList.length == 0) {
                                              return Container(
                                                height: 50.00,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width -
                                                    24,
                                                decoration: BoxDecoration(
                                                  color: ThemeColors
                                                      .backgroundDark,
                                                  border: Border.all(
                                                    width: 1.00,
                                                    color: ThemeColors
                                                        .backgroundLight,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12.00),
                                                ),
                                                child: Center(
                                                  child: SvgPicture.asset(
                                                    "assets/Show more.svg",
                                                    width: 32,
                                                    height: 32,
                                                  ),
                                                ),
                                              );
                                            } else if (pathsList.length == 1) {
                                              return Container(
                                                  height: 180.00,
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width -
                                                      24,
                                                  decoration: BoxDecoration(
                                                    color: ThemeColors
                                                        .backgroundDark,
                                                    border: Border.all(
                                                      width: 1.00,
                                                      color: ThemeColors
                                                          .backgroundLight,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12.00),
                                                  ),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            6.5),
                                                    child: FittedBox(
                                                      child: Image.asset(
                                                          pathsList[0]),
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ));
                                            } else if (pathsList.length == 2) {
                                              return Container(
                                                height: 180.00,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width -
                                                    24,
                                                decoration: BoxDecoration(
                                                  color: ThemeColors
                                                      .backgroundDark,
                                                  border: Border.all(
                                                    width: 1.00,
                                                    color: ThemeColors
                                                        .backgroundLight,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12.00),
                                                ),
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          6.5),
                                                  child: Row(
                                                    children: <Widget>[
                                                      Container(
                                                        height: 180.00,
                                                        width: (MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width -
                                                                27) /
                                                            2,
                                                        child: FittedBox(
                                                          /// 1 ere image
                                                          child: Image.asset(
                                                              pathsList[0]),
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                      Container(
                                                        height: 180.00,
                                                        width: 1,
                                                        color: ThemeColors
                                                            .backgroundLight,
                                                      ),
                                                      Container(
                                                        height: 180.00,
                                                        width: (MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width -
                                                                27) /
                                                            2,
                                                        child: FittedBox(
                                                          /// 2 eme image
                                                          child: Image.asset(
                                                              pathsList[1]),
                                                          fit: BoxFit.cover,
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              );
                                            } else if (pathsList.length == 3) {
                                              return Container(
                                                height: 180.00,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width -
                                                    24,
                                                decoration: BoxDecoration(
                                                  color: ThemeColors
                                                      .backgroundDark,
                                                  border: Border.all(
                                                    width: 1.00,
                                                    color: ThemeColors
                                                        .backgroundLight,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12.00),
                                                ),
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          6.5),
                                                  child: Row(
                                                    children: <Widget>[
                                                      Container(
                                                        height: 180.00,
                                                        width: ((MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width -
                                                                    27) /
                                                                3) *
                                                            2,
                                                        child: FittedBox(
                                                          child: Image.asset(
                                                              pathsList[0]),
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                      Container(
                                                        height: 180.00,
                                                        width: 1,
                                                        color: ThemeColors
                                                            .backgroundLight,
                                                      ),
                                                      Column(
                                                        children: <Widget>[
                                                          Container(
                                                            height: 88.50,
                                                            width: (MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width -
                                                                    27) /
                                                                3,
                                                            child: FittedBox(
                                                              child:
                                                                  Image.asset(
                                                                      pathsList[
                                                                          1]),
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                          Container(
                                                            height: 1,
                                                            width: (MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width -
                                                                    27) /
                                                                3,
                                                            color: ThemeColors
                                                                .backgroundLight,
                                                          ),
                                                          Container(
                                                            height: 88.50,
                                                            width: (MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width -
                                                                    27) /
                                                                3,
                                                            child: FittedBox(
                                                              child:
                                                                  Image.asset(
                                                                      pathsList[
                                                                          2]),
                                                              fit: BoxFit.cover,
                                                            ),
                                                          )
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              );
                                            } else {
                                              return Container(
                                                height: 180.00,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width -
                                                    24,
                                                decoration: BoxDecoration(
                                                  color: ThemeColors
                                                      .backgroundDark,
                                                  border: Border.all(
                                                    width: 1.00,
                                                    color: ThemeColors
                                                        .backgroundLight,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12.00),
                                                ),
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          6.5),
                                                  child: Row(
                                                    children: <Widget>[
                                                      Container(
                                                        height: 180.00,
                                                        width: ((MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width -
                                                                    27) /
                                                                3) *
                                                            2,
                                                        child: FittedBox(
                                                          child: Image.asset(
                                                              pathsList[0]),
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                      Container(
                                                        height: 180.00,
                                                        width: 1,
                                                        color: ThemeColors
                                                            .backgroundLight,
                                                      ),
                                                      Column(
                                                        children: <Widget>[
                                                          Container(
                                                            height: 176.00 / 3,
                                                            width: (MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width -
                                                                    27) /
                                                                3,
                                                            child: FittedBox(
                                                              child:
                                                                  Image.asset(
                                                                      pathsList[
                                                                          1]),
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                          Container(
                                                            height: 1,
                                                            width: (MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width -
                                                                    27) /
                                                                3,
                                                            color: ThemeColors
                                                                .backgroundLight,
                                                          ),
                                                          Container(
                                                            height: 176.00 / 3,
                                                            width: (MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width -
                                                                    27) /
                                                                3,
                                                            child: FittedBox(
                                                              child:
                                                                  Image.asset(
                                                                      pathsList[
                                                                          2]),
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                          Container(
                                                            height: 1,
                                                            width: (MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width -
                                                                    27) /
                                                                3,
                                                            color: ThemeColors
                                                                .backgroundLight,
                                                          ),
                                                          Container(
                                                            height: 136 / 3,
                                                            width: (MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width -
                                                                    27) /
                                                                3,
                                                            child: FittedBox(
                                                              child:
                                                                  Image.asset(
                                                                      pathsList[
                                                                          3]),
                                                              fit: BoxFit.cover,
                                                            ),
                                                          )
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              );
                                            }
                                          }(),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 88,
                                    )
                                  ],
                                )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            /// this is a gradient
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 80,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                  ThemeColors.background.withOpacity(0.0),
                  ThemeColors.background.withOpacity(0.67),
                  ThemeColors.background,
                ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
              ),
            ),

            /// Boutton ENVOYER
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 23.0),
                child: InkWell(
                  onTap: () async {
                    print(ideeProbleme);
                    print("contenu : " + contenu);
                    print("title : " + title);
                    print("solution : " + solution);
                    Response response = await makePostProposition(
                        title,
                        contenu,
                        solution != null ? solution : "",
                        "national",
                        ideeProbleme ? "problem" : "idea");
                    response.body == '{"message":"success"}'
                        ? showSuccessDialog(context, "success")
                        : showErrorDialog(context, response.body);
                  },
                  child: new Container(
                    height: 52.00,
                    width: MediaQuery.of(context).size.width - 48,
                    decoration: BoxDecoration(
                      color: ThemeColors.mainGreen,
                      borderRadius: BorderRadius.circular(82.00),
                    ),
                    child: Center(
                      child: new Text(
                        "ENVOYER",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headline1,
                        textScaleFactor: 1.4,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
