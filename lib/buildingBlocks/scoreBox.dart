import 'package:first_trip_around_the_sun/database/entities/userScore.dart';
import 'package:first_trip_around_the_sun/main.dart';
import 'package:flutter/material.dart';
import 'package:first_trip_around_the_sun/utils/constants.dart';

class ScoreBox extends StatefulWidget {
  const ScoreBox({super.key});

  @override
  _ScoreBoxState createState() => _ScoreBoxState();
}

Future<List<UserScore>> getTopScores() async {
  return await dbHelper.queryTop5Scores('userScore');
}

class _ScoreBoxState extends State<ScoreBox> {
  late List<UserScore> top5Scores;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(infoBoxPadding),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }

  contentBox(context) {
    return Stack(
      children: <Widget>[
        Container(
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                color: Colors.blueGrey.withOpacity(0.5)),
            padding: const EdgeInsets.all(30),
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              Center(
                  child: Text(homePageTopScores,
                      style: TextStyle(
                          fontSize: titleSize,
                          color: Colors.white,
                          height: textHeight))),
              Container(height: 20),
              FutureBuilder(
                future: getTopScores(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState != ConnectionState.done) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasError) {
                    return Center(child: Text(snapshot.error.toString()));
                  }
                  if (!snapshot.hasData) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    // data loaded:
                    var userScores = snapshot.data as List<UserScore>;
                    if (userScores.isEmpty) {
                      return Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Text("Be the first to survive",
                              style: TextStyle(
                                  fontSize: contextSize,
                                  color: Colors.white,
                                  height: textHeight)));
                    } else {
                      return ListView.separated(
                          physics: const NeverScrollableScrollPhysics(),
                          separatorBuilder: (context, index) => const Divider(),
                          shrinkWrap: true,
                          itemCount: userScores.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Row(
                              children: [
                                Text(
                                  userScores[index].name.length >
                                          maxLengthOfNameToDisplay
                                      ? userScores[index]
                                          .name
                                          .substring(
                                              0, maxLengthOfNameToDisplay)
                                          .trim()
                                      : userScores[index].name,
                                  style: TextStyle(
                                      fontSize: contextSize,
                                      color: Colors.white,
                                      height: textHeight),
                                ),
                                Expanded(
                                    child: Text('.' * 100,
                                        maxLines: 1,
                                        style: const TextStyle(
                                            color: Colors.white))),
                                Text(
                                  "${userScores[index].score}",
                                  style: TextStyle(
                                      fontSize: contextSize,
                                      color: Colors.white,
                                      height: textHeight),
                                )
                              ],
                            );
                          });
                    }
                  }
                },
              ),
            ]))
      ],
    );
  }
}
