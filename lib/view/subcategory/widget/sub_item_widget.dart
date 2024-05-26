import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_menu/api/controller/controller.dart';
import 'package:qr_menu/model/beverage_model.dart';
import 'package:qr_menu/model/category_model.dart';
import 'package:qr_menu/view/category/card/beverage_card.dart';

class SubItemWidget extends StatelessWidget {

  List<BeverageModel>? beverageModels;
  String categoryId;
  SubItemWidget({required this.categoryId});

  getData() async {
    await Get.find<Controller>().getSubItemDetails(categoryId).then((value) {
      beverageModels = Get.find<Controller>().beverageModel!;
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
            if(beverageModels!.isNotEmpty) {
              return SizedBox(
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: beverageModels!.length,
                  itemBuilder: (context, int index) {
                    return CardList(beverage: beverageModels![index]);
                  },
                ),
              );
            } else {
              return const SizedBox(
                child: Text("Henüz ürün eklenmemiş."),
              );
            }

          }

        });
  }
}