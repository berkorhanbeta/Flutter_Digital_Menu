import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:qr_menu/model/beverage_model.dart';
import 'package:qr_menu/util/color.dart';

class ItemDetails extends StatelessWidget {

  final BeverageModel beverage;
  ItemDetails({super.key, required this.beverage});

  @override
  Widget build(BuildContext context){
    return Padding(padding: EdgeInsets.all(15),
      child: Column(
        children: [
          beverage.alcohol != "0" ? ratingSection() : SizedBox(),
          Divider(),
          Card(
            child: drinkDetails(),
            elevation: 0,
            semanticContainer: true,
            color: AppColor.itemCardBG,
            ),
        ],
      )
    );
  }


  Text addText(String text, double fontSize, bool isBold ){
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: isBold == false ? FontWeight.normal : FontWeight.bold,
        color: AppColor.itemDetailsTextColor
      ),
    );
  }

  Text addPrice(String text, double fontSize, bool isBold ){
    return Text(
      text,
      style: TextStyle(
          fontSize: fontSize,
          fontWeight: isBold == false ? FontWeight.normal : FontWeight.bold,
          color: AppColor.itemPriceColor
      ),
    );
  }




/* Rating Section */
  Padding ratingSection(){
    return Padding(padding: EdgeInsets.only(top: 20, bottom: 20),
      child: Row(
        children: [
          Expanded(child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              addText("Alkol Oranı", 16, false),
              rating()

            ],
          ))
        ],
      ),
    );
  }
  RatingBar rating(){
    return RatingBar.builder(
      initialRating: double.parse(beverage.alcohol.toString()),
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
      itemSize: 30,
      itemBuilder: (context, _) => const Icon(
        Icons.star,
        color: Colors.amber,
      ),
      onRatingUpdate: (rating) {
        print(rating);
      },
    );
  }


  /* Drink Details */
  Padding drinkDetails(){
    return Padding(padding: EdgeInsets.all(20),
      child: Row(
        children: [
          Expanded(child: Column(

            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      addText(beverage.title.toString(), 25, true),
                    ],
                  )),
                  addPrice("${beverage.price} ₺", 14, true),
                ],
              ),
              Row(
                children: [
                  Expanded(child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      addText("İçindekiler", 14, true),
                      addText("${beverage.ingredients.toString()}", 14, false),
                      Divider(color: Colors.transparent,),
                      addText("${beverage.description.toString()}", 14, false),

                    ],
                  ))
                ],
              )
            ],
          ))
        ],
      ),
    );
  }
}