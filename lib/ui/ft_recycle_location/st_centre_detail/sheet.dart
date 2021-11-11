import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../kitaro.dart';

class CentreDetailsSheet extends StatelessWidget {
  // ---------------------------- CONSTRUCTORS ----------------------------
  const CentreDetailsSheet({
    Key? key,
  }) : super(key: key);

  // ------------------------------- FIELDS -------------------------------

  // ------------------------------- METHODS ------------------------------
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.6,
      child: const _Content(),
    );
  }
}

class _Content extends StatelessWidget {
  // ---------------------------- CONSTRUCTORS ----------------------------
  const _Content({
    Key? key,
  }) : super(key: key);

  // ------------------------------- METHODS ------------------------------
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 20.0,
        horizontal: 12,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const[
          _CentreInfo(),
          SizedBox(height: 25),
          _OperationHoursInfo(),
        ],
      ),
    );
  }
}

class _CentreInfo extends StatelessWidget {
  const _CentreInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const[
        _CentreInfoTitle(),
        SizedBox(height: 15),
        _Text(text: 'Centre Name'),
        _Text(text: 'Centre Phone Number'),
        _Text(text: 'Cycle Type : Plastic, Metal, Paper'),
        SizedBox(height: 15),
        _Text(text: 'Centre Address 1'),
        _Text(text: 'Centre Address 2'),
        _Text(text: 'Centre Address 3'),
      ],
    );
  }
}

class _CentreInfoTitle extends StatelessWidget {
  // ---------------------------- CONSTRUCTORS ----------------------------
  const _CentreInfoTitle({
    Key? key,
  }) : super(key: key);

  // ------------------------------- METHODS ------------------------------
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: const TextSpan(
                text: 'Recycle Centre Info ',
                style: TextStyle(
                  fontSize: 15,
                  color: Color(0xff4D627B),
                  fontWeight: FontWeight.w600,
                ),
                children: [
                  TextSpan(
                    text: '( Kiosk )',
                    style: TextStyle(
                      fontSize: 15,
                      color: Color(0xb347525E),
                      fontWeight: FontWeight.w400
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8.0),
            Container(
              height: 1.0,
              width: 30,
              color: const Color(0xff4D627B),
            )
          ],
        ),
        const Spacer(),
        Image(
          image: Assets.icons.plasticBottle,
          height: 25,
        ),
        Image(
          image: Assets.icons.paper,
          height: 25,
        ),
        Image(
          image: Assets.icons.can,
          height: 25,
        ),
      ],
    );
  }
}

class _OperationHoursInfo extends StatelessWidget {
  const _OperationHoursInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        _OperationHoursTitle(),
        SizedBox(height: 15),
        _Text(text: 'Monday - Friday : 10 am - 5 pm'),
        _Text(text: 'Monday - Friday : 10 am - 5 pm'),
        _Text(text: 'Sunday / Public Holiday : Closed'),
      ],
    );
  }
}

class _OperationHoursTitle extends StatelessWidget {
  // ---------------------------- CONSTRUCTORS ----------------------------
  const _OperationHoursTitle({
    Key? key,
  }) : super(key: key);

  // ------------------------------- METHODS ------------------------------
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Operation Hours',
          style: TextStyle(
            fontSize: 15,
            color: Color(0xff4D627B),
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8.0),
        Container(
          height: 1.0,
          width: 30,
          color: const Color(0xff4D627B),
        )
      ],
    );
  }
}

class _Text extends StatelessWidget {
  // ---------------------------- CONSTRUCTORS ----------------------------
  const _Text({
    required this.text,
    Key? key,
  }) : super(key: key);

  // ---------------------------------- FIELDS ---------------------------------
  final String? text;

  // ------------------------------- METHODS ------------------------------
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0),
      child: Text(
        text!,
        style: const TextStyle(
          color: Color(0xff4D627B),
          fontSize: 14,
        ),
      ),
    );
  }
}
