import 'package:flutter/material.dart';

import '../../kitaro.dart';

class ItemTile extends StatelessWidget {
  // ---------------------------- CONSTRUCTORS ----------------------------
  const ItemTile({
    required this.item,
    required this.index,
    required this.endTileTitle,
    required this.endTileAction,
    Key? key,
  }) : super(key: key);

  // ---------------------------------- FIELDS ---------------------------------
  final ItemDetails item;
  final int index;
  final String endTileTitle;
  final VoidCallback? endTileAction;

  // ------------------------------- METHODS ------------------------------
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: endTileAction,
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
          color: Color(0x214D627B),
        ),
        child: Padding(
          padding: const EdgeInsets.all(13.0),
          child: Row(
            children: [
              const _Icon(),
              const SizedBox(width: 12.0),
              Expanded(
                child: _ItemDetail(
                  materialType: item.itemType,
                  weight: item.itemWeight,
                  dateSubmitted: item.dateSubmitted,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  endTileTitle,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Color(0xff47525E),
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Icon extends StatelessWidget {
  // ---------------------------- CONSTRUCTORS ----------------------------
  const _Icon({
    Key? key,
  }) : super(key: key);

  // ------------------------------- METHODS ------------------------------
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5.0),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
        color: Color(0xff77D353),
      ),
      child: Image(
        image: Assets.icons.leave,
        height: 35,
      ),
    );
  }
}

class _ItemDetail extends StatelessWidget {
  // ---------------------------- CONSTRUCTORS ----------------------------
  const _ItemDetail({
    required this.materialType,
    required this.weight,
    this.dateSubmitted,
    Key? key,
  }) : super(key: key);

  // ---------------------------------- FIELDS ---------------------------------
  final String materialType;
  final String weight;
  final String? dateSubmitted;

  // ------------------------------- METHODS ------------------------------
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          materialType.toUpperCase(),
          style: const TextStyle(
            fontSize: 14,
            color: Color(0xff47525E),
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8.0),
        Text(
          weight,
          style: const TextStyle(
            fontSize: 12,
            color: Color(0xff47525E),
          ),
        ),
        if (dateSubmitted != null)
          Text(
            dateSubmitted!,
            style: const TextStyle(
              fontSize: 12,
              color: Color(0xff47525E),
            ),
          ),
      ],
    );
  }
}
