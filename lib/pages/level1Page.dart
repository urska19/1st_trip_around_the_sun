
import 'package:flutter/material.dart';
import 'package:first_trip_around_the_sun/pages/levelPage.dart';
import 'package:first_trip_around_the_sun/utils/constants.dart';

class Level1Page extends StatefulWidget {
  @override
  _Level1PageState createState() => _Level1PageState();
}

class _Level1PageState extends State<Level1Page> {

  @override
  Widget build(BuildContext context) {
    return LevelPage(1, defaultNumberOfTries, startScore, playerLevel1, ghostLevel1, playerDirLevel1, ghostLastLevel1, foodLevel1, barriersLevel1, blockGhost1, blockGhostPath1, crossLRLevel1, [], Colors.blueGrey.shade600, Colors.blueGrey.shade700, Colors.blueGrey, foodPaddingLevel1);
  }
}
