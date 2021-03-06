import 'dart:typed_data';

import 'package:http/http.dart' as http;
import 'package:yasyabayuwedding/models/assets.dart';

class AssetsRepository {
  AssetsRepository _instance;

  Future<AssetsRepository> init() async {
    await getImages();
    _instance = AssetsRepository();

    return _instance;
  }

  List<ImageAssets> assets = [
    ImageAssets('assets/assets/background.png', 'background'),
    ImageAssets('assets/assets/flower.png', 'flower'),
    ImageAssets('assets/assets/root.png', 'root'),
    ImageAssets('assets/assets/splash.png', 'splash'),
    ImageAssets('assets/assets/opening/leaf.png', 'leaf'),
    ImageAssets('assets/assets/opening/yb_circle.png', 'yb_circle'),
    ImageAssets('assets/assets/cover/sand_down.png', 'sand_down'),
    ImageAssets('assets/assets/cover/sand_up.png', 'sand_up'),
    ImageAssets('assets/assets/cover/yb_frame.png', 'yb_frame'),
    ImageAssets('assets/assets/bride/bayu.png', 'bayu'),
    ImageAssets('assets/assets/bride/bayu_frame.png', 'bayu_frame'),
    ImageAssets('assets/assets/bride/bismillah.png', 'bismillah'),
    ImageAssets('assets/assets/bride/dengan.png', 'dengan'),
    ImageAssets('assets/assets/bride/yasya.png', 'yasya'),
    ImageAssets('assets/assets/bride/yasya_frame.png', 'yasya_frame'),
    ImageAssets('assets/assets/event/akad.png', 'akad'),
    ImageAssets('assets/assets/event/resepsi.png', 'resepsi'),
    ImageAssets('assets/assets/closing/flower_edge.png', 'flower_edge'),
    ImageAssets('assets/assets/closing/yasyadanbayu.png', 'yasyadanbayu'),
    ImageAssets('assets/assets/gallery/gallery1.png', 'gallery1'),
    ImageAssets('assets/assets/gallery/gallery2.png', 'gallery2'),
    ImageAssets('assets/assets/gallery/gallery3.png', 'gallery3'),
    ImageAssets('assets/assets/protokol_kesehatan/memakai_masker.png',
        'memakai_masker'),
    ImageAssets('assets/assets/protokol_kesehatan/mencuci_tangan.png',
        'mencuci_tangan'),
    ImageAssets(
        'assets/assets/protokol_kesehatan/menggunakan_hand_sanitizer.png',
        'menggunakan_hand_sanitizer'),
    ImageAssets(
        'assets/assets/protokol_kesehatan/menjaga_jarak.png', 'menjaga_jarak'),
    ImageAssets(
        'assets/assets/protokol_kesehatan/tidak_bersalaman_secara_langsung.png',
        'tidak_bersalaman_secara_langsung'),
  ];

  Future<Map<String, Uint8List>> fetchNetworkImage(ImageAssets assets) async {
    http.Response response = await http.get(assets.url);
    return {"${assets.key}": response.bodyBytes};
  }

  Future<Map> getImages() async {
    Map data = {};

    for (ImageAssets img in assets) {
      Map fetchedImg = await fetchNetworkImage(img);
      data.addAll(fetchedImg);
    }

    return data;
  }
}
