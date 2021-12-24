import 'package:flutter/material.dart';
import 'package:kitaro/database/profile_dao.dart';
import 'package:provider/provider.dart';

import '../../../kitaro.dart';
import 'state.dart';

class HistoryItemListPage extends StatelessWidget {
  // ---------------------------- CONSTRUCTORS ----------------------------
  const HistoryItemListPage({
    Key? key,
  }) : super(key: key);

  // ------------------------------- METHODS ------------------------------
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HistoryItemListPageState>.value(
      value: HistoryItemListPageState(),
      builder: (context, child) {
        final _ = Provider.of<HistoryItemListPageState>(context).profile;
        return const Scaffold(
          body: PageBase(
            child: _Content(),
          ),
        );
      },
    );
  }
}

class _Content extends StatelessWidget {
  // ---------------------------- CONSTRUCTORS ----------------------------
  const _Content({
    Key? key,
  }) : super(key: key);

  // ------------------------------- METHODS ------------------------------
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
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 12),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const _AppBar(),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Row(
                children: [
                  const _ProfileIcon(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      _Text(text: 'Full Name'),
                      _Text(text: 'Phone Number'),
                      SizedBox(height: 5.0),
                      _Text(text: 'Email Address'),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
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
              'Username',
              style: TextStyle(
                color: Color(0xff47525E),
                fontSize: 15,
              ),
            ),
          ),
        ),
        PopupMenuButton(
          offset: const Offset(0, 45),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          onSelected: (int u) => onSelected(u, context),
          itemBuilder: (BuildContext context) {
            return [
              const PopupMenuItem(
                value: 1,
                child: Text(
                  'Edit',
                  style: TextStyle(
                    color: Color(0xff8594A8),
                    fontSize: 15,
                  ),
                ),
              ),
              const PopupMenuItem(
                value: 2,
                child: Text(
                  'Logout',
                  style: TextStyle(
                    color: Color(0xff8594A8),
                    fontSize: 15,
                  ),
                ),
              )
            ];
          },
        ),
      ],
    );
  }

  Future<void> onSelected(int index, BuildContext context) async {
    if (index == 1) {
      print('edit');
    }
    if (index == 2) {
      final err = await Authentication.signOutWithGoogle();
      if (err != null) {
        await showWarningDialog(context, err);
        return;
      }
      await context.router.replaceAll([const LoginPageRoute()]);
    }
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
      padding: const EdgeInsets.only(left: 20.0),
      child: Text(
        text!,
        style: const TextStyle(
          color: Color(0xff4D627B),
          fontSize: 14,
        ),
      ),
    );
  }
}

class _ProfileIcon extends StatelessWidget {
  // ---------------------------- CONSTRUCTORS ----------------------------
  const _ProfileIcon({
    Key? key,
  }) : super(key: key);

  // ------------------------------- METHODS ------------------------------
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: 70,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(33)),
          border: Border.all(color: Colors.white, width: 5.0),
          color: const Color(0xffE5E9F2)),
      child: Center(
        child: Image(
          image: Assets.icons.temporary,
          height: 14,
          width: 32,
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
        children: const [
          _BodyTitle(),
          _ItemList(),
        ],
      ),
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Previous Recycle Item',
              style: TextStyle(
                fontSize: 18,
                color: Color(0xff4D627B),
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8.0),
            Container(
              height: 1.0,
              width: 30,
              color: const Color(0xff4D627B),
            )
          ],
        ),
      ],
    );
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
    return Consumer<HistoryItemListPageState>(
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
                endTileTitle: 'View',
                endTileAction: () async {
                  await showDialog(
                    context: context,
                    builder: (context) {
                      return ViewItemDialog(item: state.itemsAdded[index]);
                      // return EditItemDialog(
                      //   item: state.itemsAdded[index],
                      //   index: index,
                      // );
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
