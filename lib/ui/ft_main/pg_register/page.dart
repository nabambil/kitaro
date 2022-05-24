import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:kitaro/kitaro.dart';
import 'package:provider/provider.dart';

import 'state.dart';

// ------------------------------ VARIABLES -----------------------------
late FocusNode _firstNameNode;
late FocusNode _lastNameNode;
late FocusNode _idNumberNode;
late FocusNode _phoneNode;
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
  const RegisterPage(
      {required this.isFirstTimeWithFacebookSignIn,
      required this.isFirstTimeWithGoogleSignIn,
      this.userCredential,
      Key? key})
      : super(key: key);

  final bool isFirstTimeWithGoogleSignIn;
  final bool isFirstTimeWithFacebookSignIn;
  final UserCredential? userCredential;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider<RegisterPageState>(
        create: (_) => RegisterPageState(
          isFirstTimeWithGoogleSignIn: isFirstTimeWithGoogleSignIn,
          isFirstTimeWithFacebookSignIn: isFirstTimeWithFacebookSignIn,
          userCredential: userCredential,
        ),
        child: const _Content(),
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

      // final state = Provider.of<RegisterPageState>(context, listen: false);
      // await Authentication.initializeFirebase();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<RegisterPageState>(builder: (_, state, __) {
      return Column(
        children: [
          const _Logo(),
          Expanded(
            child: ListView(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              padding: const EdgeInsets.fromLTRB(
                20.0,
                0.0,
                20.0,
                16.0,
              ),
              children: [
                const Text(
                  'Welcome',
                  style: TextStyle(
                    color: Color(0xff47525E),
                    fontSize: 28,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(height: 20),
                const _FirstNameField(),
                const _LastNameField(),
                const _IdNumberField(),
                const _PhoneNumberField(),
                Visibility(
                  visible: !state.isFirstTimeWithGoogleSignIn ||
                      state.isFirstTimeWithFacebookSignIn,
                  child: const _EmailField(),
                ),
                const _AddressLine1Field(),
                const _AddressLine2Field(),
                const _AddressLine3Field(),
                const _CityField(),
                const _StateField(),
                const _PostcodeField(),
                Visibility(
                    visible: !state.isFirstTimeWithGoogleSignIn &&
                        !state.isFirstTimeWithFacebookSignIn,
                    child: const _PasswordField()),
                Visibility(
                  visible: !state.isFirstTimeWithGoogleSignIn &&
                      !state.isFirstTimeWithFacebookSignIn,
                  child: const _PasswordRecheckField(),
                ),
                const SizedBox(height: 52),
                const _SubmitButton(),
              ],
            ),
          ),
        ],
      );
    });
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
    return Stack(
      children: [
        ClipPath(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 150,
            // color: kThemeColor,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.3, 2],
              colors: [
                kThemeColor,
                kThemeColorDarker,
              ],
            )),
          ),
          clipper: CustomClipPath(),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20.0, top: 50),
          child: Image(
            image: Assets.logos.kitaroLogoMain,
            height: 120,
            width: 120,
            alignment: Alignment.topLeft,
          ),
        ),
      ],
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

class _FirstNameFieldState extends State<_FirstNameField>
    with AutomaticKeepAliveClientMixin {
  // -------------------------------- PROPERTIES -------------------------------
  @override
  bool get wantKeepAlive => true;

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
    super.build(context);
    return Consumer<RegisterPageState>(
      builder: (_, state, __) {
        return KitaroTextField(
          labelText: 'First name *',
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

class _LastNameFieldState extends State<_LastNameField>
    with AutomaticKeepAliveClientMixin {
  // -------------------------------- PROPERTIES -------------------------------
  @override
  bool get wantKeepAlive => true;

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
          labelText: 'Last name *',
          errorText: state.lastNameError,
          focusNode: _lastNameNode,
          onChanged: (v) => state.lastName = v,
          onSubmitted: (v) {
            state.lastName = v;
            _idNumberNode.requestFocus();
          },
        );
      },
    );
  }
}

class _IdNumberField extends StatefulWidget {
  // ---------------------------- CONSTRUCTORS ----------------------------
  const _IdNumberField({
    Key? key,
  }) : super(key: key);

  // ------------------------------- METHODS ------------------------------
  @override
  State<_IdNumberField> createState() => _IdNumberFieldState();
}

class _IdNumberFieldState extends State<_IdNumberField>
    with AutomaticKeepAliveClientMixin {
  // -------------------------------- PROPERTIES -------------------------------
  @override
  bool get wantKeepAlive => true;

  // ------------------------------- METHODS ------------------------------
  @override
  void initState() {
    super.initState();
    _idNumberNode = FocusNode();
  }

  @override
  void dispose() {
    _idNumberNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<RegisterPageState>(
      builder: (_, state, __) {
        return KitaroTextField(
          labelText: 'IC number (optional)',
          focusNode: _idNumberNode,
          onChanged: (v) => state.idNumber = v,
          onSubmitted: (v) {
            state.idNumber = v;
            _phoneNode.requestFocus();
          },
          keyboardType: TextInputType.number,
        );
      },
    );
  }
}

