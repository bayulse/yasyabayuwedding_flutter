// import 'dart:typed_data';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';
import 'package:sizer/sizer.dart';
import 'package:states_rebuilder/states_rebuilder.dart';
import 'package:yasyabayuwedding/models/assets.dart';
import 'package:yasyabayuwedding/services/app_state.dart';
import 'package:yasyabayuwedding/ui/widgets/ui_helper.dart';

class GalleryPage extends StatelessWidget {
  final Assets assets;

  const GalleryPage({Key key, this.assets}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final app = RM.get<AppState>();

    return Stack(
      alignment: Alignment.center,
      children: [
        UIHelper().background(assets),
        UIHelper().flowerTopRight(assets),
        UIHelper().rootTopLeft(assets),
        UIHelper().flowerBottomLeft(assets),
        UIHelper().rootBottomRight(assets),
        DelayedDisplay(
          delay: Duration(milliseconds: 500),
          slidingBeginOffset: Offset(0.0, 0.0),
          slidingCurve: Curves.elasticIn,
          child: Container(
            padding: EdgeInsets.all(10.0.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: SizerUtil.deviceType == DeviceType.Mobile
                      ? MainAxisAlignment.spaceBetween
                      : MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: app.state.mainImg == 1
                          ? BoxDecoration(
                              border: Border.all(
                                  color: UIHelper.fallow, width: 3.0),
                              borderRadius: BorderRadius.circular(3.0),
                            )
                          : BoxDecoration(),
                      child: InkWell(
                        onTap: () => app.setState((s) {
                          s.mainImg = 1;
                          s.mainImgAnimation.currentState.forward();
                        }),
                        child: _buildImg('assets/assets/gallery/gallery1.png'),
                      ),
                    ),
                    Container(
                      decoration: app.state.mainImg == 2
                          ? BoxDecoration(
                              border: Border.all(
                                  color: UIHelper.fallow, width: 3.0),
                              borderRadius: BorderRadius.circular(3.0),
                            )
                          : BoxDecoration(),
                      child: InkWell(
                        onTap: () => app.setState((s) {
                          s.mainImg = 2;
                          s.mainImgAnimation.currentState.forward();
                        }),
                        child: _buildImg('assets/assets/gallery/gallery2.png'),
                      ),
                    ),
                    Container(
                      decoration: app.state.mainImg == 3
                          ? BoxDecoration(
                              border: Border.all(
                                  color: UIHelper.fallow, width: 3.0),
                              borderRadius: BorderRadius.circular(3.0),
                            )
                          : BoxDecoration(),
                      child: InkWell(
                        onTap: () => app.setState((s) {
                          s.mainImg = 3;
                          s.mainImgAnimation.currentState.forward();
                        }),
                        child: _buildImg('assets/assets/gallery/gallery3.png'),
                      ),
                    ),
                  ],
                ),
                UIHelper.verticalSmallSpace,
                StateBuilder<AppState>(
                  observe: () => app,
                  builder: (context, model) => RotateInUpLeft(
                    key: model.state.mainImgAnimation,
                    preferences: AnimationPreferences(
                      autoPlay: AnimationPlayStates.Forward,
                    ),
                    child: _buildImg(
                      model.state.mainImg == 1
                          ? 'assets/assets/gallery/gallery1.png'
                          : model.state.mainImg == 2
                              ? 'assets/assets/gallery/gallery2.png'
                              : 'assets/assets/gallery/gallery3.png',
                      mainImg: true,
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget _buildImg(String img, {bool mainImg = false}) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white, width: 3.0),
        borderRadius: BorderRadius.circular(3.0),
      ),
      child: CachedNetworkImage(
        imageUrl: img,
        placeholder: (_, __) => Container(),
        width: mainImg
            ? SizerUtil.deviceType == DeviceType.Mobile
                ? 80.0.w
                : 56.0.w
            : SizerUtil.deviceType == DeviceType.Mobile
                ? 24.0.w
                : 18.0.w,
      ),
      // FadeInImage.assetNetwork(
      //   image: img,
      //   placeholder: '',
      //   width: mainImg ? 80.0.w : 25.0.w,
      // ),
      // Image.memory(
      //   img,
      //   width: mainImg ? 80.0.w : 25.0.w,
      // ),
    );
  }
}
