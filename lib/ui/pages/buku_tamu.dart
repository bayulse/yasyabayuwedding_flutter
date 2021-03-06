import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:states_rebuilder/states_rebuilder.dart';
import 'package:yasyabayuwedding/models/assets.dart';
import 'package:yasyabayuwedding/services/firestore_service.dart';
import 'package:yasyabayuwedding/ui/widgets/ui_helper.dart';

class BukuTamuPage extends StatelessWidget {
  final Assets assets;

  const BukuTamuPage({Key key, this.assets}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Injector(
      inject: [Inject(() => FirestoreService())],
      builder: (context) => Stack(
        alignment: Alignment.center,
        children: [
          UIHelper().background(assets),
          UIHelper().flowerTopRight(assets),
          UIHelper().rootTopLeft(assets),
          UIHelper().flowerBottomLeft(assets),
          UIHelper().rootBottomRight(assets),
          StateBuilder<FirestoreService>(
            observe: () => RM.get<FirestoreService>(),
            initState: (context, model) => model.setState((s) => s.init()),
            builder: (context, model) => Container(
              padding: EdgeInsets.symmetric(
                horizontal:
                    SizerUtil.deviceType == DeviceType.Mobile ? 8.0.w : 30.0.w,
                vertical:
                    SizerUtil.deviceType == DeviceType.Mobile ? 15.0.w : 10.0.w,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      'BUKU TAMU',
                      style: GoogleFonts.rancho(
                        color: UIHelper.fallow,
                        fontSize: SizerUtil.deviceType == DeviceType.Mobile
                            ? 20.0.sp
                            : 12.0.sp,
                      ),
                    ),
                  ),
                  UIHelper.verticalMediumSpace,
                  TextField(
                    controller: model.state.namaController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      filled: true,
                      fillColor: Colors.white,
                      isDense: true,
                      hintText: 'Nama...',
                      hintStyle: GoogleFonts.roboto(
                          fontSize: SizerUtil.deviceType == DeviceType.Mobile
                              ? 10.0.sp
                              : 8.0.sp),
                    ),
                    style: GoogleFonts.roboto(
                        fontSize: SizerUtil.deviceType == DeviceType.Mobile
                            ? 10.0.sp
                            : 8.0.sp),
                  ),
                  UIHelper.verticalSmallSpace,
                  TextField(
                    controller: model.state.pesanController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      filled: true,
                      fillColor: Colors.white,
                      isDense: true,
                      hintText: 'Ucapan/Pesan/Harapan...',
                      hintStyle: GoogleFonts.roboto(
                          fontSize: SizerUtil.deviceType == DeviceType.Mobile
                              ? 10.0.sp
                              : 8.0.sp),
                    ),
                    style: GoogleFonts.roboto(
                        fontSize: SizerUtil.deviceType == DeviceType.Mobile
                            ? 10.0.sp
                            : 8.0.sp),
                    maxLines: 4,
                    maxLength: 400,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 12.0),
                    child: RaisedButton(
                      color: UIHelper.fallow,
                      child: Text(
                        'Kirim',
                        style: GoogleFonts.rancho(
                          color: Colors.white,
                          fontSize: SizerUtil.deviceType == DeviceType.Mobile
                              ? 14.0.sp
                              : 9.0.sp,
                        ),
                      ),
                      onPressed: () async {
                        if (model.state.namaController.text.isNotEmpty &&
                            model.state.pesanController.text.isNotEmpty) {
                          bool result = await model.state.tambahPesan(
                              model.state.namaController.text,
                              model.state.pesanController.text);
                          RM.scaffoldShow.snackBar(
                            SnackBar(
                              backgroundColor:
                                  result ? Colors.green : Colors.red,
                              content: Text(
                                result
                                    ? 'Berhasil! Lihat di kolom Ucapan.'
                                    : 'Gagal! Silahkan coba lagi.',
                                style: GoogleFonts.rancho(
                                  color: Colors.white,
                                  fontSize:
                                      SizerUtil.deviceType == DeviceType.Mobile
                                          ? 12.0.sp
                                          : 9.0.sp,
                                ),
                              ),
                            ),
                          );
                        } else {
                          RM.scaffoldShow.snackBar(
                            SnackBar(
                              backgroundColor: Colors.red,
                              content: Text(
                                'Nama/Pesan tidak boleh kosong.',
                                style: GoogleFonts.rancho(
                                  color: Colors.white,
                                  fontSize:
                                      SizerUtil.deviceType == DeviceType.Mobile
                                          ? 12.0.sp
                                          : 9.0.sp,
                                ),
                              ),
                            ),
                          );
                        }

                        FocusScope.of(context).unfocus();
                      },
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 2.0.w),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2.0),
                        color: UIHelper.fallow,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 12.0),
                            child: Text(
                              'Ucapan',
                              style: GoogleFonts.roboto(
                                color: Colors.white,
                                fontSize:
                                    SizerUtil.deviceType == DeviceType.Mobile
                                        ? 12.0.sp
                                        : 9.0.sp,
                              ),
                            ),
                          ),
                          Expanded(
                            child: StreamBuilder<QuerySnapshot>(
                              stream: model.state.bukuTamuStream,
                              builder: (context, snapshot) {
                                if (snapshot.hasError) {
                                  return Center(
                                    child: Text(
                                      'Something went wrong...',
                                      style: GoogleFonts.roboto(
                                        color: Colors.white,
                                        fontSize: SizerUtil.deviceType ==
                                                DeviceType.Mobile
                                            ? 12.0.sp
                                            : 9.0.sp,
                                      ),
                                    ),
                                  );
                                }

                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return UIHelper().loading;
                                }

                                if (!snapshot.hasData) {
                                  return UIHelper().loading;
                                }

                                return ListView(
                                  children: snapshot.data.docs
                                      .map((DocumentSnapshot doc) {
                                    return doc.data()['visibility']
                                        ? ListTile(
                                            dense: true,
                                            title: Text(
                                              doc.data()['nama'],
                                              style: GoogleFonts.roboto(
                                                color: Colors.white,
                                                fontSize:
                                                    SizerUtil.deviceType ==
                                                            DeviceType.Mobile
                                                        ? 11.0.sp
                                                        : 8.0.sp,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            subtitle: Text(
                                              doc.data()['pesan'],
                                              style: GoogleFonts.roboto(
                                                color: Colors.white70,
                                                fontSize:
                                                    SizerUtil.deviceType ==
                                                            DeviceType.Mobile
                                                        ? 10.0.sp
                                                        : 7.0.sp,
                                              ),
                                            ),
                                          )
                                        : Container();
                                  }).toList(),
                                );
                              },
                            ),
                          ),
                          UIHelper.verticalSmallSpace,
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
