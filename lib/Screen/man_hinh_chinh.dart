import 'package:async_builder/async_builder.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:go_router/go_router.dart';

import '../Service/thu_vien_api.dart';
import '../Service/thu_vien_widget.dart';
import '../Widget/thong_bao_xac_nhan_thoat.dart';
import '../main.dart';

class ManHinhChinh extends StatefulWidget {
  ManHinhChinh({
    super.key,
    required this.page,
  });

  final StatefulNavigationShell page;
  final TextEditingController controller = TextEditingController();

  @override
  State<ManHinhChinh> createState() => _ManHinhChinhState();
}

class _ManHinhChinhState extends State<ManHinhChinh> {
  var selectedIndex = 0;
  late Future<String> myFuture;

  @override
  void initState() {
    // TODO: implement initState
    myFuture = Future.delayed(
      const Duration(milliseconds: 100),
      () async {
        await getTinhThanh();
        await getHinhAnh();
        await getVung();
        await getLoaiDacSan();
        await getDacSan();
        await getComment();
        await getDSUser();
        await getFavorite(FirebaseAuth.instance.currentUser!.uid);
        await getNoiBan();
        nguoiDung = ((await getUser(FirebaseAuth.instance.currentUser!.uid)) ??
            (await getUser(
                "VnnNKzwRoqOItzRC4PPg4mkaRcc2")))!; // id nguời dùng khách
        // getDSCommentFollowIDUser(nguoiDung.uid);
        return "";
      },
    );
    super.initState();
  }

  void _selectLanguage(String language) {
    setState(() {
      selectedLanguage = language;
      MainApp.setLocale(context, Locale(language, ''));
    });
  }

  @override
  Widget build(BuildContext context) {
    return AsyncBuilder(
      future: myFuture,
      waiting: (context) => LoadingScreen(),
      builder: (context, value) => PopScope(
        onPopInvoked: (didPop) {
          if (kDebugMode) {
            print(value);
          }
          ThongBaoXacNhanThoat(context);
        },
        child: Scaffold(
          appBar: buildAppBar(),
          body: widget.page,
          bottomNavigationBar: buildBottomNavigationBar(),
        ),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: const Color.fromARGB(255, 30, 144, 255),
      actions: [
        Flexible(
          flex: 1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                // onTap: () {
                //   context.go('/');
                //   selectedIndex = 0;
                // },
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                  ),
                  child: Image.asset("assets/images/logo_pho.png"),
                ),
              ),
              Flexible(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 10,
                    bottom: 10,
                    left: 20,
                    right: 20,
                  ),
                  child: buildSearchAnchor(),
                ),
              ),
              GestureDetector(
                onTap: () {
                  showMenu(
                    context: context,
                    position: const RelativeRect.fromLTRB(75, 75, 0, 0),
                    items: [
                      PopupMenuItem<String>(
                        value: 'vi',
                        child: Text(
                            '\u{1F1FB}\u{1F1F3}  ${AppLocalizations.of(context)!.vi}'),
                      ),
                      PopupMenuItem<String>(
                        value: 'en',
                        child: Text(
                            '\u{1F1EC}\u{1F1E7}  ${AppLocalizations.of(context)!.en}'),
                      ),
                    ],
                  ).then((value) {
                    if (value != null) {
                      _selectLanguage(value);
                    }
                  });
                },
                child: const Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: Icon(
                    Icons.language,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
      iconTheme: const IconThemeData(color: Colors.white),
    );
  }

  Widget buildSearchAnchor() {
    return TypeAheadField(
      builder: (context, controller, focusNode) {
        return TextField(
          style: const TextStyle(color: Colors.white),
          textAlignVertical: TextAlignVertical.center,
          controller: widget.controller,
          decoration: InputDecoration(
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(width: 2, color: Colors.white70),
                borderRadius: BorderRadius.all(
                  Radius.circular(35),
                ),
              ),
              focusColor: const Color.fromARGB(255, 65, 105, 225),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(width: 2, color: Colors.white60),
                borderRadius: BorderRadius.all(
                  Radius.circular(35),
                ),
              ),
              filled: true,
              fillColor: const Color.fromARGB(255, 0, 114, 225),
              contentPadding: const EdgeInsets.symmetric(horizontal: 25),
              suffixIcon: IconButton(
                onPressed: () {
                  if (widget.controller.text.isNotEmpty) {
                    context.goNamed(
                      "timKiem",
                      queryParameters: {"ten": widget.controller.text},
                    );
                  }
                },
                icon: const Icon(Icons.search_outlined),
              ),
              suffixIconColor: Colors.white),
          onSubmitted: (value) {
            context.goNamed(
              "timKiem",
              queryParameters: {"ten": value},
            );
          },
        );
      },
      decorationBuilder: (context, child) {
        return Material(
          borderRadius: BorderRadius.circular(15),
        );
      },
      suggestionsCallback: (String pattern) {
        return dsDacSan
            .where((element) =>
                element.tenDS!.toLowerCase().contains(pattern.toLowerCase()))
            .toList();
      },
      itemBuilder: (BuildContext context, item) {
        return ListTile(
          title: Text(item.tenDS!),
        );
      },
      onSelected: (item) {
        context.go("/dacsan/chitiet/${item.idDacSan!}");
      },
      emptyBuilder: (context) {
        return const ListTile(
          title: Text("Không tìm thấy đặc sản"),
        );
      },
    );
  }

  BottomNavigationBar buildBottomNavigationBar() {
    return BottomNavigationBar(
      backgroundColor: const Color.fromARGB(255, 30, 144, 255),
      items: [
        BottomNavigationBarItem(
          icon: const Icon(Icons.home),
          label: AppLocalizations.of(context)!.home,
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.favorite),
          label: AppLocalizations.of(context)!.favourite,
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.account_box),
          label: AppLocalizations.of(context)!.user,
        ),
      ],
      currentIndex: selectedIndex,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white60,
      onTap: (value) {
        switch (value) {
          case 0:
            {
              getComment();
              selectedIndex != 0 ? context.go('/') : context.pop();
              break;
            }
          case 1:
            {
              selectedIndex != 1 ? context.go('/') : context.pop();
            }
        }

        setState(() {
          widget.page.goBranch(value);
          selectedIndex = value;
        });
      },
      type: BottomNavigationBarType.fixed,
    );
  }
}
