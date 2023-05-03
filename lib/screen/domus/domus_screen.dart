import 'package:catalogo_widgets/config/menu/menu_item.dart';
import 'package:catalogo_widgets/config/theme/app_theme.dart';
import 'package:catalogo_widgets/screen/buttons/buttons_screen.dart';
import 'package:flutter/material.dart';

class DomusScreen extends StatelessWidget {
  const DomusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter + Material13'),
      ),
      body: const _DomusView(),
    );
  }
}

class _DomusView extends StatelessWidget {
  const _DomusView();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: appMenuItems.length,
      itemBuilder: (context, index) {
        final menuItem = appMenuItems[index];
        return _PropriumListTile(menuItem: menuItem);
      },
    );
  }
}

class _PropriumListTile extends StatelessWidget {
  const _PropriumListTile({
    super.key,
    required this.menuItem,
  });

  final MenuItem menuItem;

  @override
  Widget build(BuildContext context) {
    final colorum = Theme.of(context).colorScheme;
    return ListTile(
      title: Text(menuItem.titulus),
      subtitle: Text(menuItem.subTitulus),
      leading: Icon(
        menuItem.icon,
        color: colorum.primary,
      ),
      trailing: Icon(
        Icons.arrow_forward_ios_rounded,
        color: colorum.primary,
      ),
      onTap: () {
        // Navigator.of(context).push(MaterialPageRoute(
        //   builder: (context) => const ButtonsScreen(),
        // ));

        Navigator.pushNamed(context, menuItem.link);
      },
    );
  }
}
