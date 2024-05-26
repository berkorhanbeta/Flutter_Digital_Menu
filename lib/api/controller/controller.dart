import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:qr_menu/model/beverage_model.dart';
import 'package:qr_menu/model/category_model.dart';
import 'package:qr_menu/model/main_model.dart';
import 'package:qr_menu/api/repo/repo.dart';

class Controller extends ChangeNotifier {

  final Repo repo;
  Controller({required this.repo});

  List<CategoryModel>? _categoryModel;
  List<CategoryModel>? get categoryModel => _categoryModel;
  List<BeverageModel>? _beverageModel;
  List<BeverageModel>? get beverageModel => _beverageModel;
  List<CategoryModel>? _subCategoryModel;
  List<CategoryModel>? get subCategoryModel => _subCategoryModel;


  List<CategoryModel>? _beverageCategory;
  List<CategoryModel>? get beverageCategory => _beverageCategory;
  List<CategoryModel>? _foodCategory;
  List<CategoryModel>? get foodCategory => _foodCategory;


  // Get All Categories
  Future<bool> getCategories() async {
    bool isSuccess = false;
    Response response = await repo.getAllCategories();
    if(response.statusCode == 200) {
      _beverageCategory = MainModel.fromJson(response.body).beverageCategory;
      _foodCategory = MainModel.fromJson(response.body).foodCategory;

      notifyListeners();
      isSuccess = true;
    }
    return isSuccess;
  }















  // Get All Categories
  Future<bool> getSubCategory(String id) async {
    bool isSuccess;
    Response response = await repo.getAllSubCategories(id);
    if(response.statusCode == 200) {
      _subCategoryModel = MainModel.fromJson(response.body).subCategory;
      notifyListeners();
      isSuccess = true;
    } else {
      isSuccess = false;
    }
    _subCategoryModel!.forEach((element) { print(element.catTitle.toString());});
    return isSuccess;
  }


  // Get All Items
  Future<bool> getItemDetails(String id) async {
    bool isSuccess;
    Response response = await repo.getItemDetails(id);
    if(response.statusCode == 200) {
      _beverageModel = MainModel.fromJson(response.body).beverageModel;
      notifyListeners();
      isSuccess = true;
    } else {
      isSuccess = false;
    }
    return isSuccess;
  }

  // Get All Items
  Future<bool> getSubItemDetails(String id) async {
    bool isSuccess;
    Response response = await repo.getSubItemDetails(id);
    if(response.statusCode == 200) {
      _beverageModel = MainModel.fromJson(response.body).beverageModel;
      notifyListeners();
      isSuccess = true;
    } else {
      isSuccess = false;
    }
    return isSuccess;
  }
}