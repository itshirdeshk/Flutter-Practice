import 'package:flutter/material.dart';
import 'package:mvvm/utils/routes/routes_names.dart';

import '../../model/user_model.dart';
import '../user_view_model.dart';

class SplashSevices {
  Future<UsersModel> getUserData() => UserViewModel().getUser();

  void checkAuthentication(BuildContext context) async {
    getUserData()
        .then((value) async => {
              if (value.token == "null" || value.token == '')
                {
                  await Future.delayed(Duration(seconds: 3)),
                  Navigator.pushNamed(context, RoutesName.login)
                }
              else
                {
                  await Future.delayed(Duration(seconds: 3)),
                  Navigator.pushNamed(context, RoutesName.home)
                }
            })
        .onError((error, stackTrace) => {});
  }
}
