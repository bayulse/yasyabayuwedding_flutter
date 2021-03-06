import 'dart:math' as math;

import 'package:cached_network_image/cached_network_image.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:yasyabayuwedding/models/assets.dart';
import 'package:yasyabayuwedding/ui/widgets/ui_helper.dart';

class ClosingPage extends StatelessWidget {
  final Assets assets;

  const ClosingPage({Key key, this.assets}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          child: Container(
            padding: EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: SizerUtil.deviceType == DeviceType.Mobile
                          ? 0.0
                          : 25.0.w),
                  child: Text(
                    '\"Dan diantara tanda-tanda kekuasaanNya ialah Dia menciptakan untukmu isteri-isteri dari jenismu sendiri, supaya kamu cenderung dan merasa tenteram kepadanya, dan dijadikanNya diantaramu rasa kasih dan sayang. Sesungguhnya pada yang demikian itu benar-benar terdapat tanda-tanda bagi kaum yang berpikir.\"',
                    style: GoogleFonts.rancho(
                      color: UIHelper.brown,
                      fontSize: SizerUtil.deviceType == DeviceType.Mobile
                          ? 16.0.sp
                          : 11.0.sp,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Text(
                  '[QS. Ar. Ruum (30):21].',
                  style: GoogleFonts.rancho(
                    color: UIHelper.brown,
                    fontSize: SizerUtil.deviceType == DeviceType.Mobile
                        ? 16.0.sp
                        : 11.0.sp,
                  ),
                  textAlign: TextAlign.center,
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: SizerUtil.deviceType == DeviceType.Mobile
                          ? 10.0
                          : 30.0,
                      bottom: SizerUtil.deviceType == DeviceType.Mobile
                          ? 20.0
                          : 50.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      _buildFlower(),
                      UIHelper.horizontalSmallSpace,
                      Transform(
                        transform: Matrix4.rotationY(math.pi),
                        alignment: FractionalOffset.center,
                        child: _buildFlower(),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: SizerUtil.deviceType == DeviceType.Mobile
                          ? 0.0
                          : 30.0.w),
                  child: Text(
                    'Semoga Allah SWT memberi barokah dan menjadikan mempelai berdua dalam kebaikan keluarga sakinah, mawaddah dan warahmah.\n',
                    style: GoogleFonts.rancho(
                      color: UIHelper.brown,
                      fontSize: SizerUtil.deviceType == DeviceType.Mobile
                          ? 16.0.sp
                          : 11.0.sp,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Text(
                  'Wassalamu\'alaikum Warahmatullahi Wabarakatuh',
                  style: GoogleFonts.rancho(
                      color: UIHelper.brown,
                      fontSize: SizerUtil.deviceType == DeviceType.Mobile
                          ? 16.0.sp
                          : 11.0.sp),
                  textAlign: TextAlign.center,
                ),
                UIHelper.verticalLargeSpace,
                CachedNetworkImage(
                  imageUrl: 'assets/assets/closing/yasyadanbayu.png',
                  placeholder: (_, __) => Container(),
                  width: SizerUtil.deviceType == DeviceType.Mobile
                      ? 30.0.w
                      : 22.0.w,
                ),
                // FadeInImage.assetNetwork(
                //   image: 'assets/assets/closing/yasyadanbayu.png',
                //   placeholder: '',
                //   width: 30.0.w,
                // ),
                // Image.memory(
                //   assets.yasyaDanBayu,
                //   width: 30.0.w,
                // )
              ],
            ),
          ),
        ),
        // Positioned(
        //   bottom: 0,
        //   child: Padding(
        //     padding: const EdgeInsets.all(20.0),
        //     child: Text(
        //       'Credits :\nDesigned by Yasya Nurrus Silmi || Developed by Bayu Laksana Surya El-Irsyadie\nMusic : Stuck With U (Piano Version) - Kim Bo || Assets from Freepik.com',
        //       style: GoogleFonts.roboto(color: UIHelper.brown, fontSize: 6.0.sp),
        //       textAlign: TextAlign.center,
        //     ),
        //   ),
        // )
      ],
    );
  }

  Widget _buildFlower() {
    return CachedNetworkImage(
      imageUrl: 'assets/assets/closing/flower_edge.png',
      placeholder: (_, __) => Container(),
      width: SizerUtil.deviceType == DeviceType.Mobile ? 30.0.w : 20.0.w,
    );
    // FadeInImage.assetNetwork(
    //   image: 'assets/assets/closing/flower_edge.png',
    //   placeholder: '',
    //   width: 30.0.w,
    // );
    // Image.memory(
    //   assets.flowerEdge,
    //   width: 30.0.w,
    // );
  }
}
