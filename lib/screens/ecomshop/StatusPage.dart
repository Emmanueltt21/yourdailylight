import 'package:flutter/material.dart';

import '../../utils/my_colors.dart';

class StatusPage extends StatelessWidget {
  const StatusPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.accentDark,
        title: Text('Transaction Status'),
        centerTitle: true,
      ),
    );
  }
}
