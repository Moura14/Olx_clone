import 'package:flutter/material.dart';
import 'package:olx_mobx/components/drawer/custom_drawer_header.dart';
import 'package:olx_mobx/components/page_section.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.horizontal(
        right: Radius.circular(30),
      ),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.65,
        child: Drawer(
          child: ListView(
            children: [CustomDrawerHeader(), PageSection()],
          ),
        ),
      ),
    );
  }
}
