// ignore_for_file: library_private_types_in_public_api

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';
import 'package:vinaFoods/Model/tinh_thanh.dart';

import '../Model/dac_san.dart';
import '../Model/loai_dac_san.dart';
import '../Model/vung_mien.dart';
import '../Service/thu_vien_api.dart';
import '../Service/thu_vien_widget.dart';
import '../Widget/thong_bao_xac_nhan_thoat.dart';
import '../main.dart';

class TrangDacSan extends StatefulWidget {
  const TrangDacSan({super.key});

  @override
  _TrangDacSanState createState() => _TrangDacSanState();
}

class _TrangDacSanState extends State<TrangDacSan> {
  String selectedChip = dsLoaiDacSan[0].tenLoaiDS;
  List<DacSan> lstDacSan = dsDacSan;
  List<TinhThanh> dsTinhLocal = dsTinhThanh;
  List<String> DSMien = ["Bắc", "Trung", "Nam"];
  String Address = ' 👈 Lấy vị trí hiện tại';

  void getUserAddress() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      permission = await Geolocator.requestPermission();
      if (permission != LocationPermission.whileInUse &&
          permission != LocationPermission.always) {
        return;
      }
    }

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    try {
      List<Placemark> placemarks =
      await placemarkFromCoordinates(position.latitude, position.longitude);
      if (placemarks.isNotEmpty) {
        setState(() {
          Address = placemarks.first.administrativeArea!;
        });
      } else {
        if (kDebugMode) {
          print('Không tìm thấy địa danh');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('Lỗi khi tìm các địa danh: $e');
      }
    }
  }

  void selectChip(LoaiDacSan chip) {
    setState(() {
      selectedChip = chip.tenLoaiDS;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (popped) {
        ThongBaoXacNhanThoat(context);
      },
      canPop: false,
      child: Scaffold(
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    style: ButtonStyle(
                        maximumSize:
                        MaterialStateProperty.all(const Size(40, 40))),
                    onPressed: () async {
                      getUserAddress();
                    },
                    icon: LoadHinh("assets/images/ic_location.png"),
                  ),
                  Text(Address.toString(),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.lightBlue,
                      )),
                ],
              ),
              CarouselSlider(
                options: CarouselOptions(
                  height: MediaQuery
                      .of(context)
                      .size
                      .height * 0.2 + 30,
                  animateToClosest: true,
                  pageSnapping: true,
                  enableInfiniteScroll: true,
                  viewportFraction: 1,
                ),
                items: buildBanner(5),
              ),
              buildDacSanNoiBat(),
              // headerLoaiDacSan(),
              Column(
                children: buildDanhSachDacSan(),
              )
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> buildDanhSachDacSan() {
    List<Widget> dsWidget = [];
    dsWidget = dsVungMien.map((vung) {
      return buildRowDacSan(vung);
    }).toList();
    return dsWidget;
  }

  Column buildRowDacSan(Vung vung) {
    return Column(
      children: [
        headerVungMien(vung),
        TinhList(
            lstTinhThanh: dsTinhLocal
                .where((tt) => tt.idVung == vung.idVung).toList()
        )
      ],
    );
  }

  Column buildDacSanNoiBat() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: TextButton(
            onPressed: () {
              context.goNamed(
                "timKiem",
                queryParameters: {"noiBat": "true"},
              );
            },
            child: const Column(
              children: [
                Text("------- Đặc sản quanh bạn -------",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.lightBlue,
                      fontSize: 20
                    )),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            bottom: 10,
          ),
          child: DacSanList(
            lstDacSan: getIDTuTenTinh(Address),
          )
        )
      ],
    );
  }

  List<Widget> buildBanner(int limit) {
    List<Widget> dsWidget = [];
    for (int i = 0; i < dsDacSan.length && i < limit; i++) {
      Widget temp = Builder(
        builder: (BuildContext context) {
          return Padding(
            padding: const EdgeInsets.only(
              bottom: 15,
              top: 10,
            ),
            child: Container(
              decoration: const BoxDecoration(
                border: Border.symmetric(
                  horizontal: BorderSide(
                    color: Color.fromARGB(155, 211, 211, 211),
                  ),
                ),
              ),
              height: MediaQuery
                  .of(context)
                  .size
                  .height * 0.1,
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery
                      .of(context)
                      .size
                      .width * 0.05,
                  vertical: 5),
              child: InkWell(
                onTap: () {
                  context.push("/dacsan/chitiet/${dsDacSan[i].idDacSan}");
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: cachedImage(dsDacSan[i].avatar!),
                ),
              ),
            ),
          );
        },
      );
      dsWidget.add(temp);
    }
    return dsWidget;
  }

  Padding headerLoaiDacSan() {
    return Padding(
      padding: const EdgeInsets.only(
        top: 10.0,
        bottom: 10.0,
        left: 15.0,
        right: 0,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const SizedBox(width: 10.0),
          Flexible(
            flex: 4,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: dsLoaiDacSan.map((loaiDacSan) {
                  bool isSelected = loaiDacSan.tenLoaiDS == selectedChip;
                  return AnimatedContainer(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                    child: FilterChip(
                      label: Text(
                        loaiDacSan.tenLoaiDS,
                        style: TextStyle(
                          color: isSelected
                              ? Colors.white
                              : Theme
                              .of(context)
                              .disabledColor,
                        ),
                      ),
                      selected: isSelected,
                      onSelected: (selected) {
                        selectChip(loaiDacSan);
                        lstDacSan = dsDacSan
                            .where((dacSan) =>
                        dacSan.idLoaiDS == loaiDacSan.idLoaiDS)
                            .toList();
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

  Padding headerVungMien(Vung vungMien) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: <Widget>[
          Text(vungMien.tenVung!,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.lightBlue,
              // overflow: TextOverflow.fade,
            ),
            overflow: TextOverflow.ellipsis,
            ),
          const Spacer(),
          // use Spacer
          // TextButton(
          //   onPressed: () {
          //     // context.goNamed(
          //     //   "timKiem",
          //     //   queryParameters: {"ten": "Mì"},
          //     // );
          //     context.go("/dacsan/vungmien/${vungMien.idVung}");
          //   },
          //   child: const Text("Xem thêm",
          //       style: TextStyle(
          //         fontSize: 12, fontWeight: FontWeight.bold, color: Colors.lightBlue)),
          // ),
        ],
      ),
    );
  }
}

class TinhList extends StatelessWidget {
  final List<TinhThanh> lstTinhThanh;

  const TinhList({super.key, required this.lstTinhThanh});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 250,
          child: Container(
            color: Theme
                .of(context)
                .brightness == Brightness.light
                ? Colors.lightBlue.shade100
                : const Color.fromARGB(155, 135, 206, 250),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: lstTinhThanh.length,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () =>
                  {
                    getCommentsFollowIDDacSan(1),
                    context.go("/dacsan/tinhThanh/${lstTinhThanh[index].idTinh!}")
                  },
                  child: Card(
                    margin: const EdgeInsets.all(10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Container(
                      width: 250,
                      padding: const EdgeInsets.all(4),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: cachedImage(lstTinhThanh[index].linkAnh!)
                            ),
                          ),
                          SizedBox(height: 15),
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Text(lstTinhThanh[index].tenTinh!,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 19,
                                )
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}

class DacSanList extends StatelessWidget {
  final List<DacSan> lstDacSan;

  const DacSanList({super.key, required this.lstDacSan});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 265,
          child: Container(
            color: Theme
                .of(context)
                .brightness == Brightness.light
                ? Colors.lightBlue.shade100
                : const Color.fromARGB(155, 135, 206, 250),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: lstDacSan.length,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () =>
                  {
                    // getCommentsFollowIDDacSan(1),
                    context.go("/dacsan/chitiet/${lstDacSan[index].idDacSan}")
                  },
                  child: Expanded(
                    child: Card(
                      margin: const EdgeInsets.all(10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Container(
                        width: 290,
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: cachedImage(lstDacSan[index].avatar!)
                              ),
                            ),
                            SizedBox(height: 13),
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Row(
                                children: [
                                  Text(lstDacSan[index].tenDS!,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                      )
                                  ),
                                  const Spacer(),
                                  Row(
                                    children: [
                                        Text(
                                        lstDacSan[index].sao.toString(),
                                        style: const TextStyle(
                                          fontSize: 15,
                                          color: Colors.grey, // Màu xám hoặc màu tùy chọn của bạn
                                        ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                    ],
                                  ),
                                  const Icon(
                                    Icons.star,
                                    color: Colors.yellow,
                                    size: 27,
                                    weight: 10,
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}