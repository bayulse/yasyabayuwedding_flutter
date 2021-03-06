import 'dart:math' as math;

import 'package:cached_network_image/cached_network_image.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:states_rebuilder/states_rebuilder.dart';
import 'package:yasyabayuwedding/models/assets.dart';
import 'package:yasyabayuwedding/services/app_state.dart';
import 'package:yasyabayuwedding/ui/widgets/ui_helper.dart';

class CoverPage extends StatelessWidget {
  final Assets assets;

  const CoverPage({Key key, this.assets}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final app = RM.get<AppState>();

    // WidgetsBinding.instance.addPostFrameCallback(
    //   (_) => Future.delayed(Duration(seconds: 3), () {
    //     if (app.state.arrowFirstTime == false) {
    //       ShowCaseWidget.of(context).startShowCase([app.state.arrow]);
    //       app.setState((s) => s.arrowFirstTime = true);
    //     }
    //   }),
    // );

    return Stack(
      alignment: Alignment.center,
      children: [
        UIHelper().background(assets),
        Positioned(
          top: 0,
          right: 0,
          child: CachedNetworkImage(
            imageUrl: 'assets/assets/cover/sand_up.png',
            placeholder: (_, __) => Container(),
            width: SizerUtil.deviceType == DeviceType.Mobile ? 70.0.w : 100.0.w,
          ),
          // FadeInImage.assetNetwork(
          //   image: 'assets/assets/cover/sand_up.png',
          //   placeholder: '',
          //   width: SizerUtil.deviceType == DeviceType.Mobile ? 70.0.w : 100.0.w,
          // ),
          // Image.memory(
          //   assets.sandUp,
          //   width: SizerUtil.deviceType == DeviceType.Mobile ? 70.0.w : 100.0.w,
          // ),
        ),
        Positioned(
          top: 0,
          left: 0,
          child: Transform(
            transform: Matrix4.rotationY(math.pi),
            alignment: FractionalOffset.center,
            child: CachedNetworkImage(
              imageUrl: 'assets/assets/flower.png',
              placeholder: (_, __) => Container(),
              width: 30.0.w,
            ),
            // FadeInImage.assetNetwork(
            //   image: 'assets/assets/flower.png',
            //   placeholder: '',
            //   width: 30.0.w,
            // ),
            // Image.memory(
            //   assets.flower,
            //   width: 30.0.w,
            // ),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          child: CachedNetworkImage(
            imageUrl: 'assets/assets/cover/sand_down.png',
            placeholder: (_, __) => Container(),
            width:
                SizerUtil.deviceType == DeviceType.Mobile ? 100.0.w : 120.0.w,
          ),
          // FadeInImage.assetNetwork(
          //   image: 'assets/assets/cover/sand_down.png',
          //   placeholder: '',
          //   width:
          //       SizerUtil.deviceType == DeviceType.Mobile ? 100.0.w : 120.0.w,
          // ),
          // Image.memory(
          //   assets.sandDown,
          //   width:
          //       SizerUtil.deviceType == DeviceType.Mobile ? 100.0.w : 120.0.w,
          // ),
        ),
        Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            DelayedDisplay(
              delay: Duration(milliseconds: 500),
              slidingBeginOffset: Offset(0.0, 0.0),
              child: _buildWeddingText(),
            ),
            UIHelper.verticalMediumSpace,
            DelayedDisplay(
              delay: Duration(milliseconds: 1000),
              slidingBeginOffset: Offset(0.0, 0.0),
              child: _buildYBFrame(width),
            ),
            UIHelper.verticalMediumSpace,
            DelayedDisplay(
              delay: Duration(milliseconds: 1500),
              slidingBeginOffset: Offset(0.0, 0.0),
              child: _buildDateText(),
            ),
          ],
        ),
        // Positioned(
        //   bottom: 10.0.w,
        //   child: Showcase.withWidget(
        //     key: app.state.arrow,
        //     height: double.infinity,
        //     width: 0.0,
        //     showcaseBackgroundColor: Colors.black12,
        //     disposeOnTap: true,
        //     container: Padding(
        //       padding: const EdgeInsets.only(left: 80.0),
        //       child: Column(
        //         children: [
        //           Shake(
        //             preferences: AnimationPreferences(
        //               autoPlay: AnimationPlayStates.Loop,
        //               duration: Duration(seconds: 3),
        //             ),
        //             child: Icon(
        //               Icons.arrow_forward,
        //               color: Colors.white,
        //               size: 12.0.w,
        //             ),
        //           ),
        //           Text(
        //             'Geser ke Kanan',
        //             style: GoogleFonts.bebasNeue(
        //               color: Colors.white,
        //               fontSize: 12.0.sp,
        //             ),
        //           ),
        //         ],
        //       ),
        //     ),
        //     child: Container(),
        //   ),
        // ),
        app.state.arrowFirstTime
            ? DelayedDisplay(
                delay: Duration(seconds: 3),
                slidingBeginOffset: Offset(0.0, 0.0),
                fadingDuration: Duration(microseconds: 0),
                child: Dismissible(
                  key: UniqueKey(),
                  direction: DismissDirection.endToStart,
                  onDismissed: (direction) => app.setState(
                    (s) => s.arrowFirstTime = false,
                  ),
                  child: Container(
                    height: double.infinity,
                    width: double.infinity,
                    color: Colors.black38,
                    child: Stack(
                      children: [
                        Positioned(
                          bottom: 10.0.w,
                          right: 10.0.w,
                          child: Column(
                            children: [
                              Shake(
                                preferences: AnimationPreferences(
                                  autoPlay: AnimationPlayStates.Loop,
                                  duration: Duration(seconds: 3),
                                ),
                                child: Icon(
                                  Icons.arrow_forward,
                                  color: Colors.white,
                                  size: 12.0.w,
                                ),
                              ),
                              Text(
                                'Geser ke Kanan',
                                style: GoogleFonts.bebasNeue(
                                  color: Colors.white,
                                  fontSize: 12.0.sp,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            : Container()
      ],
    );
  }

  Widget _buildWeddingText() {
    return Text(
      'The Wedding Of',
      style: GoogleFonts.dancingScript(
        color: UIHelper.brown,
        fontSize: 14.0.sp,
      ),
    );
  }

  Widget _buildYBFrame(double width) {
    return CachedNetworkImage(
      imageUrl: 'assets/assets/cover/yb_frame.png',
      placeholder: (_, __) => Container(),
      width: 70.0.w,
    );
    // FadeInImage.assetNetwork(
    //   image: 'assets/assets/cover/yb_frame.png',
    //   placeholder: '',
    //   width: 70.0.w,
    // );
    // Image.memory(
    //   assets.ybFrame,
    //   width: 70.0.w,
    // );
  }

  Widget _buildDateText() {
    return Text(
      '02.01.2021',
      style: GoogleFonts.lobster(
        color: UIHelper.brown,
        fontSize: 16.0.sp,
      ),
    );
  }
}
