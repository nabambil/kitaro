import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:kitaro/kitaro.dart';
import 'package:kitaro/ui/ft_add_item/pg_add_item/dg_successful/dialog.dart';
import 'package:provider/provider.dart';

import 'state.dart';

// ------------------------------ VARIABLES -----------------------------
late FocusNode _usernameNode;
late FocusNode _passwordNode;
late FocusNode _passwordRecheckNode;

// ------------------------------- CLASSES ------------------------------
class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ChangeNotifierProvider<RegisterPageState>(
          create: (_) => RegisterPageState(),
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
          'Welcome',
          style: TextStyle(
            color: Color(0xff47525E),
            fontSize: 28,
            fontWeight: FontWeight.w900,
          ),
        ),
        SizedBox(height: 60),
        _Username(),
        _Password(),
        _PasswordRecheck(),
        SizedBox(height: 52),
        _SubmitButton(),
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
    return Consumer<RegisterPageState>(
      builder: (_, state, __) {
        return KitaroUsernameTextField(
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
    return Consumer<RegisterPageState>(
      builder: (_, state, __) {
        return KitaroPasswordTextField(
          labelText: 'Password',
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

class _PasswordRecheck extends StatefulWidget {
  // ---------------------------- CONSTRUCTORS ----------------------------
  const _PasswordRecheck({
    Key? key,
  }) : super(key: key);

  // ------------------------------- METHODS ------------------------------
  @override
  State<_PasswordRecheck> createState() => _PasswordRecheckState();
}

class _PasswordRecheckState extends State<_PasswordRecheck> {
  // ------------------------------- METHODS ------------------------------
  @override
  void initState() {
    super.initState();
    _passwordRecheckNode = FocusNode();
  }

  @override
  void dispose() {
    _passwordRecheckNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<RegisterPageState>(
      builder: (_, state, __) {
        return KitaroPasswordTextField(
          labelText: 'Re-type Password',
          errorText: state.passwordRecheckError,
          focusNode: _passwordRecheckNode,
          onChanged: (v) => state.passwordRecheck = v,
          onSubmitted: (v) {
            state.passwordRecheck = v;
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

class _SignUp extends StatelessWidget {
  // ---------------------------- CONSTRUCTORS ----------------------------
  const _SignUp({
    Key? key,
  }) : super(key: key);

  // ------------------------------- METHODS ------------------------------
  @override
  Widget build(BuildContext context) {
    return Consumer<RegisterPageState>(
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
                    ..onTap = () {
                      // navigate to desired screen
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
    return Consumer<RegisterPageState>(
      builder: (_, state, __) {
        return LoginButton(
          caption: 'Register',
          isBusy: state.isBusy,
          enabled: !state.isBusy,
          onPressed: () => _onSubmitted(context),
        );
      },
    );
  }

  Future<void> _onSubmitted(BuildContext context) async {
    final state = Provider.of<RegisterPageState>(context, listen: false);
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

    final err1 = await state.register();
    if (err1 != null) {
      await showWarningDialog(context, err1);
      return;
    }
    await context.router.push(const RecycleLocationPageRoute());
  }
}
