import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_menu/api/controller/controller.dart';
import 'package:qr_menu/util/color.dart';
import 'package:qr_menu/view/category/widget/category_widget.dart';
import 'package:qr_menu/view/home/widget/banner_widget.dart';

class CategoryScreen extends StatelessWidget {
  String? mainCategoryId;
  String mainCategoryTitle;
  CategoryScreen({super.key, required this.mainCategoryId, required this.mainCategoryTitle});

  final GlobalKey<ScaffoldState> _globalKey = GlobalKey();

  final ScrollController _scrollController = ScrollController();

  // Home Screen View
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      scrollBehavior: const MaterialScrollBehavior().copyWith(dragDevices: {
        PointerDeviceKind.mouse, PointerDeviceKind.touch, PointerDeviceKind.stylus, PointerDeviceKind.unknown
      }),
      theme: ThemeData(useMaterial3: true),
      home: Scaffold(
        appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => Navigator.of(context).pop(),
            ),
            title: Text(mainCategoryTitle, style: const TextStyle(
              color: Colors.white
            )),
            backgroundColor: AppColor.appBarColor,
        ),
        body: SafeArea(
          child: _scrollView(_scrollController, context)
        ),
      ),
    );
  }

  Scrollbar _scrollView(ScrollController scrollController, BuildContext context) {
    return Scrollbar(
      controller: scrollController,
        child: CustomScrollView(controller: scrollController, slivers: [
          SliverToBoxAdapter(
            child: Center(
              child: Column(
                children: [
                  SizedBox(
                    width: 600,
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      CategoryWidget(mainCategoryId: mainCategoryId),
                    ],),
                  ),
                ]
              ),
            ),
          )
        ])
    );
  }
}


