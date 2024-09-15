import 'dart:ui';

import 'package:flutter/material.dart';

class HomeBackground extends StatelessWidget {
  const HomeBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          Align(
            alignment: AlignmentDirectional(4, -0.4),
            child: Container(
              height: 300,
              width: 300,
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: Colors.deepPurple),
            ),
          ),
          Align(
            alignment: AlignmentDirectional(-4, -0.4),
            child: Container(
              height: 300,
              width: 300,
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: Colors.deepPurple),
            ),
          ),
          Align(
            alignment: AlignmentDirectional(0, -1.4),
            child: Container(
              height: 300,
              width: 600,
              decoration: BoxDecoration(color: Colors.orange),
            ),
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 100, sigmaY: 100),
            child: Container(
              decoration: BoxDecoration(color: Colors.transparent),
            ),
          )
        ],
      ),
    );
  }
}
