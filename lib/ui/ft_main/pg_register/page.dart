import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:kitaro/kitaro.dart';
import 'package:kitaro/ui/ft_add_item/pg_add_item/dg_successful/dialog.dart';
import 'package:provider/provider.dart';

import 'state.dart';

// ------------------------------ VARIABLES -----------------------------
late FocusNode _firstNameNode;
late FocusNode _lastNameNode;
late FocusNode _emailNode;
late FocusNode _address1Node;
late FocusNode _address2Node;
late FocusNode _address3Node;
late FocusNode _cityNode;
late FocusNode _stateNode;
late FocusNode _postcodeNode;
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
        _FirstNameField(),
        _LastNameField(),
        _EmailField(),
        _AddressLine1Field(),
        _AddressLine2Field(),
        _AddressLine3Field(),
        _CityField(),
        _StateField(),
        _PostcodeField(),
        _PasswordField(),
        _PasswordRecheckField(),
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

class _FirstNameField extends StatefulWidget {
  // ---------------------------- CONSTRUCTORS ----------------------------
  const _FirstNameField({
    Key? key,
  }) : super(key: key);

  // ------------------------------- METHODS ------------------------------
  @override
  State<_FirstNameField> createState() => _FirstNameFieldState();
}

class _FirstNameFieldState extends State<_FirstNameField> {
  // ------------------------------- METHODS ------------------------------
  @override
  void initState() {
    super.initState();
    _firstNameNode = FocusNode();
  }

  @override
  void dispose() {
    _firstNameNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<RegisterPageState>(
      builder: (_, state, __) {
        return KitaroTextField(
          labelText: 'first name *',
          errorText: state.firstNameError,
          focusNode: _firstNameNode,
          onChanged: (v) => state.firstName = v,
          onSubmitted: (v) {
            state.firstName = v;
            _lastNameNode.requestFocus();
          },
        );
      },
    );
  }
}

class _LastNameField extends StatefulWidget {
  // ---------------------------- CONSTRUCTORS ----------------------------
  const _LastNameField({
    Key? key,
  }) : super(key: key);

  // ------------------------------- METHODS ------------------------------
  @override
  State<_LastNameField> createState() => _LastNameFieldState();
}

class _LastNameFieldState extends State<_LastNameField> {
  // ------------------------------- METHODS ------------------------------
  @override
  void initState() {
    super.initState();
    _lastNameNode = FocusNode();
  }

  @override
  void dispose() {
    _lastNameNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<RegisterPageState>(
      builder: (_, state, __) {
        return KitaroTextField(
          labelText: 'last name *',
          errorText: state.lastNameError,
          focusNode: _lastNameNode,
          onChanged: (v) => state.lastName = v,
          onSubmitted: (v) {
            state.lastName = v;
            _emailNode.requestFocus();
          },
        );
      },
    );
  }
}

class _EmailField extends StatefulWidget {
  // ---------------------------- CONSTRUCTORS ----------------------------
  const _EmailField({
    Key? key,
  }) : super(key: key);

  // ------------------------------- METHODS ------------------------------
  @override
  State<_EmailField> createState() => _EmailFieldState();
}

class _EmailFieldState extends State<_EmailField> {
  // ------------------------------- METHODS ------------------------------
  @override
  void initState() {
    super.initState();
    _emailNode = FocusNode();
  }

  @override
  void dispose() {
    _emailNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<RegisterPageState>(
      builder: (_, state, __) {
        return KitaroTextField(
          labelText: 'email *',
          errorText: state.emailError,
          focusNode: _emailNode,
          onChanged: (v) => state.email = v,
          onSubmitted: (v) {
            state.email = v;
            _address1Node.requestFocus();
          },
        );
      },
    );
  }
}

class _AddressLine1Field extends StatefulWidget {
  // ---------------------------- CONSTRUCTORS ----------------------------
  const _AddressLine1Field({
    Key? key,
  }) : super(key: key);

  // ------------------------------- METHODS ------------------------------
  @override
  State<_AddressLine1Field> createState() => _AddressLine1FieldState();
}

class _AddressLine1FieldState extends State<_AddressLine1Field> {
  // ------------------------------- METHODS ------------------------------
  @override
  void initState() {
    super.initState();
    _address1Node = FocusNode();
  }

  @override
  void dispose() {
    _address1Node.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<RegisterPageState>(
      builder: (_, state, __) {
        return KitaroTextField(
          labelText: 'address *',
          errorText: state.address1Error,
          focusNode: _address1Node,
          onChanged: (v) => state.address1 = v,
          onSubmitted: (v) {
            state.address1 = v;
            _address2Node.requestFocus();
          },
        );
      },
    );
  }
}

class _AddressLine2Field extends StatefulWidget {
  // ---------------------------- CONSTRUCTORS ----------------------------
  const _AddressLine2Field({
    Key? key,
  }) : super(key: key);

  // ------------------------------- METHODS ------------------------------
  @override
  State<_AddressLine2Field> createState() => _AddressLine2FieldState();
}

class _AddressLine2FieldState extends State<_AddressLine2Field> {
  // ------------------------------- METHODS ------------------------------
  @override
  void initState() {
    super.initState();
    _address2Node = FocusNode();
  }

  @override
  void dispose() {
    _address2Node.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<RegisterPageState>(
      builder: (_, state, __) {
        return KitaroTextField(
          labelText: 'address 2',
          focusNode: _address2Node,
          onChanged: (v) => state.address2 = v,
          onSubmitted: (v) {
            state.address2 = v;
            _address3Node.requestFocus();
          },
        );
      },
    );
  }
}

