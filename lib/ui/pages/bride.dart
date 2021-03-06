import 'package:cached_network_image/cached_network_image.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:yasyabayuwedding/models/assets.dart';
import 'package:yasyabayuwedding/ui/widgets/ui_helper.dart';

class BridePage extends StatelessWidget {
  final Assets assets;

  const BridePage({Key key, this.assets}) : super(key: key);

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
          delay: Duration(milliseconds: 700),
          slidingBeginOffset: Offset(0.0, 0.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildBismillahandSalam(),
              UIHelper.verticalMediumSpace,
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _buildYasyaFrame(),
                  UIHelper.verticalMediumSpace,
                  _buildDenganText(),
                  UIHelper.verticalMediumSpace,
                  _buildBayuFrame(),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildBismillahandSalam() {
    return Container(
      child: Column(
        children: [
          CachedNetworkImage(
            imageUrl: 'assets/assets/bride/bismillah.png',
            placeholder: (_, __) => Container(),
            width: SizerUtil.deviceType == DeviceType.Mobile ? 60.0.w : 40.0.w,
          ),
          // FadeInImage.assetNetwork(
          //   image: 'assets/assets/bride/bismillah.png',
          //   placeholder: '',
          //   width: 60.0.w,
          // ),
          // Image.memory(
          //   assets.bismillah,
          //   width: 60.0.w,
          // ),
          Text(
            'Assalamu\'alaikum Warahmatullahi Wabarakatuh\nDengan memohon rahmat dan ridho Allah SWT. kami akan menyelenggarakan pernikahan:',
            style: GoogleFonts.rancho(
                color: UIHelper.brown,
                fontSize: SizerUtil.deviceType == DeviceType.Mobile
                    ? 14.0.sp
                    : 10.0.sp),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }

  Widget _buildYasyaFrame() {
    return Column(
      children: [
        CachedNetworkImage(
          imageUrl: 'assets/assets/bride/yasya_frame.png',
          placeholder: (_, __) => Container(),
          width: SizerUtil.deviceType == DeviceType.Mobile ? 30.0.w : 20.0.w,
        ),
        // FadeInImage.assetNetwork(
        //   image: 'assets/assets/bride/yasya_frame.png',
        //   placeholder: '',
        //   width: 30.0.w,
        // ),
        // Image.memory(
        //   assets.yasyaFrame,
        //   width: 30.0.w,
        // ),
        CachedNetworkImage(
          imageUrl: 'assets/assets/bride/yasya.png',
          placeholder: (_, __) => Container(),
          width: SizerUtil.deviceType == DeviceType.Mobile ? 55.0.w : 35.0.w,
        ),
        // FadeInImage.assetNetwork(
        //   image: 'assets/assets/bride/yasya.png',
        //   placeholder: '',
        //   width: 55.0.w,
        // ),
        // Image.memory(assets.yasya, width: 55.0.w),
        Text(
          'Putri pertama dari Bapak Akhmad Purnadi\ndan Ibu Rustianti',
          style: GoogleFonts.rancho(
              color: UIHelper.brown,
              fontSize:
                  SizerUtil.deviceType == DeviceType.Mobile ? 12.0.sp : 8.0.sp),
          textAlign: TextAlign.center,
        )
      ],
    );
  }

  Widget _buildDenganText() {
    return CachedNetworkImage(
      imageUrl: 'assets/assets/bride/dengan.png',
      placeholder: (_, __) => Container(),
      width: SizerUtil.deviceType == DeviceType.Mobile ? 25.0.w : 15.0.w,
    );
    // FadeInImage.assetNetwork(
    //   image: 'assets/assets/bride/dengan.png',
    //   placeholder: '',
    //   width: 25.0.w,
    // );
    // Image.memory(
    //   assets.dengan,
    //   width: 25.0.w,
    // );
  }

  Widget _buildBayuFrame() {
    return Column(
      children: [
        CachedNetworkImage(
          imageUrl: 'assets/assets/bride/bayu_frame.png',
          placeholder: (_, __) => Container(),
          width: SizerUtil.deviceType == DeviceType.Mobile ? 30.0.w : 20.0.w,
        ),
        // FadeInImage.assetNetwork(
        //   image: 'assets/assets/bride/bayu_frame.png',
        //   placeholder: '',
        //   width: 30.0.w,
        // ),
        // Image.memory(
        //   assets.bayuFrame,
        //   width: 30.0.w,
        // ),
        CachedNetworkImage(
          imageUrl: 'assets/assets/bride/bayu.png',
          placeholder: (_, __) => Container(),
          width: SizerUtil.deviceType == DeviceType.Mobile ? 65.0.w : 45.0.w,
        ),
        // FadeInImage.assetNetwork(
        //   image: 'assets/assets/bride/bayu.png',
        //   placeholder: '',
        //   width: 65.0.w,
        // ),
        // Image.memory(assets.bayu, width: 65.0.w),
        Text(
          'Putra kedua dari Bapak Ernawan Yulianto El-Irsyadie\ndan Ibu Elisabeth Emy Narulita',
          style: GoogleFonts.rancho(
              color: UIHelper.brown,
              fontSize:
                  SizerUtil.deviceType == DeviceType.Mobile ? 12.0.sp : 8.0.sp),
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}
