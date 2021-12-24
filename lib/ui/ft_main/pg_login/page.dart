import 'package:flutter/gestures.dart';
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
class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ChangeNotifierProvider<LoginPageState>(
          create: (_) => LoginPageState(),
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
    return ListView(
      shrinkWrap: true,
      padding: const EdgeInsets.fromLTRB(
        35.0,
        48.0,
        35.0,
        16.0,
      ),
      children: const [
        _Logo(),
        SizedBox(height: 30),
        Text(
          'Welcome Back !',
          style: TextStyle(
            color: Color(0xff47525E),
            fontSize: 28,
            fontWeight: FontWeight.w900,
          ),
        ),
        SizedBox(height: 8),
        Text(
          'Please, sign in to continue',
          style: TextStyle(
            color: Color(0xff969FAA),
            fontSize: 14,
          ),
        ),
        SizedBox(height: 60),
        _Username(),
        _Password(),
        SizedBox(height: 20),
        _ForgotPassword(),
        SizedBox(height: 52),
        _SubmitButton(),
        SizedBox(height: 5),
        _SignInWithGoogle(),
        _SignInWithFacebook(),
        SizedBox(height: 10),
        _SignUp(),
      ],
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
    return Consumer<LoginPageState>(
      builder: (_, state, __) {
        return KitaroTextField(
          labelText: 'Username',
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
    return Consumer<LoginPageState>(
      builder: (_, state, __) {
        return KitaroPasswordTextField(
          labelText: 'Password',
          errorText: state.passwordError,
          focusNode: _usernameNode,
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

class _ForgotPassword extends StatelessWidget {
  // ---------------------------- CONSTRUCTORS ----------------------------
  const _ForgotPassword({
    Key? key,
  }) : super(key: key);

  // ------------------------------- METHODS ------------------------------
  @override
  Widget build(BuildContext context) {
    return Consumer<LoginPageState>(
      builder: (_, state, __) {
        return InkWell(
          child: const Text(
            'Forgot Password?',
            style: TextStyle(
              color: Color(0xff77D353),
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          onTap: () {},
        );
      },
    );
  }
}

class _SignUp extends StatelessWidget {
  // ---------------------------- CONSTRUCTORS ----------------------------
  const _SignUp({
    Key? key,
  }) : super(key: key);

  // ------------------------------- METHODS ------------------------------
  @override
  Widget build(BuildContext context) {
    return Consumer<LoginPageState>(
      builder: (_, state, __) {
        return Center(
          child: RichText(
            text: TextSpan(
              text: 'Don\'t have an account? ',
              style: const TextStyle(
                color: Color(0xff969FAA),
                fontSize: 12,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: ' Sign up',
                  style: const TextStyle(
                      color: Color(0xff77D353),
                      fontSize: 12,
                      fontWeight: FontWeight.bold),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () async{
                      await context.router.push(const RegisterPageRoute());
                    },
                ),
              ],
            ),
          ),
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
    return Consumer<LoginPageState>(
      builder: (_, state, __) {
        return LoginButton(
          caption: 'Sign in',
          isBusy: state.isBusy,
          enabled: !state.isBusy,
          onPressed: () => _onSubmitted(context),
        );
      },
    );
  }

  Future<void> _onSubmitted(BuildContext context) async {
    final state = Provider.of<LoginPageState>(context, listen: false);
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

class _SignInWithGoogle extends StatelessWidget {
  // ---------------------------- CONSTRUCTORS ----------------------------
  const _SignInWithGoogle({
    Key? key,
  }) : super(key: key);

  // ------------------------------- METHODS ------------------------------
  @override
  Widget build(BuildContext context) {
    return Consumer<LoginPageState>(
      builder: (_, state, __) {
        return SizedBox(
          height: 48.0,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28.0),
            child: MaterialButton(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(12.0),
                ),
              ),
              onPressed: () => _onSubmitted(context),
              color: Colors.transparent,
              colorBrightness: Brightness.dark,
              elevation: 0.0,
              focusElevation: 0.0,
              highlightElevation: 0.0,
              hoverElevation: 0.0,
              disabledElevation: 0.0,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image(
                      image: Assets.logos.google,
                      height: 35.0,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                        'Sign in with Google',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black54,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Future<void> _onSubmitted(BuildContext context) async {
    final err1 = await Authentication.signInWithGoogle();

    if (err1 != null) {
      await showWarningDialog(context, err1);
      return;
    }
    await context.router.replace(const RecycleLocationPageRoute());
  }
}

class _SignInWithFacebook extends StatelessWidget {
  // ---------------------------- CONSTRUCTORS ----------------------------
  const _SignInWithFacebook({
    Key? key,
  }) : super(key: key);

  // ------------------------------- METHODS ------------------------------
  @override
  Widget build(BuildContext context) {
    return Consumer<LoginPageState>(
      builder: (_, state, __) {
        return SizedBox(
          height: 48.0,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28.0),
            child: MaterialButton(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(12.0),
                ),
              ),
              onPressed: () => _onSubmitted(context),
              color: Colors.transparent,
              colorBrightness: Brightness.dark,
              elevation: 0.0,
              focusElevation: 0.0,
              highlightElevation: 0.0,
              hoverElevation: 0.0,
              disabledElevation: 0.0,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image(
                      image: Assets.logos.facebook,
                      height: 35.0,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                        'Sign in with Facebook',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black54,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Future<void> _onSubmitted(BuildContext context) async {
    final err1 = await Authentication.signInWithFacebook();

    if (err1 != null) {
      await showWarningDialog(context, err1);
      return;
    }
    await context.router.replace(const RecycleLocationPageRoute());
  }
}
