import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:kitaro/kitaro.dart';
import 'package:provider/provider.dart';

import 'state.dart';

// ------------------------------ VARIABLES -----------------------------
late FocusNode _locationNameNode;
late FocusNode _address1Node;
late FocusNode _address2Node;
late FocusNode _address3Node;
late FocusNode _cityNode;
late FocusNode _stateNode;
late FocusNode _postcodeNode;
late FocusNode _addressLinkNode;

// ------------------------------- CLASSES ------------------------------
class AddLocationPage extends StatelessWidget {
  const AddLocationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ChangeNotifierProvider<AddLocationPageState>(
          create: (_) => AddLocationPageState(),
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
      final state = Provider.of<AddLocationPageState>(context, listen: false);
      await state.initialise();
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
                0.0,
                35.0,
                16.0,
              ),
              child: ListView(
                physics: const BouncingScrollPhysics(),
                children: const [
                  _Logo(),
                  SizedBox(height: 50),
                  _LocationNameField(),
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
                  SizedBox(height: 25),
                  _AddressGoogleLinkField(),
                  SizedBox(height: 25),
                  _FacilityField(),
                  SizedBox(height: 25),
                  _ItemTypeField(),
                  SizedBox(height: 25),
                  _IsWeightField(),
                  SizedBox(height: 25),
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

class _LocationNameField extends StatefulWidget {
  // ---------------------------- CONSTRUCTORS ----------------------------
  const _LocationNameField({
    Key? key,
  }) : super(key: key);

  // ------------------------------- METHODS ------------------------------
  @override
  State<_LocationNameField> createState() => _LocationNameFieldState();
}

class _LocationNameFieldState extends State<_LocationNameField>
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
    _locationNameNode = FocusNode();
  }

  @override
  void dispose() {
    _locationNameNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Consumer<AddLocationPageState>(
      builder: (_, state, __) {
        if (state.updateTextController) {
          _controller.text = state.locationName ?? "";
        }
        return KitaroTextBox(
          controller: _controller,
          labelText: 'location name *',
          errorText: state.locationNameError,
          focusNode: _locationNameNode,
          onChanged: (v) => state.locationName = v,
          onSubmitted: (v) {
            state.locationName = v;
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
    return Consumer<AddLocationPageState>(
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
    return Consumer<AddLocationPageState>(
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
    return Consumer<AddLocationPageState>(
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
    return Consumer<AddLocationPageState>(
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
    return Consumer<AddLocationPageState>(
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
    return Consumer<AddLocationPageState>(
      builder: (_, state, __) {
        if (state.updateTextController) {
          _controller.text = state.postcode ?? "";
        }
        return KitaroTextBox(
          controller: _controller,
          labelText: 'postcode *',
          focusNode: _postcodeNode,
          errorText: state.postcodeError,
          keyboardType: TextInputType.number,
          onChanged: (v) => state.postcode = v,
          onSubmitted: (v) {
            state.postcode = v;
            // _passwordNode.requestFocus();
          },
        );
      },
    );
  }
}

class _AddressGoogleLinkField extends StatefulWidget {
  // ---------------------------- CONSTRUCTORS ----------------------------
  const _AddressGoogleLinkField({
    Key? key,
  }) : super(key: key);

  // ------------------------------- METHODS ------------------------------
  @override
  State<_AddressGoogleLinkField> createState() =>
      _AddressGoogleLinkFieldState();
}

class _AddressGoogleLinkFieldState extends State<_AddressGoogleLinkField>
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
    _addressLinkNode = FocusNode();
  }

  @override
  void dispose() {
    _addressLinkNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Consumer<AddLocationPageState>(
      builder: (_, state, __) {
        if (state.updateTextController) {
          _controller.text = state.addressLink ?? "";
        }
        return KitaroTextBox(
          controller: _controller,
          labelText: 'address direction *',
          errorText: state.addressLinkError,
          focusNode: _addressLinkNode,
          onChanged: (v) => state.addressLink = v,
          onSubmitted: (v) {
            state.addressLink = v;
            // _address2Node.requestFocus();
          },
        );
      },
    );
  }
}

class _FacilityField extends StatelessWidget {
  const _FacilityField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AddLocationPageState>(builder: (_, state, __) {
      return CustomDropdown(
        labelText: 'select facility *',
        labelTextColor: const Color(0xff969FAA),
        value: state.facility,
        errorText: state.facilityError,
        items: state.facilities.values.toList(),
        onSelected: (t) => state.facility = t,
      );
    });
  }
}

class _ItemTypeField extends StatelessWidget {
  const _ItemTypeField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AddLocationPageState>(builder: (_, state, __) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'select type below *',
            style: TextStyle(
                fontSize: 14.0,
                color: state.itemTypeHasError
                    ? Colors.red.shade900
                    : const Color(0xff969FAA),
                fontWeight: state.itemTypeHasError
                    ? FontWeight.normal
                    : FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Wrap(
            spacing: 8.0, // gap between adjacent chips
            runSpacing: 4.0, // gap between lines
            children: <Widget>[...generateTags(context)],
          ),
          if (state.itemTypeHasError)
            Padding(
              padding: const EdgeInsets.only(left: 8.0, top: 8.0),
              child: Text(
                state.itemTypeError!,
                style: TextStyle(
                  color: Colors.red.shade900,
                  fontSize: 12.0,
                ),
              ),
            ),
        ],
      );
    });
  }

  generateTags(BuildContext context) {
    final state = Provider.of<AddLocationPageState>(context, listen: false);
    return state.itemTypeList.values
        .map((tag) => _SelectedItemType(item: tag))
        .toList();
  }
}

class _SelectedItemType extends StatelessWidget {
  const _SelectedItemType({required this.item, Key? key}) : super(key: key);

  final WasteModel item;

  @override
  Widget build(BuildContext context) {
    return Consumer<AddLocationPageState>(builder: (_, state, __) {
      final _list = state.selectedItemTypes.values.toList();
      return FilterChip(
        backgroundColor: Colors.black12,
        label: Text(
          item.name!,
        ),
        selected: _list.contains(item),
        selectedColor: const Color(0x8016b04a),
        onSelected: (bool selected) {
          if (selected) {
            state.addType(item: item);
          } else {
            print(selected);
            state.removeType(item: item);
          }
        },
      );
    });
  }
}

class _IsWeightField extends StatelessWidget {
  const _IsWeightField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AddLocationPageState>(
      builder: (_, state, __) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Is weight needed?',
              style: TextStyle(
                  fontSize: 14.0,
                  color: Color(0xff969FAA),
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                _Box(
                  boxText: 'Yes',
                  onTap: () => state.isWeight = true,
                  value: state.isWeight,
                ),
                const SizedBox(width: 12),
                _Box(
                  boxText: 'No',
                  onTap: () => state.isWeight = false,
                  value: !state.isWeight,
                )
              ],
            )
          ],
        );
      },
    );
  }
}

class _Box extends StatelessWidget {
  const _Box(
      {required this.value,
      required this.boxText,
      required this.onTap,
      Key? key})
      : super(key: key);

  final String boxText;
  final bool value;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Wrap(
        children: [
          Container(
            decoration: BoxDecoration(
                color: value ? const Color(0x8016b04a) : Colors.black12,
                // shape: BoxShape.circle,
                borderRadius: const BorderRadius.all(Radius.circular(8.0))),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 15),
              child: Text(
                boxText,
                style: const TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
          )
        ],
      ),
      onTap: onTap,
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
    return Consumer<AddLocationPageState>(
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
    final state = Provider.of<AddLocationPageState>(context, listen: false);
    switch (state.validateAll()) {
      case null:
        break;
      case InvalidField.locationName:
        _locationNameNode.requestFocus();
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
      case InvalidField.addressLink:
        _addressLinkNode.requestFocus();
        return;
    }

    final err1 = await state.submit();
    if (err1 != null) {
      await showWarningDialog(context, err1);
      return;
    }
    await context.router.replaceAll([const LocatorMapPageRoute()]);
  }
}
