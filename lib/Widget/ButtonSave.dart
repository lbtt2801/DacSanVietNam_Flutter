import 'package:flutter/material.dart';
import 'package:vinaFoods/main.dart';

import '../Model/dac_san.dart';
import '../Service/thu_vien_api.dart';

class ButtonSave extends StatefulWidget {
  final String idDacSan;
  final String idUser;

  const ButtonSave({super.key, required this.idDacSan, required this.idUser});

  @override
  _ButtonSaveState createState() => _ButtonSaveState();
}

class _ButtonSaveState extends State<ButtonSave> {
  late bool isCheck;

  @override
  void initState() {
    super.initState();
    isCheck = dsYeuThich.any(
      (ds) => ds.idDacSan == widget.idDacSan,
    );
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      iconSize: 37,
      color: Colors.red,
      icon: Icon(isCheck ? Icons.favorite : Icons.favorite_outline),
      onPressed: () async {
        setState(() {
          isCheck = !isCheck;
          print(dsYeuThich.length);
        });
        if (isCheck) {
          await addFavorite(widget.idDacSan, widget.idUser);
        } else {
          await removeFavorite(widget.idUser, widget.idDacSan);
        }
        await getFavorite(widget.idUser);
      },
    );
  }
}
