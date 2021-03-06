import 'package:cached_network_image/cached_network_image.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:yasyabayuwedding/models/assets.dart';
import 'package:yasyabayuwedding/ui/widgets/ui_helper.dart';

class ProtokolKesehatanPage extends StatelessWidget {
  final Assets assets;

  const ProtokolKesehatanPage({Key key, this.assets}) : super(key: key);

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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'PROTOKOL KESEHATAN',
                style: GoogleFonts.roboto(
                  color: UIHelper.roti,
                  fontSize: SizerUtil.deviceType == DeviceType.Mobile
                      ? 20.0.sp
                      : 14.0.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Divider(
                color: UIHelper.lightBrown,
                thickness: 2,
                indent:
                    SizerUtil.deviceType == DeviceType.Mobile ? 12.0.w : 28.0.w,
                endIndent:
                    SizerUtil.deviceType == DeviceType.Mobile ? 12.0.w : 28.0.w,
              ),
              _buildProtokol(
                  'assets/assets/protokol_kesehatan/memakai_masker.png',
                  'WAJIB MENGGUNAKAN MASKER'),
              _buildProtokol(
                  'assets/assets/protokol_kesehatan/mencuci_tangan.png',
                  'CUCI TANGAN SECARA BERKALA'),
              _buildProtokol(
                  'assets/assets/protokol_kesehatan/menggunakan_hand_sanitizer.png',
                  'MENGGUNAKAN HAND SANITIZER'),
              _buildProtokol(
                  'assets/assets/protokol_kesehatan/menjaga_jarak.png',
                  'MENJAGA JARAK AMAN'),
              _buildProtokol(
                  'assets/assets/protokol_kesehatan/tidak_bersalaman_secara_langsung.png',
                  'TIDAK BERJABAT TANGAN SECARA LANGSUNG'),
            ],
          ),
        )
      ],
    );
  }

  Widget _buildProtokol(String assets, String text) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        children: [
          SizerUtil.deviceType == DeviceType.Mobile
              ? Container()
              : Spacer(flex: 1),
          Expanded(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.only(
                left:
                    SizerUtil.deviceType == DeviceType.Mobile ? 5.0.w : 15.0.w,
              ),
              child: CachedNetworkImage(
                imageUrl: assets,
                placeholder: (_, __) => Container(),
                height:
                    SizerUtil.deviceType == DeviceType.Mobile ? 16.0.w : 8.0.w,
                width:
                    SizerUtil.deviceType == DeviceType.Mobile ? 16.0.w : 8.0.w,
              ),
              // FadeInImage.assetNetwork(
              //   image: assets,
              //   placeholder: '',
              //   height: 16.0.w,
              //   width: 16.0.w,
              // ),
              // Image.memory(
              //   assets,
              //   height: 16.0.w,
              //   width: 16.0.w,
              // ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 3.0.w,
              ),
              child: Text(
                text,
                style: GoogleFonts.roboto(
                  color: UIHelper.russet,
                  fontSize: SizerUtil.deviceType == DeviceType.Mobile
                      ? 12.0.sp
                      : 10.0.sp,
                ),
              ),
            ),
          ),
          SizerUtil.deviceType == DeviceType.Mobile
              ? Container()
              : Spacer(flex: 1)
        ],
      ),
    );
  }
}
