import 'package:flutter/material.dart';

class ModalDropDown extends StatefulWidget {
  const ModalDropDown({super.key});

  @override
  State<StatefulWidget> createState() => _ModalDropDownState();
}

class _ModalDropDownState extends State<ModalDropDown> {
  String _selected = '';
  List<String> _items = ['a', 'b', 'c', 'd'];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ElevatedButton(
            child: const Text('show modal'),
            onPressed: () => showmodal(context),
          ),
          Text('selected item: $_selected')
        ],
      ),
    );
  }

  void showmodal(context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            padding: EdgeInsets.all(8),
            height: 200,
            alignment: Alignment.center,
            child: ListView.separated(
                itemCount: _items.length,
                separatorBuilder: (context, int) {
                  return Divider();
                },
                itemBuilder: (context, index) {
                  return GestureDetector(
                      child: Text(_items[index]),
                      onTap: () {
                        setState(() {
                          _selected = _items[index];
                        });
                        Navigator.of(context).pop();
                      });
                }),
          );
        });
  }
}
