import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_menu/api/controller/controller.dart';
import 'package:qr_menu/model/category_model.dart';
import 'package:qr_menu/util/color.dart';
import 'package:qr_menu/view/home/widget/category_widget.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({super.key});

  final GlobalKey<ScaffoldState> _globalKey = GlobalKey();

  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: AppColor.appBarColor,
              title: const Text('QR-Menü', style: TextStyle(
                color: Colors.white,
              )),

              bottom: const TabBar(
                dividerColor: Colors.transparent,
                indicatorColor: AppColor.itemDetailsTextColor,
                labelColor: Colors.white,
                unselectedLabelColor: AppColor.appBarOffWhite,
                tabs: <Widget>[
                  Tab(
                    icon: Icon(Icons.local_drink),
                    text: "İçecekler",
                  ),
                  Tab(
                    icon: Icon(Icons.fastfood),
                    text: "Yiyecekler",
                  ),
                ],
              ),
            ),
            body: TabBarView(
              children: [
                SafeArea(
                child: _scrollView(_scrollController, context, Get.find<Controller>().beverageCategory),
                ),
                SafeArea(
                  child: _scrollView(_scrollController, context, Get.find<Controller>().foodCategory),
                ),
            ],
            ),
          ),
    );
  }

  Scrollbar _scrollView(ScrollController scrollController, BuildContext context, List<CategoryModel>? category) {
    return Scrollbar(
        controller: scrollController,
        child: CustomScrollView(controller: scrollController, slivers: [
          SliverToBoxAdapter(
            child: Center(
              child: Column(
                  children: [
                    SizedBox(
                      width: 600,
                      child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
                        CategoryWidget(category),
                      ],
                      ),
                    ),
                  ]
              ),
            ),
          )
        ])
    );
  }
}


