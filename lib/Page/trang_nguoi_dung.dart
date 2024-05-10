import 'package:dropdown_search/dropdown_search.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../Model/nguoi_dung.dart';
import '../Model/tinh_thanh.dart';
import '../Service/thu_vien_api.dart';
import '../Service/thu_vien_style.dart';
import '../Widget/thong_bao_xac_nhan_thoat.dart';
import '../main.dart';

class TrangNguoiDung extends StatefulWidget {
  TrangNguoiDung({
    super.key,
  });

  NguoiDung? nguoiDung;
  final TextEditingController uidController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController hoTenController = TextEditingController();
  final TextEditingController diaChiController = TextEditingController();

  @override
  State<TrangNguoiDung> createState() => _TrangNguoiDungState();
}

class _TrangNguoiDungState extends State<TrangNguoiDung> {
  bool isReadOnly = true;
  String updateText = "Cập nhật thông tin";
  bool isNam = true;
  int indexTinh = 0;

  @override
  void initState() {
    widget.uidController.text = FirebaseAuth.instance.currentUser!.uid;
    widget.emailController.text = nguoiDung.email!;
    widget.hoTenController.text = nguoiDung.hoTen!;
    widget.diaChiController.text = nguoiDung.diaChi!;
    isNam = nguoiDung.gioiTinh == "Nam";
    String numericString = nguoiDung.diaChi!.replaceAll(RegExp(r'[^0-9]'), '');
    indexTinh = int.parse(numericString) - 1;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String textLogout = nguoiDung.uid == idGuest
        ? AppLocalizations.of(context)!.in_up
        : AppLocalizations.of(context)!.out;
    return PopScope(
      onPopInvoked: (popped) {
        ThongBaoXacNhanThoat(context);
      },
      canPop: false,
      child: Scaffold(
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Form(
            child: Column(
              children: [
                ListTile(
                  shape: LinearBorder.bottom(
                    side: const BorderSide(
                      color: Color.fromARGB(155, 211, 211, 211),
                    ),
                  ),
                  title: Text(
                    AppLocalizations.of(context)!.infor,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
                TextFieldNguoiDung(
                  controller: widget.uidController,
                  text: AppLocalizations.of(context)!.id,
                  isReadOnly: true,
                ),
                TextFieldNguoiDung(
                  controller: widget.emailController,
                  text: "Email",
                  isReadOnly: true,
                ),
                TextFieldNguoiDung(
                  controller: widget.hoTenController,
                  text: AppLocalizations.of(context)!.name,
                  isReadOnly: isReadOnly,
                ),
                ListTile(
                  shape: LinearBorder.bottom(
                    side: const BorderSide(
                      color: Color.fromARGB(155, 211, 211, 211),
                    ),
                  ),
                  title: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: DropdownSearch<TinhThanh>(
                      enabled: !isReadOnly,
                      popupProps: PopupProps.menu(
                        title: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Center(
                            child: Text(
                              AppLocalizations.of(context)!.ds_tinh,
                              style: const TextStyle(fontSize: 16),
                            ),
                          ),
                        ),
                        showSelectedItems: true,
                      ),
                      dropdownDecoratorProps: DropDownDecoratorProps(
                        dropdownSearchDecoration: InputDecoration(
                          contentPadding: const EdgeInsetsDirectional.only(
                            start: 25,
                            top: 15,
                            bottom: 15,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(35),
                          ),
                        ),
                      ),
                      compareFn: (item1, item2) {
                        return item1 == item2;
                      },
                      onChanged: (value) {
                        if (value != null) {
                          widget.diaChiController.text = value.idTinh!;
                        }
                      },
                      selectedItem: dsTinhThanh[indexTinh],
                      items: dsTinhThanh,
                      itemAsString: (value) {
                        return value.tenTinh!;
                      },
                    ),
                  ),
                ),
                ListTile(
                  shape: LinearBorder.bottom(
                    side: const BorderSide(
                      color: Color.fromARGB(155, 211, 211, 211),
                    ),
                  ),
                  title: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Flexible(
                        child: ListTile(
                          title: Text(AppLocalizations.of(context)!.gt_nam),
                          leading: Radio(
                            value: true,
                            groupValue: isNam,
                            onChanged: isReadOnly
                                ? null
                                : (bool? value) {
                                    setState(() {
                                      isNam = value!;
                                    });
                                  },
                          ),
                        ),
                      ),
                      Flexible(
                        child: ListTile(
                          title: Text(AppLocalizations.of(context)!.gt_nu),
                          leading: Radio(
                            value: false,
                            groupValue: isNam,
                            onChanged: isReadOnly
                                ? null
                                : (bool? value) {
                                    setState(() {
                                      isNam = value!;
                                    });
                                  },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Visibility(
                  visible: nguoiDung.uid != idGuest,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 25,
                      bottom: 15,
                      left: 25,
                      right: 25,
                    ),
                    child: ElevatedButton(
                      style: OutlinedButton.styleFrom(
                        minimumSize: const Size.fromHeight(35),
                        padding: const EdgeInsets.all(12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        side: const BorderSide(
                            width: 1, color: Colors.lightBlueAccent),
                      ),
                      onPressed: () {
                        setState(() {
                          if (isReadOnly) {
                            isReadOnly = false;
                            updateText =
                                AppLocalizations.of(context)!.save_infor;
                          } else {
                            isReadOnly = true;
                            updateUser(
                              widget.uidController.text,
                              widget.emailController.text,
                              widget.hoTenController.text,
                              isNam,
                              widget.diaChiController.text,
                            );
                            updateText =
                                AppLocalizations.of(context)!.update_infor;
                          }
                        });
                      },
                      child: Text(updateText),
                    ),
                  ),
                ),
                Visibility(
                  visible: nguoiDung.uid != idGuest,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      bottom: 15,
                      left: 25,
                      right: 25,
                    ),
                    child: ElevatedButton(
                      style: OutlinedButton.styleFrom(
                        minimumSize: const Size.fromHeight(35),
                        padding: const EdgeInsets.all(12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        side: const BorderSide(
                            width: 1, color: Colors.lightBlueAccent),
                      ),
                      onPressed: !isReadOnly
                          ? null
                          : () {
                              context.go(
                                  "/doimatkhau/${FirebaseAuth.instance.currentUser!.uid}");
                            },
                      child: Text(AppLocalizations.of(context)!.update_pass),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 25,
                  ),
                  child: ElevatedButton(
                    style: OutlinedButton.styleFrom(
                      minimumSize: const Size.fromHeight(35),
                      padding: const EdgeInsets.all(12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      side: const BorderSide(width: 1, color: Colors.redAccent),
                    ),
                    onPressed: () async {
                      await FirebaseAuth.instance
                          .signOut()
                          .whenComplete(() async {
                        // await FacebookAuth.instance.logOut();
                        await GoogleSignIn().signOut().whenComplete(() {
                          if (context.mounted) {
                            dsDacSan.clear();
                            dsHinhAnh.clear();
                            dsTinhThanh.clear();
                            dsVungMien.clear();
                            context.go("/");
                          }
                        });
                      });
                    },
                    child: Text(textLogout),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TextFieldNguoiDung extends StatelessWidget {
  const TextFieldNguoiDung({
    super.key,
    required this.controller,
    required this.text,
    this.isReadOnly = true,
  });

  final TextEditingController controller;
  final String text;
  final bool isReadOnly;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: TextFormField(
          readOnly: isReadOnly,
          controller: controller,
          decoration: RoundInputDecoration(text),
        ),
      ),
      shape: LinearBorder.bottom(
        side: const BorderSide(
          color: Color.fromARGB(155, 211, 211, 211),
        ),
      ),
    );
  }
}
