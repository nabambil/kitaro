import 'package:flutter/material.dart';

import '../../kitaro.dart';

class DialogBase extends StatelessWidget {
  const DialogBase({
    required this.child,
    Key? key,
  }) : super(key: key);

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.all(24.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Wrap(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: child,
          ),
        ],
      ),
    );
  }
}

// ################################# FUNCTIONS #################################
Future<T?> showRawDialog<T>({
  required BuildContext context,
  required AlertDialog dialog,
  bool? barrierDismissible,
}) async {
  return await showGeneralDialog<T>(
    context: context,
    barrierDismissible: barrierDismissible ?? true,
    barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
    pageBuilder: (_, __, ___) => dialog,
    transitionDuration: const Duration(milliseconds: 250),
  );
}

Future<void> showWarningDialog(BuildContext context, ErrorMessage message) {
  return showRawDialog(
    context: context,
    barrierDismissible: false,
    dialog: AlertDialog(
      title: message.title.toUpperCase(),
      message: message.message,
      buttonText: 'RETURN',
      titleTextColor: Colors.red,
      icon: Assets.icons.warning,
    ),
  );
}

Future<void> showSuccessfulDialog({
  required BuildContext context,
  required String title,
  required String message,
  String? carbon,
  bool barrierDismissible = false,
}) {
  return showRawDialog(
    barrierDismissible: barrierDismissible,
    context: context,
    dialog: AlertDialog(
      title: title,
      message: message,
      buttonText: 'THANK YOU',
      titleTextColor: const Color(0xff77D353),
      iconColor: const Color(0xff77D353),
      icon: Assets.icons.leave,
      carbon: carbon,
    ),
  );
}

class AlertDialog extends StatelessWidget {
  final String title;
  final String? message;
  final String buttonText;
  final String? carbon;
  final Color titleTextColor;
  final Color? iconColor;
  final ImageProvider icon;

  const AlertDialog({
    required this.title,
    this.message,
    required this.buttonText,
    required this.titleTextColor,
    required this.icon,
    this.carbon,
    this.iconColor,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DialogBase(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image(
              image: icon,
              color: iconColor,
              height: 79,
              width: 79,
            ),
            const SizedBox(height: 20),
            Text(
              title,
              style: TextStyle(
                color: titleTextColor,
                fontSize: 24,
                // fontFamily: FontFamily.lato,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            if (carbon != null)
              Text(
                "Carbon Emission Saving : ${carbon ?? ''} KG CO²",
                style: const TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
            const SizedBox(height: 20),
            Text(
              message!,
              style: const TextStyle(
                color: Color(0xff47525E),
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),
            SubmitButton(
              caption: buttonText,
              onPressed: () async {
                await context.router.pop();
              },
            )
          ],
        ),
      ),
    );
  }
}
