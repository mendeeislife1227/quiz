import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:provider/provider.dart';
import 'package:simpleshop/models/question.dart';
import 'package:simpleshop/models/server.dart';

class Questions extends StatefulWidget {

  @override
  _QuestionsState createState() => _QuestionsState();
}

class _QuestionsState extends State<Questions> {
  List<QuestionsModel> questions = [];
  int currentTestNumber = 1, testNumber;
  @override
  void initState() {
    super.initState();
    Provider.of<ServerRepository>(context, listen: false)
        .getData()
        .then((value) {
      setState(() {
        questions = value;
        testNumber = questions.length;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,width: 375, height: 812);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xff151829),
        elevation: 0,
        title: Padding(
          padding: EdgeInsets.only(top: ScreenUtil().setHeight(28), right: ScreenUtil().setWidth(5), left: ScreenUtil().setWidth(5)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              currentTestNumber == testNumber
                  ? Container(
                height: 5,
                width: ((width - 48) / testNumber) * currentTestNumber,
                color: Color(0xff0DC28B),
              )
                  : ClipPath(
                clipper: ProgressOne(),
                child: Container(
                  height: 5,
                  width: ((width - 48) / testNumber) * currentTestNumber,
                  color: Color(0xff0DC28B),
                ),
              ),
              SizedBox(
                width: ScreenUtil().setWidth(3),
              ),
              currentTestNumber == testNumber
                  ? Container()
                  : Expanded(
                child: ClipPath(
                  clipper: ProgressTwo(),
                  child: Container(
                    height: 5,
                    color: Color(0xff888B94),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Container(
        height: height,
        color: Color(0xff151829),
        child: Padding(
          padding: EdgeInsets.only(top: ScreenUtil().setHeight(60), right: ScreenUtil().setWidth(25), left: ScreenUtil().setWidth(25)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text(
                    'Асуулт ' + currentTestNumber.toString(),
                    style: TextStyle(color: Colors.white, fontSize: ScreenUtil().setSp(22)),
                  ),
                  SizedBox(
                    width: ScreenUtil().setWidth(3),
                  ),
                  Text(
                    '/' + testNumber.toString(),
                    style: TextStyle(color: Color(0xff888B94), fontSize: ScreenUtil().setSp(16)),
                  ),
                ],
              ),
              SizedBox(
                height: ScreenUtil().setHeight(50),
              ),
              Text(
                questions[currentTestNumber - 1].text,
                style: TextStyle(
                    fontSize: ScreenUtil().setSp(19.5),
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: ScreenUtil().setHeight(75),
              ),
              Column(
                  children: questions[currentTestNumber - 1].options
                      .map((e) => Option(
                    option: e,
                    index: questions[currentTestNumber - 1].options.indexOf(e),
                  ))
                      .toList()),
              SizedBox(
                height: ScreenUtil().setHeight(50),
              ),
              Align(
                alignment: Alignment.center,
                child: ButtonTheme(
                  minWidth: ScreenUtil().setWidth(140),
                  height: ScreenUtil().setHeight(40),
                  child: FlatButton(
                      onPressed: () {
                        if (currentTestNumber < testNumber) {
                          setState(() {
                            currentTestNumber++;
                          });
                        }
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      color: Color(0xff888B94),
                      child: Text(
                        'Дараагийн',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: ScreenUtil().setSp(14),
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Option extends StatefulWidget {
  final String option;
  final int index;

  const Option({@required this.option, @required this.index});

  @override
  _OptionState createState() => _OptionState();
}

class _OptionState extends State<Option> {
  bool checked = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ButtonTheme(
          height: ScreenUtil().setHeight(41),
          child: FlatButton(
            onPressed: () {
              setState(() {
                checked = !checked;
                print(widget.index);
              });
            },
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
                side: BorderSide(color: Color(0xff0ca2ff), width: ScreenUtil().setWidth(2))),
            color: Color(0xff151829),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  widget.option,
                  style: TextStyle(color: Colors.white, fontSize: ScreenUtil().setSp(14),),
                ),
                Icon(
                  checked
                      ? Icons.radio_button_checked
                      : Icons.radio_button_unchecked,
                  color: Color(0xff00d091),
                  size: ScreenUtil().setSp(25),
                )
              ],
            ),
          ),
        ),
        SizedBox(height: ScreenUtil().setHeight(20)),
      ],
    );
  }
}

class ProgressOne extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path()
      ..lineTo(0.0, size.height)
      ..lineTo(size.width - 3, size.height)
      ..lineTo(size.width, 0.0)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

class ProgressTwo extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path()
      ..moveTo(0, size.height)
      ..lineTo(size.width, size.height)
      ..lineTo(size.width, 0.0)
      ..lineTo(3, 0.0)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
