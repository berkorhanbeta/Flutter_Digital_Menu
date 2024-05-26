import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_menu/api/controller/controller.dart';
import 'package:qr_menu/model/category_model.dart';
import 'package:qr_menu/view/home/card/item_card.dart';

class CategoryWidget extends StatelessWidget {


  List<CategoryModel>? category;
  CategoryWidget(this.category);



  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: GridView.count(
        shrinkWrap: true,
        crossAxisCount: 2,
        padding: const EdgeInsets.all(16.0),
        crossAxisSpacing: 16.0,
        mainAxisSpacing: 16.0,
        children: List.generate(category!.length, (index) {
          return CardList(category: category![index]);
        }),
      ),
    );
  }
}