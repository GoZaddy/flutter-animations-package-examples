import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class TestingShowModal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    timeDilation = 20;
    return Scaffold(
      body: Center(
        child: RaisedButton(
          color: Colors.blue,
          child: Text(
            "Show Modal",
            style: TextStyle(
              color: Colors.white      
            ),
          ),
          onPressed: (){
            showModal(
              context: context,
              configuration: FadeScaleTransitionConfiguration(),
              builder: (context){
                return AlertDialog(
                  title: Text("Modal title"),
                  content: Text("This is the modal content"),
                );
              }
            );
          }
        ),
      ),
    );
  }
}