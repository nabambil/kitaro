import 'package:flutter/material.dart';
import 'package:kitaro/kitaro.dart';

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
      title: message.title,
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
}) {
  return showRawDialog(
    context: context,
    dialog: AlertDialog(
      title: title,
      message: message,
      buttonText: 'THANK YOU',
      titleTextColor: const Color(0xff77D353),
      icon: Assets.icons.balloon,
    ),
  );
}

class AlertDialog extends StatelessWidget {
  final String title;
  final String message;
  final String buttonText;
  final Color titleTextColor;
  final ImageProvider icon;

  const AlertDialog({
    required this.title,
    required this.message,
    required this.buttonText,
    required this.titleTextColor,
    required this.icon,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DialogBase(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image(
            image: icon,
            height: 79,
            width: 79,
          ),
          const SizedBox(height: 20),
          Text(
            title,
            style: TextStyle(
              color: titleTextColor,
              fontSize: 32,
              fontFamily: FontFamily.norwester,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          Text(
            message,
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
    );
  }
}
