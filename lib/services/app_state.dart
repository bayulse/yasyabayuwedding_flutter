import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';
import 'package:transformer_page_view/index_controller.dart';
import 'package:transformer_page_view/transformer_page_view.dart';
import 'package:url_launcher/url_launcher.dart';

class AppState {
  IndexController pageViewController = IndexController();

  int weddingDateTime = DateTime.fromMillisecondsSinceEpoch(1609552800000).millisecondsSinceEpoch + 1000  * 30;
  
  GlobalKey<AnimatorWidgetState> arrowAnimation = GlobalKey<AnimatorWidgetState>();
  bool arrowFirstTime = true;
  
  GlobalKey<AnimatorWidgetState> mainImgAnimation = GlobalKey<AnimatorWidgetState>();
  int mainImg = 1;

  launchMap() async {
    const location =
        'https://www.google.com/maps/dir/?api=1&destination=-6.187132, 107.030270';
    if (await canLaunch(location)) {
      await launch(location);
    } else {
      throw 'Could not launch $location';
    }
  }
}
