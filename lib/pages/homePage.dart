import 'package:audioplayers/audioplayers.dart';
import 'package:first_trip_around_the_sun/buildingBlocks/scoreBox.dart';
import 'package:flutter/material.dart';
import 'package:first_trip_around_the_sun/buildingBlocks/infoBox.dart';
import 'package:first_trip_around_the_sun/buildingBlocks/settingsBox.dart';
import 'package:first_trip_around_the_sun/pages/level1Page.dart';
import 'package:first_trip_around_the_sun/utils/helpers.dart';

import '../main.dart';
import '../utils/constants.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AudioPlayer player = AudioPlayer();
  AudioPlayer playerButton = AudioPlayer();

  @override
  Widget build(BuildContext context) {
    playBackgroundMusic();
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/images/first.png"), fit: BoxFit.fitWidth),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          // mainAxisSize: MainAxisSize.min,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
                // crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        padding: const EdgeInsets.only(top: 45, left: 15),
                        child: IconButton(
                          icon: Image.asset('assets/images/icon_settings.png'),
                          onPressed: () {
                            playButton();
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return const SettingsBox();
                                });
                          },
                        ),
                      )),
                  Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        padding: const EdgeInsets.only(top: 45, right: 15),
                        child: IconButton(
                          icon: Image.asset('assets/images/icon_info.png'),
                          onPressed: () {
                            playButton();
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return const InfoBox();
                                });
                          },
                        ),
                      )),
                ]),
            Expanded(child: Container()),
            Container(
              padding: const EdgeInsets.only(top: 45, left: 15),
              child: GestureDetector(
                            onTap: () {
                              playButton();
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return const ScoreBox();
                                  });
                            },
                            child: Text(partyAnimals,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: contextSize,
                                    height: textHeight)),
                          )
            ),
            Container(height: 10)
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          color: Colors.black,
          child: ElevatedButton(
              onPressed: () {
                playButton();
                player.dispose();
                Navigator.of(context)
                    .pushReplacement(createRouteSlide(Level1Page(), false));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueGrey[700],
              ),
              child: Container(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(homePageBeginGame,
                      style: TextStyle(fontSize: actionButtonTextSize)))),
        ),
      ),
    );
  }

  void playButton() {
    playerButton.play(AssetSource('audio/button.mp3'));
  }

  void playBackgroundMusic() {
    player.play(AssetSource('audio/intro_heart_beat.mp3'));
    player.onPlayerComplete.listen((event) {
      player.play(
        AssetSource('audio/intro_heart_beat.mp3'),
      );
    });
  }
}
