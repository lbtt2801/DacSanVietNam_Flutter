import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:vinaFoods/Model/noi_ban.dart';
import 'package:vinaFoods/Service/thu_vien_api.dart';
import '../Model/comment.dart';


class ShowNoiBanList extends StatefulWidget {
  final List<NoiBan> reviews;

  const ShowNoiBanList({Key? key, required this.reviews}) : super(key: key);

  @override
  _showNoiBan createState() => _showNoiBan();
}

class _showNoiBan extends State<ShowNoiBanList> {
  late List<String> nameUsers;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
