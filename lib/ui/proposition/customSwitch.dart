import 'package:flutter/material.dart';
import '../../main.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RoundedCheckBox extends StatefulWidget {
  final bool initialState;
  final bool yesNoText;
  final ValueChanged<bool> onChanged;

  const RoundedCheckBox({
    Key key,
    this.initialState = false,
    this.yesNoText = false,
    this.onChanged,
  }) : super(key: key);

  @override
  _RoundedCheckBoxState createState() => _RoundedCheckBoxState();
}

class _RoundedCheckBoxState extends State<RoundedCheckBox> {
  bool checkBoxValue;
  @override
  void initState() {
    checkBoxValue = widget.initialState;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          checkBoxValue = !checkBoxValue;
          widget.onChanged(checkBoxValue);
        });
      },
      onHorizontalDragEnd: (dragEndDetails) {
        if ((dragEndDetails.primaryVelocity > 0) && (checkBoxValue == false)) setState(() {
          checkBoxValue = true;
          widget.onChanged(checkBoxValue);
        });
        else if ((dragEndDetails.primaryVelocity < 0) && (checkBoxValue == true)) setState(() {
          checkBoxValue = false;
          widget.onChanged(checkBoxValue);
        });
      },
      child: ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: Container(
            width: 160,
            height: 40,
            decoration: BoxDecoration(
              color: ThemeColors.backgroundDark,
              borderRadius: BorderRadius.circular(100),
            ),
            child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: ThemeColors.background,
                        blurRadius: 16,
                        spreadRadius: -4,
                        offset: Offset(0, 8))
                  ],
                ),
                child: Stack(
                  children: <Widget>[
                    widget.yesNoText? Container(
                      margin: EdgeInsets.only(left: checkBoxValue? 0 : 36),
                      width: 124,
                      height: 40,
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(checkBoxValue? "Signal de problème" : "Proposition d'idée", style: Theme.of(context).textTheme.headline4,),
                      ),
                    ) : Container(),
                    AnimatedContainer(
                      duration: Duration(milliseconds: 150),
                      curve: Curves.easeInOutCubic,
                      alignment: Alignment.centerLeft,
                      margin: checkBoxValue ? EdgeInsets.only(top: 4, bottom: 4, left: 122, right: 4): EdgeInsets.only(top: 4, bottom: 4, left: 4, right: 122),
                      decoration: BoxDecoration(
                          color: ThemeColors.background,
                          boxShadow: [
                            BoxShadow(
                                color: ThemeColors.backgroundDark,
                                blurRadius: 16,
                                spreadRadius: -4,
                                offset: Offset(0, 8)),
                          ],
                          borderRadius: BorderRadius.circular(100)),
                      child: Center(child:checkBoxValue ?  Icon(FontAwesomeIcons.arrowLeft, size: 16, color: ThemeColors.textColor1,)
                        :Icon(FontAwesomeIcons.arrowRight, size: 16, color: ThemeColors.textColor1,),),
                    ),
                  ],
                )
            ),
          )
      ),
    );
  }
}