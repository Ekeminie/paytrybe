import 'package:flutter/material.dart';

class ScaleAnimationWidget extends StatefulWidget {
  Widget? child;

  ScaleAnimationWidget({Key? key, this.child}) : super(key: key);

  @override
  _ScaleAnimationWidgetState createState() => _ScaleAnimationWidgetState();
}

class _ScaleAnimationWidgetState extends State<ScaleAnimationWidget>
    with TickerProviderStateMixin {
  AnimationController? controller;
  Animation<double>? animation;
  final Tween<double> _tween = Tween(begin: 1, end: 1.3);

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 600));
    animation = CurvedAnimation(parent: controller!, curve: Curves.easeIn);
    controller!.repeat(reverse: true);
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _tween
          .animate(CurvedAnimation(parent: controller!, curve: Curves.easeIn)),
      child: widget.child,
    );
  }
}
