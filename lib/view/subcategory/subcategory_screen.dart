import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_menu/api/controller/controller.dart';
import 'package:qr_menu/model/beverage_model.dart';
import 'package:qr_menu/util/color.dart';
import 'package:qr_menu/view/subcategory/widget/sub_category_widget.dart';

class SubCategoryScreen extends StatefulWidget {
  String? mainCategoryId;
  String? subCategoryId;
  String? subCategoryTitle;
  SubCategoryScreen({super.key, required this.mainCategoryId, required this.subCategoryTitle, required this.subCategoryId});

  @override
  State<SubCategoryScreen> createState() => _SubCategoryScreenState();
}

class _SubCategoryScreenState extends State<SubCategoryScreen> {
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey();

  final ScrollController _scrollController = ScrollController();

  List<BeverageModel>? beverageModels;
  getData() async {
    print("object");
    await Get.find<Controller>().getItemDetails(widget.mainCategoryId.toString()).then((value) {
      beverageModels = Get.find<Controller>().beverageModel!;
    });
  }

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
              onPressed: () async {
                await getData();
                Navigator.of(context).pop();
              }
            ),
            title: Text(widget.subCategoryTitle.toString(), style: const TextStyle(
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
                      SubCategoryWidget(mainCategoryId: widget.subCategoryId),
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


