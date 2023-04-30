import 'package:flutter/material.dart';
import 'package:veinline/styles/style_utils.dart';

class MyIconButton extends StatelessWidget {
  final Color color;
  final String text;
  final String icon;
  final Function()? onTap;
  const MyIconButton(
      {super.key,
      this.color = VeinLineColors.seconadary,
      required this.text,
      required this.icon,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Ink(
        height: 60,
        width: double.infinity,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              icon,
              height: 35,
              width: 35,
            ),
            const SizedBox(
              width: 15,
            ),
            Text(
              text,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w500),
            )
          ],
        ),
      ),
    );
  }
}
