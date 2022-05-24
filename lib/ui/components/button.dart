import 'package:auto_route/src/router/auto_router_x.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kitaro/constants/constants.dart';

class PageBackButton extends StatelessWidget {
  // ------------------------------- CONSTRUCTORS ------------------------------
  const PageBackButton({
    this.colorOverride,
    this.showBackText = true,
    Key? key,
  }) : super(key: key);

  // ---------------------------------- FIELDS ---------------------------------
  final Color? colorOverride;
  final bool showBackText;

  // --------------------------------- METHODS ---------------------------------
  @override
  Widget build(BuildContext context) {
    final color = colorOverride ?? const Color(0xff8190A5);
    return Material(
      type: MaterialType.transparency,
      child: SizedBox(
        height: 48.0,
        child: InkResponse(
          onTap: () => context.router.pop(),
          child: Row(
            children: [
              Icon(
                CupertinoIcons.left_chevron,
                color: colorOverride ?? Colors.white,
                size: 28.0,
              ),
              if (showBackText)
                Text(
                  'Back',
                  style: TextStyle(
                      color: colorOverride ?? Colors.white, fontSize: 16),
                )
            ],
          ),
        ),
      ),
    );
  }
}

class AddButton extends StatelessWidget {
  // ------------------------------- CONSTRUCTORS ------------------------------
  const AddButton({
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  // ---------------------------------- FIELDS ---------------------------------
  final VoidCallback onPressed;

  // --------------------------------- METHODS ---------------------------------
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: const BorderRadius.all(Radius.circular(8.0)),
      onTap: onPressed,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Icon(
            Icons.add,
            color: Color(0xff8594A8),
            size: 17,
          ),
          Text(
            'Add',
            style: TextStyle(
              fontSize: 22,
              color: Color(0xff8594A8),
            ),
          ),
        ],
      ),
    );
  }
}

class LoginButton extends StatelessWidget {
  // ------------------------------- CONSTRUCTORS ------------------------------
  const LoginButton({
    required this.caption,
    required this.onPressed,
    this.enabled = true,
    this.isBusy = false,
    this.borderRadius = const BorderRadius.all(Radius.circular(12.0)),
    Key? key,
  }) : super(key: key);

  // ---------------------------------- FIELDS ---------------------------------
  final String caption;
  final VoidCallback onPressed;
  final bool enabled;
  final bool isBusy;
  final BorderRadiusGeometry borderRadius;

  // --------------------------------- METHODS ---------------------------------
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48.0,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28.0),
        child: MaterialButton(
          shape: RoundedRectangleBorder(borderRadius: borderRadius),
          onPressed: enabled ? (isBusy ? null : onPressed) : null,
          color: const Color(0xFF16b04a),
          colorBrightness: Brightness.dark,
          elevation: 0.0,
          focusElevation: 0.0,
          highlightElevation: 0.0,
          hoverElevation: 0.0,
          disabledElevation: 0.0,
          child: Text(
            caption,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
          ),
        ),
      ),
    );
  }
}

class SubmitButton extends StatelessWidget {
  // ------------------------------- CONSTRUCTORS ------------------------------
  const SubmitButton({
    required this.caption,
    required this.onPressed,
    this.enabled = true,
    this.isBusy = false,
    this.borderRadius = const BorderRadius.all(Radius.circular(12.0)),
    Key? key,
  }) : super(key: key);

  // ---------------------------------- FIELDS ---------------------------------
  final String caption;
  final VoidCallback onPressed;
  final bool enabled;
  final bool isBusy;
  final BorderRadiusGeometry borderRadius;

  // --------------------------------- METHODS ---------------------------------
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35.0,
      child: MaterialButton(
        padding: const EdgeInsets.symmetric(horizontal: 38.0),
        shape: RoundedRectangleBorder(borderRadius: borderRadius),
        onPressed: enabled ? (isBusy ? null : onPressed) : null,
        color: kThemeColor,
        colorBrightness: Brightness.dark,
        elevation: 0.0,
        focusElevation: 0.0,
        highlightElevation: 0.0,
        hoverElevation: 0.0,
        disabledElevation: 0.0,
        child: Text(
          caption,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
