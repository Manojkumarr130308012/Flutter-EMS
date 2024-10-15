import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
// / import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FilterChipWithOutDropdown<T> extends HookWidget {
  const FilterChipWithOutDropdown({
    Key? key,
    // this.value,
    required this.label,
    // this.value,
    // required this.items,
    // required this.onChanged,
  }) : super(key: key);

  final Widget label;
  // final T? value;
  // final List<DropdownMenuItem<T>> items;
  // final void Function(T? value) onChanged;

  @override
  Widget build(BuildContext context) {
    final dropdownButtonKey = useMemoized(() => GlobalKey());
    // final focusNode = useFocusNode();
    return FilterChip(
      label: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          label,
          // const SizedBox(width: 8),
          // // const FaIcon(FontAwesomeIcons.caretDown),
          // const Icon(Icons.arrow_drop_down),
          // Offstage(
          //   child: DropdownButton<T>(
          //     key: dropdownButtonKey,
          //     focusNode: focusNode,
          //     value: value,
          //     items: items,
          //     onChanged: (value) {
          //       onChanged(value);
          //       WidgetsBinding.instance.addPostFrameCallback((_) {
          //         focusNode.unfocus();
          //       });
          //     },
          //   ),
          // ),
        ],
      ),
      onSelected: (_) {
        dropdownButtonKey.currentContext?.visitChildElements((element) {
          if (element.widget is Semantics) {
            element.visitChildElements((element) {
              if (element.widget is Actions) {
                element.visitChildElements((element) {
                  Actions.invoke(element, const ActivateIntent());
                });
              }
            });
          }
        });
      },
    );
  }
}

/* ----------------------------------------------------------------- */
/* )))))))))))))>> FilterChipWithDropDown <<((((((((((((( */
/* ----------------------------------------------------------------- */

class FilterChipWithDropDown<T> extends HookWidget {
  const FilterChipWithDropDown({
    Key? key,
    required this.label,
    this.value,
    required this.items,
    required this.onChanged,
  }) : super(key: key);

  final Widget label;
  final T? value;
  final List<DropdownMenuItem<T>> items;
  final void Function(T? value) onChanged;

  @override
  Widget build(BuildContext context) {
    final dropdownButtonKey = useMemoized(() => GlobalKey());
    final focusNode = useFocusNode();
    return FilterChip(
      label: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          label,
          const SizedBox(width: 8),
          // const FaIcon(FontAwesomeIcons.caretDown),
          const Icon(Icons.arrow_drop_down),
          Offstage(
            child: DropdownButton<T>(
              key: dropdownButtonKey,
              focusNode: focusNode,
              value: value,
              items: items,
              onChanged: (value) {
                onChanged(value);
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  focusNode.unfocus();
                });
              },
            ),
          ),
        ],
      ),
      onSelected: (_) {
        dropdownButtonKey.currentContext?.visitChildElements((element) {
          if (element.widget is Semantics) {
            element.visitChildElements((element) {
              if (element.widget is Actions) {
                element.visitChildElements((element) {
                  Actions.invoke(element, const ActivateIntent());
                });
              }
            });
          }
        });
      },
    );
  }
}
