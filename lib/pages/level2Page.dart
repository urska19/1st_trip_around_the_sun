
import 'package:flutter/material.dart';
import 'package:first_trip_around_the_sun/pages/levelPage.dart';
import 'package:first_trip_around_the_sun/utils/constants.dart';

class Level2Page extends StatefulWidget {
    int currentScore;
    int numberOfAttempts;
    Level2Page(this.currentScore, this.numberOfAttempts, {super.key});
  @override
  _Level2PageState createState() => _Level2PageState();
}

class _Level2PageState extends State<Level2Page> {
  @override
  Widget build(BuildContext context) {
    return LevelPage(2, widget.numberOfAttempts, widget.currentScore, playerLevel2, ghostLevel2, playerDirLevel2, ghostLastLevel2, foodLevel2, barriersLevel2, blockGhost2, blockGhostPath2, crossLRLevel2, crossUDLevel2, Colors.blueGrey.shade600, Colors.blueGrey.shade700, Colors.blueGrey, foodPaddingLevel2);
  }
}
