import 'package:flutter/material.dart';

class ButtonSave extends StatefulWidget {
  const ButtonSave({super.key});

  @override
  _ButtonSaveState createState() => _ButtonSaveState();
}

class _ButtonSaveState extends State<ButtonSave> {
  bool isCheck = false; // get api de xac nhan gom idDacSan va idUser

  @override
  Widget build(BuildContext context) {
    return IconButton(
      iconSize: 37,
      color: Colors.red,
      icon: Icon(isCheck ? Icons.favorite : Icons.favorite_outline),
      onPressed: () {
        setState(() {
          isCheck = !isCheck;
        });
      },
    );
  }
}