import 'package:flutter/material.dart';
import 'package:qr_menu/util/color.dart';

class ImageWidget extends StatelessWidget {

  final String imageUrl;
  ImageWidget({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        width: 350,
        height: 350,
        margin: EdgeInsets.only(top: 10),
        clipBehavior: Clip.antiAlias,
        decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: AppColor.itemDetailsBG,
            boxShadow: [BoxShadow(
                color: Colors.white,
                spreadRadius: 5,
                blurRadius: 5,
                offset: Offset(0, 3)
            )]

        ),
        child: Image.network(imageUrl,
            fit: BoxFit.cover),
      ),
    );
  }
}