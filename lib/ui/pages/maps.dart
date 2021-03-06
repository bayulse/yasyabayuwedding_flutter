import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sizer/sizer.dart';
import 'package:states_rebuilder/states_rebuilder.dart';
import 'package:yasyabayuwedding/models/assets.dart';
import 'package:yasyabayuwedding/services/app_state.dart';
import 'package:yasyabayuwedding/ui/widgets/ui_helper.dart';

class MapsPage extends StatelessWidget {
  final Assets assets;

  const MapsPage({Key key, this.assets}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appState = RM.get<AppState>();

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
              ClipRRect(
                borderRadius: BorderRadius.circular(2.0),
                child: Container(
                  height: SizerUtil.deviceType == DeviceType.Mobile
                      ? 50.0.h
                      : 30.0.h,
                  width: SizerUtil.deviceType == DeviceType.Mobile
                      ? 90.0.w
                      : 110.0.w,
                  child: GoogleMap(
                    initialCameraPosition: CameraPosition(
                      target: LatLng(-6.187132, 107.030270),
                      zoom: 16,
                    ),
                    markers: {
                      Marker(
                        markerId: MarkerId('yasyabayuwedding'),
                        position: LatLng(-6.187132, 107.030270),
                      )
                    },
                  ),
                ),
              ),
              UIHelper.verticalMediumSpace,
              FlatButton(
                color: Colors.red,
                child: Text(
                  'Buka Google Maps',
                  style: GoogleFonts.rancho(
                    color: Colors.white,
                    fontSize: SizerUtil.deviceType == DeviceType.Mobile
                        ? 14.0.sp
                        : 10.0.sp,
                  ),
                ),
                onPressed: () => appState.state.launchMap(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
