// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';

import '../Model/dac_san.dart';
import '../Model/loai_dac_san.dart';
import '../Service/thu_vien_api.dart';
import '../Service/thu_vien_widget.dart';
import '../main.dart';
import '../Widget/ShowStar.dart';


class TrangDacSanTheoTinh extends StatefulWidget {
  final String maTinh;

  const TrangDacSanTheoTinh({super.key, required this.maTinh});

  @override
  _TrangDacSanTheoTinhState createState() => _TrangDacSanTheoTinhState();
}

class _TrangDacSanTheoTinhState extends State<TrangDacSanTheoTinh> {
  List<DacSan> lstDacSan = [];
  List<DacSan> filteredDacSan = [];
  String selectedChip = dsLoaiDacSan[0].tenLoaiDS;

  void selectChip(LoaiDacSan chip) {
    setState(() {
      selectedChip = chip.tenLoaiDS;
    });
  }

  @override
  void initState() {
    super.initState();
    lstDacSan =
        dsDacSan.where((dacSan) => dacSan.idTinh == widget.maTinh).toList();
    filteredDacSan = lstDacSan;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          headerLoaiDacSan(),
          Expanded(
            child: ListView.builder(
              itemCount: filteredDacSan.length,
              itemBuilder: (context, index) {
                final dacSan = filteredDacSan[index];

                return InkWell(
                  onTap: () => context.go("/dacsan/chitiet/${dacSan.idDacSan}"),
                  child: SizedBox(
                    child: Card(
                      color: Theme.of(context).brightness == Brightness.light
                          ? Colors.blue[50]
                          : Colors.lightBlue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: ListTile(
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 10,
                        ),
                        title: Text(
                          dacSan.tenDS!,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                dacSan.sao!.toString(),
                              style: TextStyle(fontSize: 18),
                            ),
                            SizedBox(width: 6),
                            starNumber(dacSan.sao!),
                          ],
                        ),
                        leading: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: SizedBox(
                              width: 100,
                              child: cachedImage(dacSan.avatar!),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Padding headerLoaiDacSan() {
    return Padding(
      padding: const EdgeInsets.only(
        top: 10,
        bottom: 10,
        left: 10,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          // const Text(
          //   "Loại đặc sản: ",
          //   style:
          //       TextStyle(fontWeight: FontWeight.bold, color: Colors.lightBlue),
          //   maxLines: 1,
          // ),
          const SizedBox(width: 10.0),
          Flexible(
            flex: 5,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: dsLoaiDacSan.map((loaiDacSan) {
                  bool isSelected = loaiDacSan.tenLoaiDS == selectedChip;
                  return AnimatedContainer(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 7,
                    ),
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                    child: FilterChip(
                      label: Text(
                        loaiDacSan.tenLoaiDS,
                        style: TextStyle(
                          color: isSelected
                              ? Colors.white
                              : Theme.of(context).disabledColor,
                        ),
                      ),
                      selected: isSelected,
                      onSelected: (selected) {
                        selectChip(loaiDacSan);
                        if (loaiDacSan.tenLoaiDS == "Tất cả")
                          filteredDacSan = lstDacSan;
                        else{
                          filteredDacSan = lstDacSan
                              .where((dacSan) =>
                          dacSan.idLoaiDS == loaiDacSan.idLoaiDS)
                              .toList();
                        }
                      },
                      selectedColor: Colors.blue,
                      checkmarkColor: Colors.white,
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
