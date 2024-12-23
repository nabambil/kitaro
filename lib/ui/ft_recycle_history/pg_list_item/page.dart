import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as dialog;
import 'package:flutter/scheduler.dart';
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
        return const Scaffold(
          body: PageBase(
            child: _Content(),
          ),
        );
      },
    );
  }
}

class _Content extends StatefulWidget {
  // ---------------------------- CONSTRUCTORS ----------------------------
  const _Content({
    Key? key,
  }) : super(key: key);

  // ------------------------------- METHODS ------------------------------
  @override
  State<_Content> createState() => _ContentState();
}

class _ContentState extends State<_Content> {
  // --------------------------------- METHODS ---------------------------------
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance!.addPostFrameCallback((_) async {
      final state =
          Provider.of<HistoryItemListPageState>(context, listen: false);
      final err1 = await showBusyIndicator<ErrorMessage?>(
        initialStatus: 'Loading...',
        action: () async {
          await state.getUserProfile();
          await state.initialise();
        },
      );

      if (err1 != null) {
        return await showWarningDialog(context, err1);
      }
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
    return Consumer<HistoryItemListPageState>(builder: (_, state, __) {
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
                    // const _ProfileIcon(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _Text(
                            text:
                                '${state.userProfile?.firstName} ${state.userProfile?.lastName}'),
                        _Text(text: state.userProfile?.phone),
                        const SizedBox(height: 5.0),
                        _Text(text: state.userProfile?.username),
                        const SizedBox(height: 16)
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
        const PageBackButton(
          colorOverride: Colors.white,
        ),
        const Expanded(
          child: Center(
            child: Text(
              'Profile',
              style: TextStyle(
                color: Colors.white, //(0xff47525E),
                fontSize: 20,
              ),
            ),
          ),
        ),
        PopupMenuButton(
          icon: const Icon(Icons.menu, color: Colors.white),
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
              ),
              const PopupMenuItem(
                value: 3,
                child: Text(
                  'Delete Account',
                  style: TextStyle(
                    color: Color(0xff8594A8),
                    fontSize: 15,
                  ),
                ),
              )
            ];
          },
        )
      ],
    );
  }

  Future<void> onSelected(int index, BuildContext context) async {
    final state = Provider.of<HistoryItemListPageState>(context, listen: false);
    if (index == 1) {
      await context.router.push(
        EditProfilePageRoute(
          user: state.userProfile!,
          userAddress: state.address!,
        ),
      );
    }
    if (index == 2) {
      final err = await Authentication.signOutWithGoogle();
      if (err != null) {
        await showWarningDialog(context, err);
        return;
      }
      await context.router.replaceAll([const LoginPageRoute()]);
    }
    if (index == 3) {
      showDialog(
          context: context,
          builder: (_) {
            return dialog.AlertDialog(
              title: const Text("Delete Account"),
              content: const Text(
                  "After you delete, all your information will be delete and no data will keep on our side"),
              actions: [
                TextButton(
                  onPressed: () async {
                    final auth = FirebaseAuth.instance.currentUser;
                    if (auth != null) {
                      auth.delete();
                      await context.router.replaceAll([const LoginPageRoute()]);
                    }
                  },
                  child: const Text(
                    "Confirm",
                    style: TextStyle(color: Colors.red),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    "Cancel",
                    style: TextStyle(color: Colors.black45),
                  ),
                )
              ],
            );
          });
    }
  }
}

class _Text extends StatelessWidget {
  // ---------------------------- CONSTRUCTORS ----------------------------
  const _Text({
    required this.text,
    this.color = const Color(0xff4D627B),
    Key? key,
  }) : super(key: key);

  // ---------------------------------- FIELDS ---------------------------------
  final String? text;
  final Color? color;

  // ------------------------------- METHODS ------------------------------
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0),
      child: Text(
        text ?? '',
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
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
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      child: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(vertical: 20.0),
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
    return Consumer<HistoryItemListPageState>(
      builder: (_, state, __) {
        double totalSaving = 0.0;
        for (var e in state.itemsAdded) {
          final waste =
              state.listWaste.where((element) => e.type == element.name);

          if (waste.isNotEmpty) {
            totalSaving +=
                (e.weight?.toDouble() ?? 0.0) * (waste.first.emission ?? 0.0);
          }
        }

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
                const SizedBox(height: 6),
                Text(
                  'Total CO² Saving : $totalSaving kg',
                  style: const TextStyle(
                    fontSize: 16,
                    color: Color(0xff4D627B),
                  ),
                ),
              ],
            ),
          ],
        );
      },
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