class _AddressLine3Field extends StatefulWidget {
  // ---------------------------- CONSTRUCTORS ----------------------------
  const _AddressLine3Field({
    Key? key,
  }) : super(key: key);

  // ------------------------------- METHODS ------------------------------
  @override
  State<_AddressLine3Field> createState() => _AddressLine3FieldState();
}

class _AddressLine3FieldState extends State<_AddressLine3Field> {
  // ------------------------------- METHODS ------------------------------
  @override
  void initState() {
    super.initState();
    _address3Node = FocusNode();
  }

  @override
  void dispose() {
    _address3Node.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<RegisterPageState>(
      builder: (_, state, __) {
        return KitaroTextField(
          labelText: 'address 3',
          focusNode: _address3Node,
          onChanged: (v) => state.address3 = v,
          onSubmitted: (v) {
            state.address3 = v;
            _cityNode.requestFocus();
          },
        );
      },
    );
  }
}

class _CityField extends StatefulWidget {
  // ---------------------------- CONSTRUCTORS ----------------------------
  const _CityField({
    Key? key,
  }) : super(key: key);

  // ------------------------------- METHODS ------------------------------
  @override
  State<_CityField> createState() => _CityFieldState();
}

class _CityFieldState extends State<_CityField> {
  // ------------------------------- METHODS ------------------------------
  @override
  void initState() {
    super.initState();
    _cityNode = FocusNode();
  }

  @override
  void dispose() {
    _cityNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<RegisterPageState>(
      builder: (_, state, __) {
        return KitaroTextField(
          labelText: 'city *',
          errorText: state.cityError,
          focusNode: _cityNode,
          onChanged: (v) => state.city = v,
          onSubmitted: (v) {
            state.city = v;
            _stateNode.requestFocus();
          },
        );
      },
    );
  }
}

class _StateField extends StatefulWidget {
  // ---------------------------- CONSTRUCTORS ----------------------------
  const _StateField({
    Key? key,
  }) : super(key: key);

  // ------------------------------- METHODS ------------------------------
  @override
  State<_StateField> createState() => _StateFieldState();
}

class _StateFieldState extends State<_StateField> {
  // ------------------------------- METHODS ------------------------------
  @override
  void initState() {
    super.initState();
    _stateNode = FocusNode();
  }

  @override
  void dispose() {
    _stateNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<RegisterPageState>(
      builder: (_, state, __) {
        return KitaroTextField(
          labelText: 'state *',
          errorText: state.stateError,
          focusNode: _stateNode,
          onChanged: (v) => state.state = v,
          onSubmitted: (v) {
            state.state = v;
            _postcodeNode.requestFocus();
          },
        );
      },
    );
  }
}

class _PostcodeField extends StatefulWidget {
  // ---------------------------- CONSTRUCTORS ----------------------------
  const _PostcodeField({
    Key? key,
  }) : super(key: key);

  // ------------------------------- METHODS ------------------------------
  @override
  State<_PostcodeField> createState() => _PostcodeFieldState();
}

class _PostcodeFieldState extends State<_PostcodeField> {
  // ------------------------------- METHODS ------------------------------
  @override
  void initState() {
    super.initState();
    _postcodeNode = FocusNode();
  }

  @override
  void dispose() {
    _postcodeNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<RegisterPageState>(
      builder: (_, state, __) {
        return KitaroTextField(
          labelText: 'postcode*',
          errorText: state.postcodeError,
          focusNode: _postcodeNode,
          onChanged: (v) => state.postcode = v,
          onSubmitted: (v) {
            state.postcode = v;
            _passwordNode.requestFocus();
          },
        );
      },
    );
  }
}

class _PasswordField extends StatefulWidget {
  // ---------------------------- CONSTRUCTORS ----------------------------
  const _PasswordField({
    Key? key,
  }) : super(key: key);

  // ------------------------------- METHODS ------------------------------
  @override
  State<_PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<_PasswordField> {
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
          labelText: 'password *',
          errorText: state.passwordError,
          focusNode: _passwordNode,
          onChanged: (v) => state.password = v,
          onSubmitted: (v) {
            state.password = v;
            _passwordRecheckNode.requestFocus();
          },
        );
      },
    );
  }
}

class _PasswordRecheckField extends StatefulWidget {
  // ---------------------------- CONSTRUCTORS ----------------------------
  const _PasswordRecheckField({
    Key? key,
  }) : super(key: key);

  // ------------------------------- METHODS ------------------------------
  @override
  State<_PasswordRecheckField> createState() => _PasswordRecheckFieldState();
}

class _PasswordRecheckFieldState extends State<_PasswordRecheckField> {
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
          labelText: 're-type password *',
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
      case InvalidField.firstName:
        _firstNameNode.requestFocus();
        return;
      case InvalidField.lastName:
        _lastNameNode.requestFocus();
        return;
      case InvalidField.email:
        _emailNode.requestFocus();
        return;
      case InvalidField.address1:
        _address1Node.requestFocus();
        return;
      case InvalidField.city:
        _cityNode.requestFocus();
        return;
      case InvalidField.state:
        _stateNode.requestFocus();
        return;
      case InvalidField.postcode:
        _postcodeNode.requestFocus();
        return;
      case InvalidField.password:
        _passwordNode.requestFocus();
        return;
      case InvalidField.recheckPassword:
        _passwordRecheckNode.requestFocus();
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
