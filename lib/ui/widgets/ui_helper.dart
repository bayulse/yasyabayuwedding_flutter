import 'dart:math' as math;

import 'package:cached_network_image/cached_network_image.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:yasyabayuwedding/models/assets.dart';

class UIHelper {
  static const horizontalSmallSpace = SizedBox(width: 10.0);

  static const verticalSmallSpace = SizedBox(height: 10.0);
  static const verticalMediumSpace = SizedBox(height: 20.0);
  static const verticalLargeSpace = SizedBox(height: 40.0);

  static const Color brown = Color.fromRGBO(132, 113, 104, 1);
  static const Color fallow = Color.fromRGBO(200, 157, 108, 1);
  static const Color lightBrown = Color.fromRGBO(200, 157, 108, 1);
  static const Color roti = Color.fromRGBO(194, 154, 61, 1);
  static const Color russet = Color.fromRGBO(127, 107, 100, 1);

  Widget loading = Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SpinKitPumpingHeart(
          size: 10.0.w,
          color: brown,
        ),
        verticalSmallSpace,
        DelayedDisplay(
          delay: Duration(milliseconds: 800),
          slidingBeginOffset: Offset(0, 0),
          child: Text(
            'loading..',
            style: GoogleFonts.rancho(color: brown, fontSize: 10.0.sp),
            textAlign: TextAlign.center,
          ),
        )
      ],
    ),
  );

  Widget background(Assets assets) {
    return CachedNetworkImage(
      imageUrl: 'assets/assets/background.png',
      placeholder: (_, __) => Container(),
      height: double.infinity,
      width: double.infinity,
      fit: BoxFit.fill,
    );
    // FadeInImage.assetNetwork(
    //   image: 'assets/assets/background.png',
    //   placeholder: '',
    //   height: double.infinity,
    //   width: double.infinity,
    //   fit: BoxFit.fill,
    // );
    // Image.memory(
    //   assets.background,
    //   height: double.infinity,
    //   width: double.infinity,
    //   fit: BoxFit.fill,
    // );
  }

  Widget flowerTopRight(Assets assets) {
    return Positioned(
      top: 0,
      right: 0,
      child: CachedNetworkImage(
        imageUrl: 'assets/assets/flower.png',
        placeholder: (_, __) => Container(),
        width: 20.0.w,
      ),
      // FadeInImage.assetNetwork(
      //   image: 'assets/assets/flower.png',
      //   placeholder: '',
      //   width: 20.0.w,
      // ),
      // Image.memory(
      //   assets.flower,
      //   width: 20.0.w,
      // ),
    );
  }

  Widget flowerBottomLeft(Assets assets) {
    return Positioned(
      bottom: 0,
      left: 0,
      child: Transform(
        transform: Matrix4.rotationX(math.pi),
        alignment: FractionalOffset.center,
        child: Transform(
          transform: Matrix4.rotationY(math.pi),
          alignment: FractionalOffset.center,
          child: CachedNetworkImage(
            imageUrl: 'assets/assets/flower.png',
            placeholder: (_, __) => Container(),
            width: 20.0.w,
          ),
          // FadeInImage.assetNetwork(
          //   image: 'assets/assets/flower.png',
          //   placeholder: '',
          //   width: 20.0.w,
          // ),
          // Image.memory(
          //   assets.flower,
          //   width: 20.0.w,
          // ),
        ),
      ),
    );
  }

  Widget rootTopLeft(Assets assets) {
    return Positioned(
      top: 0,
      left: 0,
      child: CachedNetworkImage(
        imageUrl: 'assets/assets/root.png',
        placeholder: (_, __) => Container(),
        width: 20.0.w,
      ),
      // FadeInImage.assetNetwork(
      //   image: 'assets/assets/root.png',
      //   placeholder: '',
      //   width: 20.0.w,
      // ),
      // Image.memory(
      //   assets.root,
      //   width: 20.0.w,
      // ),
    );
  }

  Widget rootBottomRight(Assets assets) {
    return Positioned(
      bottom: 0,
      right: 0,
      child: Transform(
        transform: Matrix4.rotationX(math.pi),
        alignment: FractionalOffset.center,
        child: Transform(
          transform: Matrix4.rotationY(math.pi),
          alignment: FractionalOffset.center,
          child: CachedNetworkImage(
            imageUrl: 'assets/assets/root.png',
            placeholder: (_, __) => Container(),
            width: 20.0.w,
          ),
          // FadeInImage.assetNetwork(
          //   image: 'assets/assets/root.png',
          //   placeholder: '',
          //   width: 20.0.w,
          // ),
          // Image.memory(
          //   assets.root,
          //   width: 20.0.w,
          // ),
        ),
      ),
    );
  }
}