class _PhoneNumberField extends StatefulWidget {
  // ---------------------------- CONSTRUCTORS ----------------------------
  const _PhoneNumberField({
    Key? key,
  }) : super(key: key);

  // ------------------------------- METHODS ------------------------------
  @override
  State<_PhoneNumberField> createState() => _PhoneNumberFieldState();
}

class _PhoneNumberFieldState extends State<_PhoneNumberField>
    with AutomaticKeepAliveClientMixin {
  // -------------------------------- PROPERTIES -------------------------------
  @override
  bool get wantKeepAlive => true;

  // ------------------------------- METHODS ------------------------------
  @override
  void initState() {
    super.initState();
    _phoneNode = FocusNode();
  }

  @override
  void dispose() {
    _phoneNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<RegisterPageState>(
      builder: (_, state, __) {
        return KitaroTextField(
          labelText: 'Phone number *',
          errorText: state.phoneNumberError,
          focusNode: _phoneNode,
          onChanged: (v) => state.phoneNumber = v,
          onSubmitted: (v) {
            state.phoneNumber = v;
            _emailNode.requestFocus();
          },
          keyboardType: TextInputType.phone,
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

class _EmailFieldState extends State<_EmailField>
    with AutomaticKeepAliveClientMixin {
  // -------------------------------- PROPERTIES -------------------------------
  @override
  bool get wantKeepAlive => true;

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
          labelText: 'Email *',
          errorText: state.emailError,
          focusNode: _emailNode,
          onChanged: (v) => state.email = v,
          onSubmitted: (v) {
            state.email = v;
            _address1Node.requestFocus();
          },
          keyboardType: TextInputType.emailAddress,
          inputFormatters: [
            FilteringTextInputFormatter.deny(RegExp(r'\s')),
          ],
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

class _AddressLine1FieldState extends State<_AddressLine1Field>
    with AutomaticKeepAliveClientMixin {
  // -------------------------------- PROPERTIES -------------------------------
  @override
  bool get wantKeepAlive => true;

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
          labelText: 'Address *',
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

class _AddressLine2FieldState extends State<_AddressLine2Field>
    with AutomaticKeepAliveClientMixin {
  // -------------------------------- PROPERTIES -------------------------------
  @override
  bool get wantKeepAlive => true;

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
          labelText: 'Address 2',
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

class _AddressLine3FieldState extends State<_AddressLine3Field>
    with AutomaticKeepAliveClientMixin {
  // -------------------------------- PROPERTIES -------------------------------
  @override
  bool get wantKeepAlive => true;

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
          labelText: 'Address 3',
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

class _CityFieldState extends State<_CityField>
    with AutomaticKeepAliveClientMixin {
  // -------------------------------- PROPERTIES -------------------------------
  @override
  bool get wantKeepAlive => true;

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
          labelText: 'City *',
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

class _StateFieldState extends State<_StateField>
    with AutomaticKeepAliveClientMixin {
  // -------------------------------- PROPERTIES -------------------------------
  @override
  bool get wantKeepAlive => true;

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
          labelText: 'State *',
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

class _PostcodeFieldState extends State<_PostcodeField>
    with AutomaticKeepAliveClientMixin {
  // -------------------------------- PROPERTIES -------------------------------
  @override
  bool get wantKeepAlive => true;

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
          labelText: 'Postcode*',
          errorText: state.postcodeError,
          focusNode: _postcodeNode,
          onChanged: (v) => state.postcode = v,
          onSubmitted: (v) {
            state.postcode = v;
            _passwordNode.requestFocus();
          },
          keyboardType: TextInputType.number,
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

class _PasswordFieldState extends State<_PasswordField>
    with AutomaticKeepAliveClientMixin {
  // -------------------------------- PROPERTIES -------------------------------
  @override
  bool get wantKeepAlive => true;

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
          labelText: 'Password *',
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

class _PasswordRecheckFieldState extends State<_PasswordRecheckField>
    with AutomaticKeepAliveClientMixin {
  // -------------------------------- PROPERTIES -------------------------------
  @override
  bool get wantKeepAlive => true;

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
          labelText: 'Re-type password *',
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
      case InvalidField.idNumber:
        _idNumberNode.requestFocus();
        return;
      case InvalidField.phoneNumber:
        _phoneNode.requestFocus();
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

    final err1 = await showBusyIndicator<ErrorMessage?>(
        initialStatus: 'loading...', action: state.register);
    if (err1 != null) {
      await showWarningDialog(context, err1);
      return;
    }
    await context.router.replaceAll([const RecycleLocationPageRoute()]);
  }
}
