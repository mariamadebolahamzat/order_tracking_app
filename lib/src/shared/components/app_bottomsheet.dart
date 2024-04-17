import 'package:flutter/material.dart';

Future<void> appBottomSheet(BuildContext context, Widget widget,
    {Color color = Colors.white, bool dismissible = true, EdgeInsets? edgeInsets}) {
  return showModalBottomSheet<void>(
    isDismissible: dismissible,
    backgroundColor: Colors.transparent,
    isScrollControlled: true,
    barrierColor: Colors.black.withOpacity(0.5),
    context: context,
    builder: (BuildContext context) {
      return StatefulBuilder(builder: (BuildContext context, StateSetter setModalState) {
        return SingleChildScrollView(
          child: Wrap(
            children: [
              Container(
                margin: edgeInsets ?? EdgeInsets.zero,
                padding: EdgeInsets.zero,
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(30), topRight: Radius.circular(30)),
                ),
                child: Center(
                  child: widget,
                ),
              ),
            ],
          ),
        );
      });
    },
  );
}
