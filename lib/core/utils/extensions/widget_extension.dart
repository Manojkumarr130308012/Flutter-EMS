import 'package:flutter/material.dart';

extension WidgetPaddingX on Widget {
  Widget paddingAll(double padding) => Padding(
        padding: EdgeInsets.all(padding),
        child: this,
      );
}

extension IterableExtension<E> on Iterable<E> {
  Iterable<E> whereIndexed(bool Function(int index, E element) test) sync* {
    var index = 0;
    for (var element in this) {
      if (test(index, element)) {
        yield element;
      }
      index++;
    }
  }
}

/// Capitalizing the first letter of the String
extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1).toLowerCase()}";
  }
}
