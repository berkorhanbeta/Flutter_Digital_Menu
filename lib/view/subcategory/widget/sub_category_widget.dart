import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_menu/api/controller/controller.dart';
import 'package:qr_menu/model/category_model.dart';
import 'package:qr_menu/view/category/card/category_card.dart';
import 'package:qr_menu/view/subcategory/widget/sub_item_widget.dart';

class SubCategoryWidget extends StatelessWidget {
  String? mainCategoryId;

  List<CategoryModel>? subCategory;

  SubCategoryWidget({super.key, required this.mainCategoryId});


  getData() async {
    await Get.find<Controller>().getSubCategory(mainCategoryId.toString()).then((value) {
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
                SubItemWidget(categoryId: mainCategoryId.toString())
              ],
            );
          }

        });
  }

}
