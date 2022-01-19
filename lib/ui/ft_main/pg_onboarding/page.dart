import 'package:flutter/material.dart';
import 'package:kitaro/kitaro.dart';
import 'package:onboarding/onboarding.dart';

// ------------------------------- CLASSES ------------------------------
class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: kThemeColor, body: _Content());
  }
}

class _Content extends StatelessWidget {
  // ---------------------------- CONSTRUCTORS ----------------------------
  _Content({
    Key? key,
  }) : super(key: key);

  // --------------------------------- METHODS ---------------------------------
  final onboardingPagesList = [
    PageModel(
      widget: _PageModel(
        image: Assets.gifs.marker,
        title: 'Check Nearest Location',
      ),
    ),
    PageModel(
      widget: _PageModel(
        image: Assets.gifs.scanQr,
        title: 'Scan QR to Recycle',
      ),
    ),
    PageModel(
      widget: _PageModel(
        image: Assets.gifs.recycle,
        title: 'Together Help Earth be Better Place',
      ),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Onboarding(
      pagesContentPadding: const EdgeInsets.all(20),
      skipButtonStyle: const SkipButtonStyle(skipButtonColor: kThemeColor),
      background: Colors.white,
      proceedButtonStyle: ProceedButtonStyle(
        proceedButtonColor: kThemeColor,
        proceedpButtonText: const Text(
          'Finish',
          style: TextStyle(
            color: Colors.white,
            letterSpacing: 1.0,
          ),
        ),
        proceedButtonRoute: (context) {
          MySharedPreferences.instance.setBooleanValue(isFirstRun, false);
          return context.router.replace(const LoginPageRoute());
        },
      ),
      isSkippable: true,
      pages: onboardingPagesList,
      indicator: Indicator(
        indicatorDesign: IndicatorDesign.polygon(
          polygonDesign: PolygonDesign(
            polygon: DesignType.polygon_circle,
          ),
        ),
        activeIndicator:
            const ActiveIndicator(color: Color(0xff13CE66), borderWidth: 0.7),
        closedIndicator:
            const ClosedIndicator(color: Color(0xff13CE66), borderWidth: 0.7),
      ),
    );
  }
}

class _PageModel extends StatelessWidget {
  // ---------------------------- CONSTRUCTORS ----------------------------
  const _PageModel({
    Key? key,
    required this.image,
    required this.title,
  }) : super(key: key);

  final ImageProvider image;
  final String title;

  // --------------------------------- METHODS ---------------------------------
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            // padding: const EdgeInsets.only(bottom: .0),
            child: Image(
          image: image,
          height: MediaQuery.of(context).size.height * 0.6,
        )),
        SizedBox(
          width: double.infinity,
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 23.0,
              wordSpacing: 1,
              letterSpacing: 1.2,
              fontWeight: FontWeight.bold,
              color: kThemeColor,
            ),
          ),
        ),
      ],
    );
  }
}
