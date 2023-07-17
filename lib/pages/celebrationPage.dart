import 'package:audioplayers/audioplayers.dart';
import 'package:first_trip_around_the_sun/pages/homePage.dart';
import 'package:flutter/material.dart';
import 'package:first_trip_around_the_sun/utils/helpers.dart';

import '../utils/constants.dart';

class CelebrationPage extends StatefulWidget {
  @override
  _CelebrationPageState createState() => _CelebrationPageState();
}

class _CelebrationPageState extends State<CelebrationPage> {
  AudioPlayer player = AudioPlayer();
  AudioPlayer playerButton = AudioPlayer();

  @override
  Widget build(BuildContext context) {
    playBackgroundMusic();
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/images/celebration.png"),
            fit: BoxFit.fitWidth),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Expanded(child: Container()),
            Align(
                alignment: Alignment.topRight,
                child: Container(
                    padding: const EdgeInsets.only(top: 45, right: 15),
                    child: GestureDetector(
                      onTap: () {
                        playButton();
                        Navigator.of(context).pushAndRemoveUntil(
                            createRouteSlide(HomePage(), true),
                            (Route<dynamic> route) => false);
                      },
                      child: Text(goAgain,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: contextSize,
                              height: textHeight)),
                    ))),
          ]),
          Expanded(child: Container())
        ]),
      ),
    );
  }

  void playButton() {
    playerButton.play(AssetSource('audio/button.mp3'));
  }

  void playBackgroundMusic() {
    player.play(AssetSource('audio/cheering-and-clapping.mp3'));
    player.onPlayerComplete.listen((event) {
      player.play(
        AssetSource('audio/cheering-and-clapping.mp3'),
      );
    });
  }
}
