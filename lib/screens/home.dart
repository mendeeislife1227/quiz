import 'package:flutter/material.dart';
import 'package:simpleshop/screens/player/video_player.dart';
import 'package:simpleshop/screens/questions/questions.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: height,
        width: width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text('Бичлэг үзэх'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FullScreenPlayer()),
                );
              },
            ),
            RaisedButton(
              child: Text('Тест'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Questions()),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
