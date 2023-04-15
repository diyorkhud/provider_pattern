import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:provider_pattern/pages/home_page.dart';
import '../models/post_model.dart';
import '../services/http_service.dart';
class PostViewModel extends ChangeNotifier{
  List<Post> items = [];
  bool isLoading = false;
  final TextEditingController titleController = TextEditingController();
  final TextEditingController bodyController = TextEditingController();

  Future apiPostCreate(BuildContext context)  async {
      isLoading = true;
      notifyListeners();

    Post post = Post(title: titleController.text, body: bodyController.text, userId: 3);

    var response = await Network.POST(Network.API_CREATE, Network.paramsCreate(post));

      if (response != null) {
        Navigator.pushNamedAndRemoveUntil(context, HomePage.id, (route) => false);
      }
      isLoading = false;
      notifyListeners();
      print(response);
  }
}