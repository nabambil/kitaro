import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../kitaro.dart';
import '../state.dart';

// ------------------------------ VARIABLES -----------------------------
late FocusNode _itemWeightNode;

class AddItemDialog extends StatelessWidget {
  const AddItemDialog.edit({
    required this.index,
    Key? key,
  })  : isEdit = true,
        super(key: key);

  const AddItemDialog.add({
    this.index,
    Key? key,
  })  : isEdit = false,
        super(key: key);

  final bool isEdit;
  final int? index;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AddItemListPageState>.value(
      value: AddItemListPageState(),
      child: DialogBase(
        child: _Content(
          isEdit: isEdit,
          index: index,
        ),
      ),
    );
  }
}

class _Content extends StatelessWidget {
  const _Content({
    required this.isEdit,
    this.index,
    Key? key,
  }) : super(key: key);

  final bool isEdit;
  final int? index;

  @override
  Widget build(BuildContext context) {
    return Consumer<AddItemListPageState>(builder: (_, state, __) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _Title(),
          const SizedBox(height: 18.0),
          const _ItemType(),
          const SizedBox(height: 18.0),
          Visibility(
            visible: state.location?.isWeight != 0,
            child: const _ItemWeight(),
          ),
          const SizedBox(height: 18.0),
          _ItemPhotos(isEdit: isEdit,),
          const SizedBox(height: 25.0),
          Align(
            alignment: Alignment.bottomRight,
            child: _SubmitButton(
              isEdit: isEdit,
              index: index,
            ),
          )
        ],
      );
    });
  }
}

class _Title extends StatelessWidget {
  const _Title({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          'Recycle Item',
          style: TextStyle(
              color: Color(0xff4D627B),
              fontSize: 20,
              fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8.0),
        // Container(
        //   height: 1.0,
        //   width: 30,
        //   color: const Color(0xff4D627B),
        // ),
      ],
    );
  }
}

class _ItemType extends StatelessWidget {
  const _ItemType({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        _FieldTitle(title: 'Type'),
        SizedBox(height: 8.0),
        _ItemTypeDropdown()
      ],
    );
  }
}

class _ItemTypeDropdown extends StatelessWidget {
  const _ItemTypeDropdown({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AddItemListPageState>(builder: (_, state, __) {
      return CustomDropdown(
        labelText: 'Select Type',
        value: state.itemType,
        errorText: state.itemTypeError,
        items: state.itemTypeList,
        onSelected: (t) => state.itemType = t,
      );
    });
  }
}

class _ItemWeight extends StatelessWidget {
  const _ItemWeight({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        _FieldTitle(title: 'Weight (KG)'),
        SizedBox(height: 8.0),
        _ItemWeightTextField()
      ],
    );
  }
}

class _ItemWeightTextField extends StatefulWidget {
  const _ItemWeightTextField({Key? key}) : super(key: key);

  @override
  __ItemWeightTextFieldState createState() => __ItemWeightTextFieldState();
}

class __ItemWeightTextFieldState extends State<_ItemWeightTextField>
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
    _itemWeightNode = FocusNode();
  }

  @override
  void dispose() {
    _itemWeightNode.dispose();
    // _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Consumer<AddItemListPageState>(
      builder: (_, state, __) {
        if (state.updateTextController) {
          _controller.text = state.itemWeight!;
        }
        return KitaroTextBox(
          controller: _controller,
          hintText: '0.70',
          onChanged: (v) => state.itemWeight = v,
          errorText: state.itemWeightError,
          focusNode: _itemWeightNode,
          keyboardType: const TextInputType.numberWithOptions(
            decimal: false,
            signed: false,
          ),
        );
      },
    );
  }
}

class _ItemPhotos extends StatelessWidget {
  const _ItemPhotos({required this.isEdit, Key? key}) : super(key: key);

  final bool isEdit;

  @override
  Widget build(BuildContext context) {
    return Consumer<AddItemListPageState>(
      builder: (_, state, __) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const _FieldTitle(title: 'Photo (Max 3)'),
            const SizedBox(height: 8.0),
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.17,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: isEdit ? state.imagePath.length : state.itemImages.isEmpty
                    ? 1
                    : state.itemImages.length == 3
                        ? 3
                        : state.itemImages.length + 1,
                itemBuilder: (ctx, index) {
                  if (!isEdit && state.itemImages.isNotEmpty &&
                      state.itemImages.length > index) {
                    return _Placeholder(index: index);
                  }
                  return Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: _ImageBox(
                      imagePath: isEdit ? state.imagePath[index] : null,
                      isEdit: isEdit,
                      index: index,
                    ),
                  );
                },
              ),
            ),
            if (state.itemImageHasError)
              Padding(
                padding: const EdgeInsets.only(top: 8.0, left: 8.0),
                child: Text(
                  state.itemImageError!,
                  style: TextStyle(
                    color: Colors.red.shade900,
                    fontSize: 12,
                  ),
                ),
              )
          ],
        );
      },
    );
  }
}

