import 'package:flutter/material.dart';
import 'package:iamc_flutter/presentation/widgets/main_header.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MainAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 10,
      shadowColor: Colors.black.withOpacity(0.6),
      leading: Builder(
        builder: (context) {
          return IconButton(
            icon: const Icon(
              Icons.menu,
              color: Colors.red,
            ),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          );
        },
      ),
      actions: [
        Container(width: 56),
      ],
      title: const Stack(
        children: [
          Center(child: MainHeader()),
        ],
      ),
      centerTitle: false,
    );
  }
}
