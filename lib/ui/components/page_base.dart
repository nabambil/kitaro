import 'package:flutter/material.dart';

class PageBase extends StatelessWidget {
  const PageBase({
    required this.child,
    Key? key,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.5,
              color: const Color(0x3377D353),
            ),
            Expanded(
              child: Container(
                color: Colors.transparent,
              ),
            )
          ],
        ),
        child,
      ],
    );
  }
}
