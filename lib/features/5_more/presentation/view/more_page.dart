import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:oriens_eam/core/utils/extensions/build_context/local.dart';

class MorePage extends StatefulWidget {
  final void Function()? ontap;
  const MorePage({super.key, this.ontap});

  @override
  State<MorePage> createState() => _MorePageState();
}

class _MorePageState extends State<MorePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.local.more,
          style: const TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: ListView(
        children: [
          // buildListTile(
          //     title: 'Locations',
          //     icon: Icons.location_on_outlined,
          //     tileColor: Colors.grey.shade400,
          //     iconColor: Colors.blue,
          //     onTap: () {
          //       GoRouter.of(context).push("/more/location");
          //     }),
          buildListTile(
            title: 'Assets',
            icon: Icons.square_rounded,
            tileColor: Colors.amber.shade100,
            iconColor: Colors.red.shade300,
            onTap: () {
              GoRouter.of(context).push("/more/asset");
            },
          ),
          buildListTile(
            title: 'Parts Inventory',
            icon: Icons.hexagon_outlined,
            tileColor: Colors.blue.shade100,
            iconColor: Colors.purple.shade300,
            onTap: () {
              GoRouter.of(context).push("/more/parts");
            },
          ),
        ],
      ),
    );
  }

  Widget buildListTile({
    required String title,
    required IconData icon,
    required Color tileColor,
    required Color iconColor,
    void Function()? onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16),
      child: ListTile(
        onTap: onTap,
        tileColor: tileColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        title: Text(title),
        trailing: Icon(
          icon,
          color: iconColor,
        ),
      ),
    );
  }
}
