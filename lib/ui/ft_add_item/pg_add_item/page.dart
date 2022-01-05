import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:kitaro/kitaro.dart';
import 'package:kitaro/ui/ft_recycle_location/pg_main/state.dart';
import 'package:provider/provider.dart';

import 'dg_add_item/dialog.dart';
import 'dg_edit_item/dialog.dart';
import 'state.dart';

class AddItemListPage extends StatelessWidget {
  // ---------------------------- CONSTRUCTORS ----------------------------
  const AddItemListPage({
    required this.locationId,
    Key? key,
  }) : super(key: key);

  // ---------------------------------- FIELDS ---------------------------------
  final String locationId;

  // ------------------------------- METHODS ------------------------------
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AddItemListPageState>.value(
      value: AddItemListPageState(),
      child: Scaffold(
        body: PageBase(
          child: Stack(
            children: [
              _Content(locationId: locationId),
              const Positioned(
                bottom: 20,
                right: 0,
                child: _SubmitButton(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Content extends StatefulWidget {
  // ---------------------------- CONSTRUCTORS ----------------------------
  const _Content({
    required this.locationId,
    Key? key,
  }) : super(key: key);

  // ---------------------------------- FIELDS ---------------------------------
  final String locationId;

  // --------------------------------- METHODS ---------------------------------
  @override
  State<_Content> createState() => _ContentState();
}

class _ContentState extends State<_Content> {
  // --------------------------------- METHODS ---------------------------------
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance!.addPostFrameCallback((_) async {
      final state = Provider.of<AddItemListPageState>(context, listen: false);
      state.currentLocationId = widget.locationId;
      await state.initialise();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        _Header(),
        Expanded(
          child: _Body(),
        ),
      ],
    );
  }
}

class _Header extends StatelessWidget {
  // ---------------------------- CONSTRUCTORS ----------------------------
  const _Header({
    Key? key,
  }) : super(key: key);

  // ------------------------------- METHODS ------------------------------
  @override
  Widget build(BuildContext context) {
    return Consumer<AddItemListPageState>(builder: (_, state, __) {
      return Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 12),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const _AppBar(),
              const SizedBox(height: 15),
              _Text(text: state.location?.name ?? ''),
              const _Text(text: 'Centre Phone Number'),
              _Text(text: state.itemTypeList.toString()),
              const SizedBox(height: 15),
              // _Text(text: 'Centre Address 1'),
              // _Text(text: 'Centre Address 2'),
              // _Text(text: 'Centre Address 3'),
              // SizedBox(height: 10),
            ],
          ),
        ),
      );
    });
  }
}

class _AppBar extends StatelessWidget {
  // ---------------------------- CONSTRUCTORS ----------------------------
  const _AppBar({
    Key? key,
  }) : super(key: key);

  // ------------------------------- METHODS ------------------------------
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const PageBackButton(),
        const Expanded(
          child: Center(
            child: Text(
              'Recycle Session',
              style: TextStyle(
                color: Colors.white, //Color(0xff47525E),
                fontSize: 20,
              ),
            ),
          ),
        ),
        Image(
          image: Assets.icons.plasticBottle,
          height: 25,
          color: kThemeColor,
        ),
        Image(
          image: Assets.icons.can,
          height: 25,
          color: kThemeColor,
        ),
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
      padding: const EdgeInsets.only(left: 20.0, top: 4),
      child: Text(
        text!,
        style: const TextStyle(
          color: kWhiteColor, //Color(0xff4D627B),
          fontSize: 14,
        ),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  // ---------------------------- CONSTRUCTORS ----------------------------
  const _Body({
    Key? key,
  }) : super(key: key);

  // ------------------------------- METHODS ------------------------------
  @override
  Widget build(BuildContext context) {
    return Consumer<AddItemListPageState>(
      builder: (_, state, __) {
        return Container(
          padding: const EdgeInsets.all(20.0),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            ),
          ),
          child: ListView(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            children: [
              const _BodyTitle(),
              // SizedBox(height: 15),
              Visibility(
                visible: state.itemsAdded.isNotEmpty,
                child: const _ItemList(),
                replacement: const _NoItemText(),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _BodyTitle extends StatelessWidget {
  // ---------------------------- CONSTRUCTORS ----------------------------
  const _BodyTitle({
    Key? key,
  }) : super(key: key);

  // ------------------------------- METHODS ------------------------------
  @override
  Widget build(BuildContext context) {
    return Consumer<AddItemListPageState>(builder: (_, state, __) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Recycle Item',
                style: TextStyle(
                  fontSize: 22,
                  color: Color(0xff4D627B),
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 8.0),
            ],
          ),
          AddButton(
            onPressed: () async {
              final result = await showDialog(
                context: context,
                builder: (context) {
                  return const AddItemDialog.add();
                },
              );
              state.itemsAdded = result;
            },
          )
        ],
      );
    });
  }
}

class _ItemList extends StatelessWidget {
  // ---------------------------- CONSTRUCTORS ----------------------------
  const _ItemList({
    Key? key,
  }) : super(key: key);

  // ------------------------------- METHODS ------------------------------
  @override
  Widget build(BuildContext context) {
    return Consumer<AddItemListPageState>(
      builder: (_, state, __) {
        return ListView.builder(
          shrinkWrap: true,
          itemCount: state.itemsAdded.length,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 12),
              child: ItemTile(
                item: state.itemsAdded[index],
                index: index,
                endTileTitle: 'EDIT',
                endTileAction: () async {
                  await showDialog(
                    context: context,
                    builder: (context) {
                      return EditItemDialog(
                        item: state.itemsAdded[index],
                        index: index,
                      );
                    },
                  );
                },
              ),
            );
          },
        );
      },
    );
  }
}

class _NoItemText extends StatelessWidget {
  // ---------------------------- CONSTRUCTORS ----------------------------
  const _NoItemText({
    Key? key,
  }) : super(key: key);

  // ------------------------------- METHODS ------------------------------
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Padding(
        padding: EdgeInsets.all(28.0),
        child: Text(
          'No Recycle Items',
          style: TextStyle(
              color: Color(0x4d4D627B),
              fontSize: 18,
              fontWeight: FontWeight.bold),
        ),
      ),
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: SubmitButton(
        caption: 'Recycle',
        onPressed: () async {
          final state =
              Provider.of<AddItemListPageState>(context, listen: false);
          final err = await showBusyIndicator<ErrorMessage?>(
              initialStatus: 'Loading...', action: state.recycle);

          if(err != null){
            await showWarningDialog(context,err);
            return;
          }
          await showSuccessfulDialog(
            barrierDismissible: false,
            context: context,
            title: 'ITEM RECYCLED',
            message: 'You have saved the earth, You\'re our Hero !',
          );
          await context.router.replace(const HistoryItemListPageRoute());
        },
      ),
    );
  }
}
