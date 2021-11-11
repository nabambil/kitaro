import 'package:flutter/material.dart';
import 'package:kitaro/kitaro.dart';

class SuccessfulDialog extends StatelessWidget {
  const SuccessfulDialog({
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
            image: Assets.icons.balloon,
            height: 79,
            width: 79,
          ),
          const SizedBox(height: 20),
          const Text(
            'ITEM RECYCLED',
            style: TextStyle(
              color: Color(0xff77D353),
              fontSize: 32,
              fontFamily: FontFamily.norwester,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          const Text(
            'You have saved the earth, You\'re our Hero !',
            style: TextStyle(
              color: Color(0xff47525E),
              fontSize: 16,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 40),
          SubmitButton(
              caption: 'THANK YOU',
              onPressed: () async{
                await context.router.pop();
                await context.router.replace(const HistoryItemListPageRoute());
              }
          )
        ],
      ),
    );
  }
}
