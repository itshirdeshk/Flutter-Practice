import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class FavouriteController extends GetxController {
  RxList<String> fruitsList = ['Orange', 'Mangoes', 'Banana', 'Apple'].obs;
  RxList tempFruitsList = [].obs;

  addToFav(String value) {
    tempFruitsList.add(value);
  }

  removeFromFav(String value) {
    tempFruitsList.remove(value);
  }
}
