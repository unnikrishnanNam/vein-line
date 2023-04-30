import 'package:flutter/material.dart';
import 'package:veinline/styles/style_utils.dart';

class MyButton extends StatefulWidget {
  final Function onPress;
  final String text;
  final Color color;
  const MyButton(
      {super.key,
      required this.onPress,
      required this.text,
      this.color = VeinLineColors.primary});

  @override
  State<MyButton> createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: InkWell(
        onTap: () => setState(() {
          widget.onPress();
        }),
        child: Ink(
          height: 56,
          width: double.infinity,
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: widget.color,
            borderRadius: BorderRadius.circular(28),
          ),
          child: Center(
            child: Text(
              widget.text,
              style: const TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
        ),
      ),
    );
  }
}
