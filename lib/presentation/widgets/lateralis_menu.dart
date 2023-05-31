import 'package:catalogo_widgets/config/menu/menu_item.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LateralisMenu extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const LateralisMenu({super.key, required this.scaffoldKey});

  @override
  State<LateralisMenu> createState() => _LateralisMenuState();
}

class _LateralisMenuState extends State<LateralisMenu> {
  int navDrawerIndex = 0;
  @override
  Widget build(BuildContext context) {
    final habetNotch = MediaQuery.of(context).viewPadding.top > 35;

    return NavigationDrawer(
        selectedIndex: navDrawerIndex,
        onDestinationSelected: (value) {
          setState(() {
            navDrawerIndex = value;
          });

          final menuItem = appMenuItems[value];

          context.push(menuItem.link);

          widget.scaffoldKey.currentState?.closeDrawer();
        },
        children: [
          Padding(
              padding: EdgeInsets.fromLTRB(28, habetNotch ? 0 : 20, 16, 10)),
          ...appMenuItems.sublist(0, 3).map((item) =>
              NavigationDrawerDestination(
                  icon: Icon(item.icon), label: Text(item.titulus))),
          const Padding(
            padding: EdgeInsets.fromLTRB(28, 16, 28, 10),
            child: Divider(),
          ),
          ...appMenuItems.sublist(3).map((item) => NavigationDrawerDestination(
              icon: Icon(item.icon), label: Text(item.titulus))),
        ]);
  }
}
