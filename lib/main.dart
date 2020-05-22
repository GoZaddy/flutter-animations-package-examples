import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_new_animations_package/testing/testing_show_modal.dart';
import 'testing/testing_container.dart';

import 'testing/testing_fade_scale.dart';
import 'testing/testing_fade_through.dart';
import 'testing/testing_shared_axis.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: <TargetPlatform, PageTransitionsBuilder>{
            TargetPlatform.android: SharedAxisPageTransitionsBuilder(
              transitionType: SharedAxisTransitionType.horizontal
            ),
          },
        ),
      ),
      home: HomePage(),
    ),
  );
}

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    timeDilation = 30;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Material Transitions'),
        leading: FlutterLogo(),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView(
              children: <Widget>[
                _Tile(
                  title: 'Container transform',
                  subtitle: 'OpenContainer',
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) {
                          return TestingContainer();
                        },
                      ),
                    );
                  },
                ),
                _Tile(
                  title: 'Shared axis',
                  subtitle: 'SharedAxisTransition',
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) {
                          return TestingSharedAxis();
                        },
                      ),
                    );
                  },
                ),
                _Tile(
                  title: 'Fade through',
                  subtitle: 'FadeThroughTransition',
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) {
                          return TestingFadeThrough();
                        },
                      ),
                    );
                  },
                ),
                _Tile(
                  title: 'Fade',
                  subtitle: 'FadeScaleTransition',
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) {
                          return TestingFadeScale();
                        },
                      ),
                    );
                  },
                ),
                _Tile(
                  title: 'ShowModal',
                  subtitle: 'showModal function',
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) {
                          return TestingShowModal();
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Tile extends StatelessWidget {
  const _Tile({
    this.onTap,
    this.title,
    this.subtitle,
  });

  final GestureTapCallback onTap;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 15.0,
      ),
      onTap: onTap,
      title: Text(title),
      subtitle: Text(subtitle),
    );
  }
}
