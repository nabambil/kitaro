import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:kitaro/kitaro.dart';
import 'package:provider/provider.dart';

import 'state.dart';

// ------------------------------ VARIABLES -----------------------------
late FocusNode _usernameNode;
late FocusNode _passwordNode;

// ------------------------------- CLASSES ------------------------------
class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ChangeNotifierProvider<AboutPageState>(
          create: (_) => AboutPageState(),
          child: const _Content(),
        ),
      ),
    );
  }
}

class _Content extends StatefulWidget {
  // ------------------------------- CONSTRUCTORS ------------------------------
  const _Content({
    Key? key,
  }) : super(key: key);

  // ------------------------------- METHODS ------------------------------
  @override
  State<_Content> createState() => _ContentState();
}

class _ContentState extends State<_Content> {
  // ------------------------------- METHODS ------------------------------
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance!.addPostFrameCallback((_) async {
      await SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
      ]);

      await Authentication.initializeFirebase();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: [
          const PageBackButton(
            colorOverride: Color(0xff8190A5),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(
                35.0,
                48.0,
                35.0,
                16.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  _Logo(),
                  SizedBox(height: 90),
                  _Username(),
                  _Password(),
                  Spacer(),
                  _SubmitButton(),
                  SizedBox(height: 30),
                  Center(
                    child: Text(
                      'kitaro @2022',
                      style: TextStyle(color: Colors.black26, fontSize: 12),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
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
      image: Assets.logos.logo,
      height: 56,
      width: 57,
      alignment: Alignment.topLeft,
    );
  }
}

class _Username extends StatefulWidget {
  // ---------------------------- CONSTRUCTORS ----------------------------
  const _Username({
    Key? key,
  }) : super(key: key);

  // ------------------------------- METHODS ------------------------------
  @override
  State<_Username> createState() => _UsernameState();
}

class _UsernameState extends State<_Username> {
  // ------------------------------- METHODS ------------------------------
  @override
  void initState() {
    super.initState();
    _usernameNode = FocusNode();
  }

  @override
  void dispose() {
    _usernameNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AboutPageState>(
      builder: (_, state, __) {
        return KitaroTextField(
          labelText: 'Field 1',
          errorText: state.userNameError,
          focusNode: _usernameNode,
          onChanged: (v) => state.userName = v,
          onSubmitted: (v) {
            state.userName = v;
            _passwordNode.requestFocus();
          },
        );
      },
    );
  }
}

class _Password extends StatefulWidget {
  // ---------------------------- CONSTRUCTORS ----------------------------
  const _Password({
    Key? key,
  }) : super(key: key);

  // ------------------------------- METHODS ------------------------------
  @override
  State<_Password> createState() => _PasswordState();
}

class _PasswordState extends State<_Password> {
  // ------------------------------- METHODS ------------------------------
  @override
  void initState() {
    super.initState();
    _passwordNode = FocusNode();
  }

  @override
  void dispose() {
    _passwordNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AboutPageState>(
      builder: (_, state, __) {
        return KitaroTextField(
          labelText: 'Field 2',
          errorText: state.passwordError,
          focusNode: _passwordNode,
          onChanged: (v) => state.password = v,
          onSubmitted: (v) {
            state.password = v;
            final focusScope = FocusScope.of(context);
            if (focusScope.hasFocus) {
              focusScope.unfocus();
            }
            if (focusScope.hasPrimaryFocus) {
              focusScope.unfocus();
            }
          },
        );
      },
    );
  }
}

class _SubmitButton extends StatelessWidget {
  // ---------------------------- CONSTRUCTORS ----------------------------
  const _SubmitButton({
    Key? key,
  }) : super(key: key);

  // ------------------------------- METHODS ------------------------------
  @override
  Widget build(BuildContext context) {
    return Consumer<AboutPageState>(
      builder: (_, state, __) {
        return SizedBox(
          width: MediaQuery.of(context).size.width,
          child: LoginButton(
            caption: 'Submit',
            isBusy: state.isBusy,
            enabled: !state.isBusy,
            onPressed: () => _onSubmitted(context),
          ),
        );
      },
    );
  }

  Future<void> _onSubmitted(BuildContext context) async {
    final state = Provider.of<AboutPageState>(context, listen: false);
    switch (state.validateAll()) {
      case null:
        break;
      case InvalidField.username:
        _usernameNode.requestFocus();
        return;
      case InvalidField.password:
        _passwordNode.requestFocus();
        return;
    }

    final err1 = await state.logIn();
    if (err1 != null) {
      await showWarningDialog(context, err1);
      return;
    }
    await context.router.replace(const RecycleLocationPageRoute());
  }
}
