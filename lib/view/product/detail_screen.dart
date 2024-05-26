import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_menu/api/controller/controller.dart';
import 'package:qr_menu/helper/clipper.dart';
import 'package:qr_menu/model/beverage_model.dart';
import 'package:qr_menu/util/app_constants.dart';
import 'package:qr_menu/util/color.dart';
import 'package:qr_menu/view/product/widget/image_widget.dart';
import 'package:qr_menu/view/product/widget/item_details.dart';

class ProductDetails extends StatefulWidget {
  final String itemId;
  const ProductDetails({super.key, required this.itemId});

  @override
  State<ProductDetails> createState() => _ProductDetails();
}

class _ProductDetails extends State<ProductDetails> {
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey();
  final ScrollController _scrollController = ScrollController();

  List<BeverageModel> beverageModels = Get.find<Controller>().beverageModel!;
  BeverageModel? beverage;


  @override
  void initState() {
    super.initState();
    beverage = beverageModels.firstWhere((item) => item.id == widget.itemId);


  }

  @override
  void dispose() {
    super.dispose();

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
      home:
      Scaffold(
        appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => Navigator.of(context).pop(),
            ),
            title: const Text(AppConstants.appName, style: TextStyle(
              color: Colors.white
            )),
            backgroundColor: AppColor.appBarColor,
        ),
        body: Scaffold(
          backgroundColor: Colors.white,
          body: Stack(
            children: [
              ClipPath(
                  clipper: MyClipper(),
                  child: Container(
                    color: AppColor.itemDetailsBG,
                  )
              ),
              _scrollView(_scrollController, context)
            ],
          ),
        )
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

                        ImageWidget(imageUrl: beverage!.image.toString()),
                        ItemDetails(beverage: beverage!),
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



