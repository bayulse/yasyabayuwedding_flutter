import 'dart:math' as math;

import 'package:cached_network_image/cached_network_image.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:states_rebuilder/states_rebuilder.dart';
import 'package:yasyabayuwedding/models/assets.dart';
import 'package:yasyabayuwedding/services/assets_service.dart';
import 'package:yasyabayuwedding/ui/pages/home.dart';
import 'package:yasyabayuwedding/ui/widgets/ui_helper.dart';

class OpeningPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final assetsService = RM.get<AssetsService>();

    return Scaffold(
      body: WhenRebuilderOr<Assets>(
        observe: () => RM.get<AssetsService>().future(
            (AssetsService state, Future<AssetsService> stateAsync) =>
                stateAsync.then((AssetsService data) => data.loadAssets())),
        onWaiting: () => UIHelper().loading,
        onError: (e) => Container(child: Center(child: Text(e.toString()))),
        builder: (context, assets) {
          return GestureDetector(
            onTap: () {
              assetsService.setState((s) => s.playAudio());
              RM.navigate.toAndRemoveUntil(HomePage(assets: assets.state));
            },
            child: Stack(
              children: [
                UIHelper().background(assets.state),
                DelayedDisplay(
                  delay: Duration(seconds: 1),
                  slidingBeginOffset: Offset(0.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: CachedNetworkImage(
                          imageUrl: 'assets/assets/opening/yb_circle.png',
                          placeholder: (_, __) => Container(),
                          width: 50.0.w,
                        ),
                        // FadeInImage.assetNetwork(
                        //   image: 'assets/assets/opening/yb_circle.png',
                        //   placeholder: '',
                        //   width: 50.0.w,
                        // )
                        // Image.memory(
                        //   assets.state.ybCircle,
                        //   width: 50.0.w,
                        // ),
                      ),
                      UIHelper.verticalSmallSpace,
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Spacer(
                            flex: 2,
                          ),
                          CachedNetworkImage(
                            imageUrl: 'assets/assets/opening/leaf.png',
                            placeholder: (_, __) => Container(),
                            width: 20.0.w,
                          ),
                          // FadeInImage.assetNetwork(
                          //   image: 'assets/assets/opening/leaf.png',
                          //   placeholder: '',
                          //   width: 20.0.w,
                          // ),
                          // Image.memory(
                          //   assets.state.leaf,
                          //   width: 20.0.w,
                          // ),
                          UIHelper.horizontalSmallSpace,
                          Transform(
                            transform: Matrix4.rotationY(math.pi),
                            alignment: FractionalOffset.center,
                            child: CachedNetworkImage(
                              imageUrl: 'assets/assets/opening/leaf.png',
                              placeholder: (_, __) => Container(),
                              width: 20.0.w,
                            ),
                            // FadeInImage.assetNetwork(
                            //   image: 'assets/assets/opening/leaf.png',
                            //   placeholder: '',
                            //   width: 20.0.w,
                            // ),
                            // Image.memory(
                            //   assets.state.leaf,
                            //   width: 20.0.w,
                            // ),
                          ),
                          Spacer(
                            flex: 2,
                          ),
                        ],
                      ),
                      UIHelper.verticalMediumSpace,
                      DelayedDisplay(
                        delay: Duration(seconds: 2),
                        slidingBeginOffset: Offset(0.0, 0.0),
                        child: Text(
                          ' Klik layar untuk membuka undangan ',
                          style: GoogleFonts.elMessiri(
                              color: Colors.brown[400], fontSize: 10.0.sp),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
