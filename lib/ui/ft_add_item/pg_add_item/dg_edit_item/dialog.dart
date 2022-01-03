import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';

import '../../../../kitaro.dart';
import '../dg_add_item/dialog.dart';
import '../state.dart';

class EditItemDialog extends StatelessWidget {
  // ---------------------------- CONSTRUCTORS ----------------------------
  const EditItemDialog({
    required this.item,
    required this.index,
    Key? key,
  }) : super(key: key);

  // ---------------------------------- FIELDS ---------------------------------
  final RecycleModel item;
  final int index;

  // ------------------------------- METHODS ------------------------------
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AddItemListPageState>.value(
      value: AddItemListPageState(),
      child: _Content(item: item, index: index,)
    );
  }
}

class _Content extends StatefulWidget {
  // ---------------------------- CONSTRUCTORS ----------------------------
  const _Content({
    required this.item,
    required this.index,
    Key? key,
  }) : super(key: key);

  // ---------------------------------- FIELDS ---------------------------------
  final RecycleModel item;
  final int index;

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
      final state = Provider.of<AddItemListPageState>(context, listen: false);
      await state.initialiseEditItem(widget.item);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AddItemListPageState>(
      create: (_) => AddItemListPageState(),
      child: AddItemDialog.edit(index: widget.index),
    );
  }
}