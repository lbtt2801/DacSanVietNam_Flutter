import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:vinaFoods/main.dart';

import '../Model/Provider.dart';
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
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ThuVienProvider>(context);
    isCheck = provider.listFavorite.any((ds) => ds.idDacSan == widget.idDacSan);
    return IconButton(
      iconSize: 37,
      color: Colors.red,
      icon: Icon(isCheck ? Icons.favorite : Icons.favorite_outline),
      onPressed: () async {
        if (nguoiDung.uid != idGuest) {
          setState(() {
            isCheck = !isCheck;
          });
          if (isCheck) {
            await addFavorite(widget.idDacSan, widget.idUser);
          } else {
            await removeFavorite(widget.idUser, widget.idDacSan);
          }
          await getFavorite(widget.idUser);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(!isCheck ? AppLocalizations.of(context)!.them_yeuthich_thanhcong : AppLocalizations.of(context)!.xoa_yeuthich),
            ),
          );
        } else {
          showDialog<String>(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              title: Text(
                AppLocalizations.of(context)!.thong_bao,
                style: const TextStyle(fontSize: 20),
              ),
              content:  Text(
                AppLocalizations.of(context)!.noidung_thongbao,
                style: const TextStyle(fontSize: 16, color: Colors.orange),
              ),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.pop(context, 'OK'),
                  child: const Text('OK'),
                ),
              ],
            ),
          );
        }
        provider.updateListFavorite(dsYeuThich);
      },
    );
  }
}
