import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

import '../models/post_model.dart';
import '../pages/home_page.dart';
import '../services/http_service.dart';
class UpdateViewModel extends ChangeNotifier{
  bool isLoading = false;
  final TextEditingController titleController = TextEditingController();
  final TextEditingController bodyController = TextEditingController();

  Future apiPostUpdate(BuildContext context) async {
      isLoading = true;
      notifyListeners();

    Post post = Post(
      id: 1,
      title: titleController.text,
      body: bodyController.text,
      userId: 2,
    );

    var response = await Network.PUT('${Network.API_UPDATE}1', Network.paramsUpdate(post));

      if (response != null) {
        Navigator.pushNamedAndRemoveUntil(context, HomePage.id, (route) => false);
      }
      isLoading = false;
      notifyListeners();
      print(response);
  }
}