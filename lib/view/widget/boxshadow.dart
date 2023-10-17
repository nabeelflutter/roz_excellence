import 'package:flutter/cupertino.dart';

import '../../constants/constants.dart';

List<BoxShadow> shadowList(){
  return [
    BoxShadow(
        offset: Offset(2, 0),
        color: Constants.anotherYelloww,
        blurRadius: 4),
    BoxShadow(
        offset: Offset(2, -2),
        color: Constants.anotherYelloww,
        blurRadius: 6),
    BoxShadow(
        offset: Offset(-2, -2),
        color: Constants.darkPink.withOpacity(0.1),
        blurRadius: 6),
    BoxShadow(
        offset: Offset(-2, 0),
        color: Constants.lightBlackk,
        blurRadius: 6)
  ];
}