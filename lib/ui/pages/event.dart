import 'package:cached_network_image/cached_network_image.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:states_rebuilder/states_rebuilder.dart';
import 'package:yasyabayuwedding/models/assets.dart';
import 'package:yasyabayuwedding/services/app_state.dart';
import 'package:yasyabayuwedding/ui/widgets/ui_helper.dart';

class EventPage extends StatelessWidget {
  final Assets assets;

  const EventPage({Key key, this.assets}) : super(key: key);

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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Adapun rangkaian acaranya Insyaa Allah akan\ndiselenggarakan pada:\n',
                style: GoogleFonts.rancho(
                  color: UIHelper.brown,
                  fontSize: SizerUtil.deviceType == DeviceType.Mobile
                      ? 16.0.sp
                      : 10.0.sp,
                ),
                textAlign: TextAlign.center,
              ),
              CachedNetworkImage(
                imageUrl: 'assets/assets/event/akad.png',
                placeholder: (_, __) => Container(),
                width:
                    SizerUtil.deviceType == DeviceType.Mobile ? 35.0.w : 20.0.w,
              ),
              // Image.memory(assets.akad, width: 35.0.w),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  'Hari/Tanggal : 02 Januari 2021\nWaktu : 09.00 - 11.00 WIB\nLokasi : Jl. Al-Istiqomah Blok A No.29, Kavling Bahagia 99\nRT 002/04,\nBahagia, Babelan, Bekasi',
                  style: GoogleFonts.rancho(
                    color: UIHelper.brown,
                    fontSize: SizerUtil.deviceType == DeviceType.Mobile
                        ? 14.0.sp
                        : 9.0.sp,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              UIHelper.verticalMediumSpace,
              CountdownTimer(
                endTime: app.state.weddingDateTime,
                widgetBuilder: (_, time) {
                  return Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: UIHelper.brown, width: 2.0),
                    ),
                    height: SizerUtil.deviceType == DeviceType.Mobile
                        ? 16.0.w
                        : 11.0.w,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildTime(time == null ? 0 : time.days, 'HARI'),
                        VerticalDivider(
                          color: UIHelper.brown,
                          thickness: 2.0,
                          width: 0.0,
                        ),
                        _buildTime(time == null ? 0 : time.hours, 'JAM'),
                        VerticalDivider(
                          color: UIHelper.brown,
                          thickness: 2.0,
                          width: 0.0,
                        ),
                        _buildTime(time == null ? 0 : time.min, 'MENIT'),
                        VerticalDivider(
                          color: UIHelper.brown,
                          thickness: 2.0,
                          width: 0.0,
                        ),
                        _buildTime(time == null ? 0 : time.sec, 'DETIK'),
                      ],
                    ),
                  );
                },
              ),
              // UIHelper.verticalSmallSpace,
              // RaisedButton(
              //   color: UIHelper.fallow,
              //   child: Text(
              //     'Tambahkan ke Kalender',
              //     style: GoogleFonts.rancho(
              //       color: Colors.white,
              //       fontSize: 12.0.sp,
              //     ),
              //   ),
              //   onPressed: () {},
              // ),
              UIHelper.verticalMediumSpace,
              CachedNetworkImage(
                imageUrl: 'assets/assets/event/resepsi.png',
                placeholder: (_, __) => Container(),
                width:
                    SizerUtil.deviceType == DeviceType.Mobile ? 35.0.w : 20.0.w,
              ),
              // Image.memory(assets.resepsi, width: 35.0.w),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  'Hari/Tanggal : 02 Januari 2021\nWaktu : 11.00 - 16.30 WIB\nLokasi : Jl. Al-Istiqomah Blok A No.29, Kavling Bahagia 99\nRT 002/04,\nBahagia, Babelan, Bekasi',
                  style: GoogleFonts.rancho(
                    color: UIHelper.brown,
                    fontSize: SizerUtil.deviceType == DeviceType.Mobile
                        ? 14.0.sp
                        : 9.0.sp,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget _buildTime(int time, String label) {
    return Container(
      width: SizerUtil.deviceType == DeviceType.Mobile ? 15.0.w : 10.0.w,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            time != null ? time.toString() : 0.toString(),
            style: GoogleFonts.rancho(
              color: UIHelper.lightBrown,
              fontSize:
                  SizerUtil.deviceType == DeviceType.Mobile ? 18.0.sp : 11.0.sp,
            ),
          ),
          Text(
            label,
            style: GoogleFonts.rancho(
              color: UIHelper.brown,
              fontSize:
                  SizerUtil.deviceType == DeviceType.Mobile ? 14.0.sp : 9.0.sp,
            ),
          ),
        ],
      ),
    );
  }
}
