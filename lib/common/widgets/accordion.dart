import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shopsocks/common/widgets/app_text.dart';
import 'package:sizer/sizer.dart';

class Accordion extends StatefulWidget {
  const Accordion({
    super.key,
    required this.title,
    required this.child,
  });

  final String title;
  final Widget child;
  @override
  _AccordionState createState() => _AccordionState();
}

class _AccordionState extends State<Accordion>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _heightFactor;
  late Animation _colorTween;

  bool _isExpanded = false;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleTap() {
    setState(() {
      _isExpanded = !_isExpanded;
      if (_isExpanded) {
        _controller.forward();
      } else {
        _controller.reverse().then<void>((value) {
          if (!mounted) return;
          setState(() {});
        });
      }
    });
  }

  @override
  void initState() {
    _controller = AnimationController(
      duration: Duration(
        milliseconds: 150,
      ),
      vsync: this,
    );
    _heightFactor = _controller.drive(CurveTween(curve: Curves.easeIn));
    _colorTween = ColorTween(
      begin: Colors.grey,
      end: Colors.black87,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _controller.view,
        builder: (_, __) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: _handleTap,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Flexible(
                      child: AppText(
                        text: widget.title,
                        textStyle: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 11.sp),
                      ),
                    ),
                    Transform.rotate(
                      angle: pi * _heightFactor.value * 0.5,
                      child: Icon(
                        Icons.arrow_forward_ios,
                        color: _colorTween.value,
                      ),
                    )
                  ],
                ),
              ),
              ClipRect(
                child: Align(
                  alignment: Alignment.centerLeft,
                  heightFactor: _heightFactor.value,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 10, left: 10),
                    child: widget.child,
                  ),
                ),
              ),
            ],
          );
        });
  }
}
