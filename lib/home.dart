import 'package:flutter/material.dart';
import './animation_controller.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[700],
        title: Center(
          child: Text(
            'Home',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            const AnimatedContainerWidget(),
            Divider(),
            const AnimatedCrossFadeWidget(),
            Divider(),
            const AnimatedOpacityWidget(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) {
              return AnimationControllerWidget();
            }
            ),
          );
        },
        tooltip: 'AnimationController',
        child: const Icon(Icons.near_me_sharp),
      ),
    );
  }
}

class AnimatedContainerWidget extends StatefulWidget {
  const AnimatedContainerWidget({
    Key? key,
  }) : super(key: key);
  @override
  _AnimatedContainerWidgetState createState() =>
      _AnimatedContainerWidgetState();
}

class _AnimatedContainerWidgetState extends State<AnimatedContainerWidget> {
  double _height = 100.0;
  double _width = 100.0;
  void _increaseWidth() {
    setState(() {
      _width = _width >= 320.0 ? 100.0 : _width += 50.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        AnimatedContainer(
          duration: Duration(milliseconds: 500),
          curve: Curves.elasticOut,
          color: Colors.amber,
          height: _height,
          width: _width,
          child: TextButton(
            child: Text('Tap to\nGrow Width\n$_width'),
            onPressed: () {
              _increaseWidth();
            },
          ),
        ),
      ],
    );
  }
}

class AnimatedCrossFadeWidget extends StatefulWidget {
  const AnimatedCrossFadeWidget({super.key});

  @override
  State<AnimatedCrossFadeWidget> createState() =>
      _AnimatedCrossFadeWidgetStateState();
}

class _AnimatedCrossFadeWidgetStateState
    extends State<AnimatedCrossFadeWidget> {
  bool _crossFadeStateShowFirst = true;
  void _crossFade() {
    setState(() {
      _crossFadeStateShowFirst = _crossFadeStateShowFirst ? false : true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Stack(
          alignment: Alignment.center,
          children: <Widget>[
            AnimatedCrossFade(
              duration: Duration(milliseconds: 500),
              sizeCurve: Curves.bounceOut,
              crossFadeState: _crossFadeStateShowFirst
                  ? CrossFadeState.showFirst
                  : CrossFadeState.showSecond,
              firstChild: Container(
                color: Colors.amber,
                height: 100.0,
                width: 100.0,
              ),
              secondChild: Container(
                color: Colors.lime,
                height: 200.0,
                width: 200.0,
              ),
            ),
            Positioned.fill(
              child: TextButton(
                child: Text('Tap to\nFade Color & Size'),
                onPressed: () {
                  _crossFade();
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class AnimatedOpacityWidget extends StatefulWidget {
  const AnimatedOpacityWidget({
    Key? key,
  }) : super(key: key);
  @override
  _AnimatedOpacityWidgetState createState() => _AnimatedOpacityWidgetState();
}

class _AnimatedOpacityWidgetState extends State<AnimatedOpacityWidget> {
  double _opacity = 1.0;
  void _animatedOpacity() {
    setState(() {
      _opacity = _opacity == 1.0 ? 0.3 : 1.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        AnimatedOpacity(
          duration: Duration(milliseconds: 500),
          opacity: _opacity,
          child: Container(
            color: Colors.amber,
            height: 100.0,
            width: 100.0,
            child: TextButton(
              child: Text('Tap to Fade'),
              onPressed: () {
                _animatedOpacity();
              },
            ),
          ),
        ),
      ],
    );
  }
}
