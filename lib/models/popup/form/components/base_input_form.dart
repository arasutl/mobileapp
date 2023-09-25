import 'package:flutter/material.dart';

import 'Labels.dart';

class BaseInputForm extends StatelessWidget {
  const BaseInputForm({
    Key? key,
    this.backgroundColor = Colors.white,
    this.borderColor = const Color(0xFFEEEEEE),
    this.children,
    this.hasError = false,
    this.icon,
    required this.sLable,
    required this.sOptional,
    this.onTap,
  }) : super(key: key);

  final Color backgroundColor;
  final Color borderColor;
  final String sLable;
  final bool sOptional;
  final List<Widget>? children;
  final bool hasError;
  final IconData? icon;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Labels(sLabel: sLable),
      SizedBox(
        height: 4,
      ),
      GestureDetector(
        onTap: onTap,
        child: Container(
          constraints: const BoxConstraints(minHeight: 44),
          padding: const EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
            color: hasError ? Colors.red.shade50 : backgroundColor,
            border: Border.all(color: hasError ? Colors.red : borderColor),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Row(
            children: [
              // icon
              if (icon != null) ...[
                Icon(
                  icon,
                  color: hasError ? Colors.redAccent : Colors.grey.shade400,
                ),
                const SizedBox(width: 12)
              ],

              // ...

              // children

              if (children != null) ...children!

              // ...
            ],
          ),
        ),
      )
    ]);
  }
}
