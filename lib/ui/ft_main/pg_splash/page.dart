import 'package:firebase_messaging/firebase_messaging.dart';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import 'package:kitaro/kitaro.dart';

// ------------------------------- CLASSES ------------------------------
class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _Content(),
    );
  }
}

class _Content extends StatefulWidget {
  const _Content({Key? key}) : super(key: key);

  @override
  State<_Content> createState() => _ContentState();
}

class _ContentState extends State<_Content> {
  // --------------------------------- METHODS ---------------------------------
  @override
  void initState() {
    super.initState();
    FirebaseMessaging.onMessage.listen((RemoteMessage event) {
      print("message recieved");
      print(event.notification!.body);
    });
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      print('Message clicked!');
    });
    SchedulerBinding.instance!.addPostFrameCallback((_) async {
      bool _isFirstTime = true;
      MySharedPreferences.instance
          .getBooleanValue(isFirstRun)
          .then((value) => setState(() {
                _isFirstTime = value;
              }));
      await Future.delayed(const Duration(seconds: 1));
      if (_isFirstTime) {
        await context.router.replace(const OnBoardingPageRoute());
        return;
      }
      final loggedIn = Authentication.handleAuthState();
      if (!loggedIn) {
        await context.router.replace(const LoginPageRoute());
        return;
      }
      final isLocator = await Authentication.handleLocatorState();
      if (isLocator) {
        await context.router.replace(const LocatorMapPageRoute());
        return;
      }
      await context.router.replace(const RecycleLocationPageRoute());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF16b04a),
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: const Center(
        child: _Logo(),
      ),
    );
  }
}

class _Logo extends StatelessWidget {
  // ---------------------------- CONSTRUCTORS ----------------------------
  const _Logo({
    Key? key,
  }) : super(key: key);

  // ------------------------------- METHODS ------------------------------
  @override
  Widget build(BuildContext context) {
    return Image(
      image: Assets.logos.kitaroLogo,
      height: 200,
      width: 200,
      alignment: Alignment.topLeft,
    );
  }
}
