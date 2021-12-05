import 'package:flutter/material.dart';

class PageTile extends StatelessWidget {
  PageTile(this.label, this.icon, this.onTap, this.highlighted);

  final String label;
  final IconData icon;
  final VoidCallback onTap;
  final bool highlighted;
  //const PageTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        label,
        style: TextStyle(
            color: highlighted ? Colors.purple : Colors.black,
            fontWeight: FontWeight.w700),
      ),
      leading: Icon(
        icon,
        color: highlighted ? Colors.purple : Colors.black,
      ),
      onTap: onTap,
    );
  }
}
