import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ################################# VARIABLES #################################
final _busyStatusStream = StreamController<String?>.broadcast();

// ################################# FUNCTIONS #################################
Future<T> showBusyIndicator<T>({
  required String initialStatus,
  required Future<T> Function() action,
}) async {
  _busyStatusStream.add(initialStatus);
  final result = await action();
  _busyStatusStream.add(null);
  return result;
}

void updateBusyStatus({
  required String status,
}) async {
  _busyStatusStream.add(status);
}

// ################################ ENUMERATIONS ###############################
enum BusyIndicatorPosition {
  topRight,
  center,
  bottom,
}

// ################################## CLASSES ##################################
class BusyIndicator extends StatefulWidget {
  // ------------------------------- CONSTRUCTORS ------------------------------
  const BusyIndicator({
    required this.position,
    Key? key,
  }) : super(key: key);

  // ---------------------------------- FIELDS ---------------------------------
  final BusyIndicatorPosition position;

  // --------------------------------- METHODS ---------------------------------
  @override
  BusyIndicatorState createState() => BusyIndicatorState();
}

class BusyIndicatorState extends State<BusyIndicator> {
  // ---------------------------------- FIELDS ---------------------------------
  late StreamSubscription<String?> _subscription;
  bool _isShown = false;
  String _status = '';

  // -------------------------------- PROPERTIES -------------------------------
  double? get _leftPosition {
    switch (widget.position) {
      case BusyIndicatorPosition.bottom:
        return 8.0;
      default:
        return null; // ignore: avoid_returning_null
    }
  }

  double? get _topPosition {
    switch (widget.position) {
      case BusyIndicatorPosition.topRight:
        return _isShown ? 8.0 : -56.0;
      default:
        return null; // ignore: avoid_returning_null
    }
  }

  double? get _rightPosition {
    switch (widget.position) {
      case BusyIndicatorPosition.topRight:
        return 8.0;
      case BusyIndicatorPosition.bottom:
        return 8.0;
      default:
        return null; // ignore: avoid_returning_null
    }
  }

  double? get _bottomPosition {
    switch (widget.position) {
      case BusyIndicatorPosition.bottom:
        return _isShown ? 8.0 : -56.0;
      default:
        return null; // ignore: avoid_returning_null
    }
  }

  double? get _width {
    switch (widget.position) {
      case BusyIndicatorPosition.topRight:
        return 256.0;
      default:
        return null; // ignore: avoid_returning_null
    }
  }

  Alignment get _alignment {
    switch (widget.position) {
      case BusyIndicatorPosition.center:
        return _isShown ? Alignment.center : const Alignment(0.0, -1.5);
      default:
        return Alignment.center;
    }
  }

  // --------------------------------- METHODS ---------------------------------
  @override
  void initState() {
    super.initState();
    _subscription = _busyStatusStream.stream.listen((e) {
      setState(() {
        _isShown = e?.isNotEmpty == true;
        _status = e ?? _status;
      });
    });
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final content = CupertinoPopupSurface(
      child: SizedBox(
        height: 48.0,
        width: _width,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 16.0,
                width: 16.0,
                child: _isShown
                    ? const CircularProgressIndicator(strokeWidth: 2.0)
                    : Container(),
              ),
              const SizedBox(width: 12.0),
              DefaultTextStyle(
                style: const TextStyle(
                  color: Colors.black,
                  fontFamily: 'Lato',
                  fontSize: 14.0,
                ),
                child: Text(_status),
              ),
            ],
          ),
        ),
      ),
    );
    return widget.position == BusyIndicatorPosition.center
        ? AnimatedAlign(
            curve: Curves.easeOut,
            duration: const Duration(milliseconds: 250),
            alignment: _alignment,
            child: content,
          )
        : AnimatedPositioned(
            curve: Curves.easeOut,
            duration: const Duration(milliseconds: 250),
            left: _leftPosition,
            top: _topPosition,
            right: _rightPosition,
            bottom: _bottomPosition,
            child: content,
          );
  }
}
