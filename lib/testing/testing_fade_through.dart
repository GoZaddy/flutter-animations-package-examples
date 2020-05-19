import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

class TestingFadeThrough extends StatefulWidget {
  @override
  _TestingFadeThroughState createState() => _TestingFadeThroughState();
}

class _TestingFadeThroughState extends State<TestingFadeThrough> {

  int pageIndex = 0;

  List<Widget> pageList = <Widget>[
    Container(key: UniqueKey(),color:Colors.red),
    Container(key: UniqueKey(),color: Colors.blue),
    Container(key: UniqueKey(),color:Colors.green)
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Testing Fade Through')),
      body: PageTransitionSwitcher(
        transitionBuilder: (
          Widget child,
          Animation<double> animation,
          Animation<double> secondaryAnimation
        ){
          return FadeThroughTransition(
            animation: animation,
            secondaryAnimation: secondaryAnimation,
            child: child,
          );
        },
        child: pageList[pageIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: pageIndex,
        onTap: (int newValue) {
          setState(() {
            pageIndex = newValue;
          });
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.looks_one),
            title: Text('First Page'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.looks_two),
            title: Text('Second Page'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.looks_3),
            title: Text('Third Page'),
          ),
        ],
      ),

      
    );
  }
}