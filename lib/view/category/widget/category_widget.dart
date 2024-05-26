import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_menu/api/controller/controller.dart';
import 'package:qr_menu/model/category_model.dart';
import 'package:qr_menu/view/category/card/category_card.dart';
import 'package:qr_menu/view/category/widget/item_widget.dart';

class CategoryWidget extends StatefulWidget {
  String? mainCategoryId;


  CategoryWidget({super.key, required this.mainCategoryId});

  @override
  State<CategoryWidget> createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {
  List<CategoryModel>? subCategory;


  getData() async {
    await Get.find<Controller>().getSubCategory(widget.mainCategoryId.toString()).then((value) {
      subCategory = Get.find<Controller>().subCategoryModel!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
        future: getData(),
        builder: (context, AsyncSnapshot<void> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return Column(
              children: [
                subCategory!.isNotEmpty ? SizedBox(
                  height: 100,
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: subCategory!.length,
                    itemBuilder: (context, int index) {
                      return CardList(category: subCategory![index]);
                    },
                  ),
                ) : const SizedBox(),
                ItemWidget(categoryId: widget.mainCategoryId.toString())
              ],
            );
          }

        });
  }
}
