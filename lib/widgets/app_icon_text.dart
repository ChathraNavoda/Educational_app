import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class AppIconText extends StatelessWidget {
  final Icon icon;
  final Widget text;

  const AppIconText({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        icon,
        SizedBox(
          width: 4,
        ),
        text
      ],
    );
  }
}
