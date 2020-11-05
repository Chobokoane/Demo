import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: App(),
      ),
    );
  }
}

class App extends StatefulWidget {
  @override
  AppState createState() => AppState();
}

class AppState extends State<App> {
  Image caughtColor = Image.asset("assets/images/tree.jpg");

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        DragBox(Offset(0.0, 200.0), Image.asset("assets/images/10.jpg"),
            Colors.blueAccent),
        DragBox(Offset(0.0, 350.0), Image.asset("assets/images/tree.jpg"),
            Colors.blueAccent),
        DragBox(Offset(0.0, 500.0), Image.asset("assets/images/photo.jpg"),
            Colors.blueAccent),
        Positioned(
          right: 10.0,
          top: 100.0,
          child: DragTarget(
            onAccept: (Image color) {
              caughtColor = color;
            },
            builder: (
              BuildContext context,
              List<dynamic> accepted,
              List<dynamic> rejected,
            ) {
              return Container(
                child: Center(
                  child: Container(
                      width: 100.0,
                      height: 100.0,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.red, // red as border color
                        ),
                      ),
                      child: Center(child: Text("Drag Here!"))),
                ),
              );
            },
          ),
        ),
        Positioned(
          right: 10.0,
          top: 270.0,
          child: DragTarget(
            onAccept: (Image color) {
              caughtColor = color;
            },
            builder: (
              BuildContext context,
              List<dynamic> accepted,
              List<dynamic> rejected,
            ) {
              return Container(
                child: Center(
                  child: Container(
                      width: 100.0,
                      height: 100.0,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.red, // red as border color
                        ),
                      ),
                      child: Center(child: Text("Drag Here!"))),
                ),
              );
            },
          ),
        ),
        Positioned(
          right: 10.0,
          top: 450.0,
          child: DragTarget(
            onAccept: (Image color) {
              caughtColor = color;
            },
            builder: (
              BuildContext context,
              List<dynamic> accepted,
              List<dynamic> rejected,
            ) {
              return Container(

                child: Center(

                  child: Container(
                      width: 100.0,
                      height: 100.0,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.red, // red as border color
                        ),
                      ),
                      child: Center(child: Text("Drag Here!"))),
                ),
              );
            },
          ),
        )
      ],
    );
  }
}

class DragBox extends StatefulWidget {
  final Offset initPos;
  final Image label;
  final Color itemColor;

  DragBox(this.initPos, this.label, this.itemColor);

  @override
  DragBoxState createState() => DragBoxState();
}

class DragBoxState extends State<DragBox> {
  Offset position = Offset(0.0, 20.0);

  @override
  void initState() {
    super.initState();
    position = widget.initPos;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
            left: position.dx,
            top: position.dy,
            child: Draggable(
              data: widget.itemColor,
              child: Container(
                width: 100.0,
                height: 100.0,
                color: widget.itemColor,
                child: Container(
                    width: 100.0,
                    height: 100.0,
                    child: Center(child: widget.label)),
              ),
              onDraggableCanceled: (velocity, offset) {
                setState(() {
                  position = offset;
                });
              },
              feedback: Container(
                width: 100.0,
                height: 100.0,
                color: widget.itemColor.withOpacity(0.5),
                child: Center(
                    child: Container(
                        width: 100.0, height: 100.0, child: widget.label)),
              ),
            )),
      ],
    );
  }
}
