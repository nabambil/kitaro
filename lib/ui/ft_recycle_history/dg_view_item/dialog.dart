import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../kitaro.dart';
import 'state.dart';

class ViewItemDialog extends StatelessWidget {
  const ViewItemDialog({
    required this.item,
    Key? key,
  }) : super(key: key);

  final RecycleModel item;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ViewItemDialogState>.value(
      value: ViewItemDialogState(item: item),
      child: const DialogBase(
        child: _Content(),
      ),
    );
  }
}

class _Content extends StatelessWidget {
  const _Content({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ViewItemDialogState>(builder: (_, state, __) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _Title(),
          const SizedBox(height: 18.0),
          const _ItemType(),
          const SizedBox(height: 18.0),
          Visibility(
              visible: state.item.weight != null, child: const _ItemWeight()),
          const SizedBox(height: 18.0),
          const _ItemPhotos(),
          const SizedBox(height: 25.0),
          Align(
            alignment: Alignment.bottomRight,
            child: SubmitButton(
              caption: 'Close',
              onPressed: () => context.router.pop(),
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
          'Recycle Item Info',
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
    return Consumer<ViewItemDialogState>(builder: (_, state, __) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _FieldTitle(title: 'Type *'),
          const SizedBox(height: 8.0),
          _Field(text: state.item.type!),
        ],
      );
    });
  }
}

class _ItemWeight extends StatelessWidget {
  const _ItemWeight({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ViewItemDialogState>(builder: (_, state, __) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _FieldTitle(title: 'Weight (KG) *'),
          const SizedBox(height: 8.0),
          _Field(text: state.item.weight!.toString()),
        ],
      );
    });
  }
}

class _ItemPhotos extends StatelessWidget {
  const _ItemPhotos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ViewItemDialogState>(builder: (_, state, __) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _FieldTitle(title: 'Photo (Max 3)'),
          const SizedBox(height: 8.0),
          SizedBox(
            height: MediaQuery.of(context).size.width * 0.17,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: state.item.images?.length ?? 0,
              itemBuilder: (ctx, index) {
                // if (state.item.itemImages != null &&
                //     state.item.itemImages!.length > index) {
                //   return _Placeholder(index: index);
                // }
                return Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: _ImageBox(
                    imagePath: state.item.images![index],
                  ),
                );
              },
            ),
          )
        ],
      );
    });
  }
}

class _Field extends StatelessWidget {
  const _Field({
    required this.text,
    Key? key,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        border: Border.all(color: const Color(0xff8492A6)),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Color(0xff4D627B),
          fontSize: 14,
        ),
      ),
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

class _ImageBox extends StatelessWidget {
  const _ImageBox({required this.imagePath, Key? key}) : super(key: key);

  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.width * 0.17,
      width: MediaQuery.of(context).size.width * 0.17,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(
          color: const Color(0xff8492A6),
        ),
      ),
      child: Center(
        child: Image.file(
          File(imagePath),
          errorBuilder: (_,__,___) {
            return Image(image: Assets.logos.logo);
          },
        ),
      ),
    );
  }
}
