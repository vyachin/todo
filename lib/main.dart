import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo/pages/intro.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final q = MediaQuery.of(context);

    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(q.size.width, q.padding.top),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF3867D5), Color(0xFF81C7F5)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Stack(
              children: <Widget>[
                CustomPaint(
                  child: Container(
                    width: q.padding.top + 50,
                    height: q.padding.top + 50,
                  ),
                  painter: CurvePainter(
                    color: Color(0x27f1f1f1),
                    offset: Offset(30, 0),
                  ),
                ),
                CustomPaint(
                  child: Container(
                    width: q.size.width,
                    height: q.padding.top - 3,
                  ),
                  painter: CurvePainter(
                    color: Color(0x27ffffff),
                    offset: Offset(q.size.width - 30, 30),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                      top: q.padding.top, left: 8.0, right: 8.0),
                  height: q.padding.top + 50.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Hello Brenda!',
                              style: TextStyle(
                                  fontSize: 17.0, color: Color(0xFFF1F1F1))),
                          Text('Today you have no tasks',
                              style: TextStyle(
                                  fontSize: 10.0, color: Color(0xFFF1F1F1)))
                        ],
                      ),
                      IconButton(
                        icon: Image.asset('assets/png/avatar.png'),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.add,
            size: 48.0,
          ),
          backgroundColor: Color(0xffF857C3),
          onPressed: () {},
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                size: 32,
              ),
              title: Text('Home'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.view_module, size: 32),
              title: Text('Task'),
            ),
          ],
        ),
        body: Align(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 64.0),
                child: SvgPicture.asset('assets/svg/panel.svg'),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  'No tasks',
                  style: TextStyle(
                    fontSize: 27.0,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff554E8F),
                  ),
                ),
              ),
              Text('You have no task to do.',
                  style: TextStyle(
                    fontSize: 17.0,
                    color: Color(0xff82A0B7),
                  )),
            ],
          ),
        ));
  }
}

class CurvePainter extends CustomPainter {
  Color color;
  Offset offset;

  CurvePainter({this.color, this.offset});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    paint.color = color;
    canvas.drawCircle(offset, size.height, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}
