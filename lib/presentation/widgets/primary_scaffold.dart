import 'package:flutter/material.dart';

import '../../config/utils/app_colors.dart';


class PrimaryScaffold extends StatelessWidget {

  final String titleAppBar;
  final floatingActionButton;
  PrimaryScaffold({
    Key? key,
    required this.child,
    this.titleAppBar = '',
    this.floatingActionButton = null
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: titleAppBar != ''
        ? AppBar(
            backgroundColor: AppColors.primaryScaffold,
            elevation: 0,
            title: Text(titleAppBar),

        )
        : null,
      floatingActionButton: floatingActionButton,
      backgroundColor: AppColors.primaryScaffold,
      body: child,
    );
  }
}