class _FieldTitle extends StatelessWidget {
  const _FieldTitle({required this.title, Key? key}) : super(key: key);

  final String? title;
  @override
  Widget build(BuildContext context) {
    return Text(
      title!,
      style: const TextStyle(
        color: Color(0xff4D627B),
        fontSize: 14,
      ),
    );
  }
}

class _Placeholder extends StatelessWidget {
  // ------------------------------- CONSTRUCTORS ------------------------------
  const _Placeholder({
    Key? key,
    required this.index,
  }) : super(key: key);

  // ---------------------------------- FIELDS ---------------------------------
  final int? index;

  // --------------------------------- METHODS ---------------------------------
  @override
  Widget build(BuildContext context) {
    return Consumer<AddItemListPageState>(
      builder: (_, state, __) {
        if (index == null) {
          return Container();
        }
        return Padding(
          padding: const EdgeInsets.all(2.0),
          child: GestureDetector(
            onTap: () {
              _openDialog(context, index!);
            },
            child: FutureBuilder<Uint8List>(
              future: state.itemImages[index!].readAsBytes(),
              builder: (context, snapshot) {
                return Container(
                  height: MediaQuery.of(context).size.width * 0.17,
                  width: MediaQuery.of(context).size.width * 0.17,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    border: Border.all(
                      color: const Color(0xff8492A6),
                    ),
                  ),
                  child: FadeInImage(
                    placeholder: Assets.logos.logo,
                    fit: BoxFit.fill,
                    image: MemoryImage(snapshot.data!),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }

  void _openDialog(BuildContext context, int index) {
    final state = Provider.of<AddItemListPageState>(context, listen: false);
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Wrap(
          children: <Widget>[
            ListTile(
              leading: const Icon(Icons.delete_forever),
              title: const Text('Remove'),
              onTap: () {
                Navigator.of(context).pop();
                state.removeItemImage(index);
              },
            ),
          ],
        );
      },
    );
  }
}

class _SubmitButton extends StatelessWidget {
  // ------------------------------- CONSTRUCTORS ------------------------------
  const _SubmitButton({
    required this.isEdit,
    required this.index,
    Key? key,
  }) : super(key: key);

  final bool isEdit;
  final int? index;

  // --------------------------------- METHODS ---------------------------------
  @override
  Widget build(BuildContext context) {
    return Consumer<AddItemListPageState>(
      builder: (_, state, __) {
        return SubmitButton(
          caption: isEdit ? 'Edit' : 'Add',
          onPressed: () => _onSubmitted(context),
        );
      },
    );
  }

  Future<void> _onSubmitted(BuildContext context) async {
    final state = Provider.of<AddItemListPageState>(context, listen: false);
    switch (state.validateAll()) {
      case null:
        break;
      case InvalidField.itemType:
        return;
      case InvalidField.itemWeight:
        _itemWeightNode.requestFocus();
        return;
      case InvalidField.itemImage:
        return;
    }

    if (!isEdit) {
      await state.addItem();
    } else {
      await state.updateItem(index!);
    }
    Navigator.of(context).pop(state.itemsAdded);
  }
}

class _ImageBox extends StatefulWidget {
  // ------------------------------- CONSTRUCTORS ------------------------------
  const _ImageBox({
    required this.isEdit,
    required this.imagePath,
    required this.index,
    Key? key,
  }) : super(key: key);

  final bool isEdit;
  final String? imagePath;
  final int index;

  // --------------------------------- METHODS ---------------------------------
  @override
  __ImageBoxState createState() => __ImageBoxState();
}

class __ImageBoxState extends State<_ImageBox> {
  // --------------------------------- METHODS ---------------------------------
  @override
  Widget build(BuildContext context) {
    return Consumer<AddItemListPageState>(
      builder: (_, state, __) {
        return GestureDetector(
          onTap: () async {
            final file = await choosePicture(
              context: context,
            );

            if (file != null) {
              if(widget.isEdit){
                state.imagePath[widget.index] = file.path;
              }
              state.itemImage = file;
            }
          },
          child: Container(
            height: MediaQuery.of(context).size.width * 0.17,
            width: MediaQuery.of(context).size.width * 0.17,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              border: Border.all(
                color: state.itemImageHasError
                    ? Colors.red.shade900
                    : const Color(0xff8492A6),
              ),
            ),
            child: Center(
              child: !widget.isEdit
                  ? Icon(
                      Icons.add,
                      color: state.itemImageHasError
                          ? Colors.red.shade900
                          : const Color(0xff8492A6),
                      size: 22,
                    )
                  : Center(
                      child: Image.file(
                        File(widget.imagePath!),
                      ),
                    ),
            ),
          ),
        );
      },
    );
  }
}
