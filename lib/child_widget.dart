import 'package:flutter/material.dart';

class ChildWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red, height: 300, width: 300, child: Text('Ömer'),
      // Widget'ınızın içeriği
    );
  }
}
