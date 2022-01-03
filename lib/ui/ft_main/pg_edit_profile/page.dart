// ------------------------------ VARIABLES -----------------------------
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'package:kitaro/kitaro.dart';
import 'state.dart';

late FocusNode _firstNameNode;
late FocusNode _lastNameNode;
late FocusNode _idNumberNode;
late FocusNode _phoneNumberNode;
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
class EditProfilePage extends StatelessWidget {
  const EditProfilePage({
    required this.user,
    required this.userAddress,
    Key? key,
  }) : super(key: key);

  final KitaroAccount user;
  final AddressModel userAddress;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ChangeNotifierProvider<EditProfilePageState>(
          create: (_) => EditProfilePageState(
            user: user,
            userAddress: userAddress,
          ),
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

      final state = Provider.of<EditProfilePageState>(context, listen: false);
      await state.initialiseEditItem();
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
        // SizedBox(height: 30),
        Text(
          'Edit Profile Details',
          style: TextStyle(
            color: Color(0xff47525E),
            fontSize: 28,
            fontWeight: FontWeight.w900,
          ),
        ),
        SizedBox(height: 60),
        _FirstNameField(),
        SizedBox(height: 25),
        _LastNameField(),
        SizedBox(height: 25),
        _IdNumberField(),
        SizedBox(height: 25),
        _PhoneNumberField(),
        SizedBox(height: 25),
        _EmailField(),
        SizedBox(height: 25),
        _AddressLine1Field(),
        SizedBox(height: 25),
        _AddressLine2Field(),
        SizedBox(height: 25),
        _AddressLine3Field(),
        SizedBox(height: 25),
        _CityField(),
        SizedBox(height: 25),
        _StateField(),
        SizedBox(height: 25),
        _PostcodeField(),
        // SizedBox(height: 15),
        // _PasswordField(),
        // SizedBox(height: 15),
        // _PasswordRecheckField(),
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
      image: Assets.logos.kitaroLogo,
      height: 120,
      width: 120,
      color: kThemeColor,
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

class _FirstNameFieldState extends State<_FirstNameField>
    with AutomaticKeepAliveClientMixin {
  // ------------------------------- FIELDS -------------------------------
  final _controller = TextEditingController();

  // -------------------------------- PROPERTIES -------------------------------
  @override
  bool get wantKeepAlive => true;

  // --------------------------------- METHODS ---------------------------------
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
    return Consumer<EditProfilePageState>(
      builder: (_, state, __) {
        if (state.updateTextController) {
          _controller.text = state.firstName ?? "";
        }
        return KitaroTextBox(
          controller: _controller,
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

class _LastNameFieldState extends State<_LastNameField>
    with AutomaticKeepAliveClientMixin {
  // ------------------------------- FIELDS -------------------------------
  final _controller = TextEditingController();

  // -------------------------------- PROPERTIES -------------------------------
  @override
  bool get wantKeepAlive => true;

  // --------------------------------- METHODS ---------------------------------
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
    super.build(context);
    return Consumer<EditProfilePageState>(
      builder: (_, state, __) {
        if (state.updateTextController) {
          _controller.text = state.lastName ?? "";
        }
        return KitaroTextBox(
          controller: _controller,
          labelText: 'last name *',
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
  // ------------------------------- FIELDS -------------------------------
  final _controller = TextEditingController();

  // -------------------------------- PROPERTIES -------------------------------
  @override
  bool get wantKeepAlive => true;

  // --------------------------------- METHODS ---------------------------------
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
    super.build(context);
    return Consumer<EditProfilePageState>(
      builder: (_, state, __) {
        if (state.updateTextController) {
          _controller.text = state.idNumber ?? "";
        }
        return KitaroTextBox(
          controller: _controller,
          labelText: 'ID number *',
          errorText: state.idNumberError,
          focusNode: _idNumberNode,
          onChanged: (v) => state.idNumber = v,
          onSubmitted: (v) {
            state.idNumber = v;
            _phoneNumberNode.requestFocus();
          },
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
  // ------------------------------- FIELDS -------------------------------
  final _controller = TextEditingController();

  // -------------------------------- PROPERTIES -------------------------------
  @override
  bool get wantKeepAlive => true;

  // --------------------------------- METHODS ---------------------------------
  @override
  void initState() {
    super.initState();
    _phoneNumberNode = FocusNode();
  }

  @override
  void dispose() {
    _phoneNumberNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Consumer<EditProfilePageState>(
      builder: (_, state, __) {
        if (state.updateTextController) {
          _controller.text = state.phoneNumber ?? "";
        }
        return KitaroTextBox(
          controller: _controller,
          labelText: 'phone number *',
          errorText: state.phoneNumberError,
          focusNode: _phoneNumberNode,
          onChanged: (v) => state.phoneNumber = v,
          onSubmitted: (v) {
            state.phoneNumber = v;
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

class _EmailFieldState extends State<_EmailField>
    with AutomaticKeepAliveClientMixin {
  // ------------------------------- FIELDS -------------------------------
  final _controller = TextEditingController();

  // -------------------------------- PROPERTIES -------------------------------
  @override
  bool get wantKeepAlive => true;

  // --------------------------------- METHODS ---------------------------------
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
    super.build(context);
    return Consumer<EditProfilePageState>(
      builder: (_, state, __) {
        if (state.updateTextController) {
          _controller.text = state.email ?? "";
        }
        return KitaroTextBox(
          controller: _controller,
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

class _AddressLine1FieldState extends State<_AddressLine1Field>
    with AutomaticKeepAliveClientMixin {
  // ------------------------------- FIELDS -------------------------------
  final _controller = TextEditingController();

  // -------------------------------- PROPERTIES -------------------------------
  @override
  bool get wantKeepAlive => true;

  // --------------------------------- METHODS ---------------------------------
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
    super.build(context);
    return Consumer<EditProfilePageState>(
      builder: (_, state, __) {
        if (state.updateTextController) {
          _controller.text = state.address1 ?? "";
        }
        return KitaroTextBox(
          controller: _controller,
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

class _AddressLine2FieldState extends State<_AddressLine2Field>
    with AutomaticKeepAliveClientMixin {
  // ------------------------------- FIELDS -------------------------------
  final _controller = TextEditingController();

  // -------------------------------- PROPERTIES -------------------------------
  @override
  bool get wantKeepAlive => true;

  // --------------------------------- METHODS ---------------------------------
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
    super.build(context);
    return Consumer<EditProfilePageState>(
      builder: (_, state, __) {
        if (state.updateTextController) {
          _controller.text = state.address2 ?? '';
        }
        return KitaroTextBox(
          controller: _controller,
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

class _AddressLine3FieldState extends State<_AddressLine3Field>
    with AutomaticKeepAliveClientMixin {
  // ------------------------------- FIELDS -------------------------------
  final _controller = TextEditingController();

  // -------------------------------- PROPERTIES -------------------------------
  @override
  bool get wantKeepAlive => true;

  // --------------------------------- METHODS ---------------------------------
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
    super.build(context);
    return Consumer<EditProfilePageState>(
      builder: (_, state, __) {
        if (state.updateTextController) {
          _controller.text = state.address3 ?? '';
        }
        return KitaroTextBox(
          controller: _controller,
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

class _CityFieldState extends State<_CityField>
    with AutomaticKeepAliveClientMixin {
  // ------------------------------- FIELDS -------------------------------
  final _controller = TextEditingController();

  // -------------------------------- PROPERTIES -------------------------------
  @override
  bool get wantKeepAlive => true;

  // --------------------------------- METHODS ---------------------------------
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
    super.build(context);
    return Consumer<EditProfilePageState>(
      builder: (_, state, __) {
        if (state.updateTextController) {
          _controller.text = state.city ?? "";
        }
        return KitaroTextBox(
          controller: _controller,
          labelText: 'city *',
          focusNode: _cityNode,
          errorText: state.cityError,
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
  // ------------------------------- FIELDS -------------------------------
  final _controller = TextEditingController();

  // -------------------------------- PROPERTIES -------------------------------
  @override
  bool get wantKeepAlive => true;

  // --------------------------------- METHODS ---------------------------------
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
    super.build(context);
    return Consumer<EditProfilePageState>(
      builder: (_, state, __) {
        if (state.updateTextController) {
          _controller.text = state.state ?? "";
        }
        return KitaroTextBox(
          controller: _controller,
          labelText: 'state *',
          focusNode: _stateNode,
          errorText: state.stateError,
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
  // ------------------------------- FIELDS -------------------------------
  final _controller = TextEditingController();

  // -------------------------------- PROPERTIES -------------------------------
  @override
  bool get wantKeepAlive => true;

  // --------------------------------- METHODS ---------------------------------
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
    super.build(context);
    return Consumer<EditProfilePageState>(
      builder: (_, state, __) {
        if (state.updateTextController) {
          _controller.text = state.postcode ?? "";
        }
        return KitaroTextBox(
          controller: _controller,
          labelText: 'postcode *',
          focusNode: _postcodeNode,
          errorText: state.postcodeError,
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

class _PasswordFieldState extends State<_PasswordField>
    with AutomaticKeepAliveClientMixin {
  // ------------------------------- FIELDS -------------------------------
  final _controller = TextEditingController();

  // -------------------------------- PROPERTIES -------------------------------
  @override
  bool get wantKeepAlive => true;

  // --------------------------------- METHODS ---------------------------------
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
    super.build(context);
    return Consumer<EditProfilePageState>(
      builder: (_, state, __) {
        if (state.updateTextController) {
          _controller.text = state.password ?? '';
        }
        return KitaroPasswordTextBox(
          controller: _controller,
          errorText: state.passwordError,
          labelText: 'password *',
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
  State<_PasswordRecheckField> createState() => __PasswordRecheckFieldState();
}

class __PasswordRecheckFieldState extends State<_PasswordRecheckField>
    with AutomaticKeepAliveClientMixin {
  // ------------------------------- FIELDS -------------------------------
  final _controller = TextEditingController();

  // -------------------------------- PROPERTIES -------------------------------
  @override
  bool get wantKeepAlive => true;

  // --------------------------------- METHODS ---------------------------------
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
    super.build(context);
    return Consumer<EditProfilePageState>(
      builder: (_, state, __) {
        if (state.updateTextController) {
          _controller.text = state.passwordRecheck ?? '';
        }
        return KitaroPasswordTextBox(
          controller: _controller,
          labelText: 're-type password *',
          errorText: state.passwordRecheckError,
          focusNode: _passwordRecheckNode,
          onChanged: (v) => state.password = v,
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
    return Consumer<EditProfilePageState>(
      builder: (_, state, __) {
        return LoginButton(
          caption: 'Edit',
          isBusy: state.isBusy,
          enabled: !state.isBusy,
          onPressed: () => _onSubmitted(context),
        );
      },
    );
  }

  Future<void> _onSubmitted(BuildContext context) async {
    final state = Provider.of<EditProfilePageState>(context, listen: false);
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
