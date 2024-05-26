import 'package:qr_menu/model/beverage_model.dart';
import 'package:qr_menu/model/category_model.dart';

class MainModel {
  List<CategoryModel>? _foodCategory;
  List<CategoryModel>? _beverageCategory;
  List<CategoryModel>? _subCategory;


  List<BeverageModel>? _beverageModel;

  MainModel({
    List<CategoryModel>? foodCategory,
    List<CategoryModel>? beverageCategory,
    List<CategoryModel>? subCategory,

    List<BeverageModel>? beverageModel
  }) {
    _foodCategory = foodCategory;
    _beverageCategory = beverageCategory;
    _subCategory = subCategory;

    _beverageModel = beverageModel;

  }

  MainModel.fromJson(Map<String, dynamic> json) {
    _foodCategory = <CategoryModel>[];
    _beverageCategory = <CategoryModel>[];
    _subCategory = <CategoryModel>[];

    if(json['beverages'] != null) {
      json['beverages'].forEach((v) {
        _beverageCategory!.add(CategoryModel.fromJSON(v));
      });
    }

    if(json['foods'] != null) {
      json['foods'].forEach((v) {
        _foodCategory!.add(CategoryModel.fromJSON(v));
      });
    }

    if(json['subcategory'] != null) {
      json['subcategory'].forEach((v) {
        _subCategory!.add(CategoryModel.fromJSON(v));
      });
    }

    _beverageModel = <BeverageModel>[];

    if(json['beverage'] != null) {
      json['beverage'].forEach((v) {
        _beverageModel!.add(BeverageModel.fromJSON(v));
      });
    }
  }

  List<CategoryModel>? get beverageCategory => _beverageCategory;
  List<CategoryModel>? get foodCategory => _foodCategory;
  List<CategoryModel>? get subCategory => _subCategory;

  List<BeverageModel>? get beverageModel => _beverageModel;

}