import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

class TestingContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
      floatingActionButton: OpenContainer(
        closedBuilder: (_, openContainer){
          return FloatingActionButton(
            elevation: 0.0,
            onPressed: openContainer,
            backgroundColor: Colors.blue,
            child: Icon(Icons.add, color: Colors.white),
          );
        },
        closedElevation: 5.0,
        closedShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100)
        ),
        closedColor: Colors.blue,
        
        openBuilder: (_, closeContainer){
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.blue,
              title: Text("Details"),
              leading: IconButton(
                onPressed: closeContainer,
                icon: Icon(Icons.arrow_back, color: Colors.white),
              ),
            ),
            body: (
              ListView.builder(
                itemCount: 10,
                itemBuilder: (_,index){
                  return ListTile(
                    title: Text(index.toString()),
                  );
                }
              )
            ),
          );
        }
      ),
    );
  }
}