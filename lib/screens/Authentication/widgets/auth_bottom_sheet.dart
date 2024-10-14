import 'package:flutter/material.dart';

class AuthBottomSheetContainer extends StatefulWidget {
  const AuthBottomSheetContainer({super.key, required this.child});
  final Widget child;

  @override
  State<AuthBottomSheetContainer> createState() => _AuthBottomSheetContainerState();
}

class _AuthBottomSheetContainerState extends State<AuthBottomSheetContainer> {
  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      child: Container(
        height: 600,
        padding: const EdgeInsets.all(24),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
        child: widget.child,
      ),
    );
  }
}
