import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

class TestingFadeScale extends StatefulWidget {
  @override
  _TestingFadeScaleState createState() => _TestingFadeScaleState();
}

enum WhyFarther { harder, smarter, selfStarter, tradingCharter }

class _TestingFadeScaleState extends State<TestingFadeScale>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
        value: 0.0,
        duration: const Duration(milliseconds: 500),
        reverseDuration: const Duration(milliseconds: 250),
        vsync: this)
      ..addStatusListener((status) {
        setState(() {});
      });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  bool get _isAnimationRunningForwardsOrComplete {
    switch (_controller.status) {
      case AnimationStatus.forward:
      case AnimationStatus.completed:
        return true;
      case AnimationStatus.reverse:
      case AnimationStatus.dismissed:
        return false;
    }
    assert(false);
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FadeScale Transition'),
        
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  onPressed: () {
                    if (_isAnimationRunningForwardsOrComplete) {
                      _controller.reverse();
                    } else {
                      _controller.forward();
                    }
                  },
                  color: Colors.blue,
                  child: Text(_isAnimationRunningForwardsOrComplete
                      ? 'Hide Box'
                      : 'Show Box'),
                )
              ],
            ),
          ),

          FadeScaleTransition(
            animation: _controller,
            child: Container(
              height: 200,
              width: 200,
              color: Colors.blue,
            ),
          ),
        ],
      ),
      
    );
  }
}
