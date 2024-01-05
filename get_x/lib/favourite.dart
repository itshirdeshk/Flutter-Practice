import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:get_x/favourite_controller.dart';

class Favoutite extends StatefulWidget {
  const Favoutite({super.key});

  @override
  State<Favoutite> createState() => _FavoutiteState();
}

class _FavoutiteState extends State<Favoutite> {
  // List<String> fruitsList = ['Orange', 'Mangoes', 'Banana', 'Apple'];
  // List<String> tempFruitsList = [];

  FavouriteController favouriteController = Get.put(FavouriteController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Favourite"),
      ),
      body: ListView.builder(
          itemCount: favouriteController.fruitsList.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                  onTap: () {
                    if (favouriteController.tempFruitsList.contains(
                        favouriteController.fruitsList[index].toString())) {
                      favouriteController.removeFromFav(
                          favouriteController.fruitsList[index].toString());
                    } else {
                      favouriteController.addToFav(
                          favouriteController.tempFruitsList[index].toString());
                    }
                  },
                  title: Text(favouriteController.fruitsList[index].toString()),
                  trailing: Obx(
                    () => Icon(
                      Icons.favorite,
                      color: favouriteController.tempFruitsList.contains(
                              favouriteController.fruitsList[index].toString())
                          ? Colors.red
                          : Colors.white,
                    ),
                  )),
            );
          }),
    );
  }
}
