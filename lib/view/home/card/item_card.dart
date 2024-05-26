import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_menu/api/controller/controller.dart';
import 'package:qr_menu/model/beverage_model.dart';
import 'package:qr_menu/model/category_model.dart';
import 'package:qr_menu/util/color.dart';
import 'package:qr_menu/util/route_helper.dart';
import 'package:qr_menu/view/category/category_screen.dart';

class CardList extends StatelessWidget {

  final CategoryModel category;
  CardList({super.key, required this.category});




  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColor.pageBackground,
      elevation: 0.5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: InkWell(
        onTap: () {
          // Handle card tap
          Get.to(CategoryScreen(mainCategoryId: category.catID.toString(), mainCategoryTitle: category.catTitle.toString()));
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(top:10),
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: Image.network(
                  category.catImage.toString(),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    category.catTitle.toString(),
                    style: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4.0),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/*
Container(
        clipBehavior: Clip.antiAlias,
        padding: const EdgeInsets.only(left: 10, right: 15),
        decoration: const BoxDecoration(
            shape: BoxShape.circle
        ),
        child: InkWell(
          onTap: () {

          },
          child: Image.network("https://docs.flutter.dev/assets/images/docs/ui/layout/stack-flutter-gallery.png", fit: BoxFit.cover),
        )
    );
 */