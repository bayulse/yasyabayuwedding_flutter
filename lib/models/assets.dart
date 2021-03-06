import 'dart:typed_data';

class Assets {
  final Uint8List akad;
  final Uint8List background;
  final Uint8List bismillah;
  final Uint8List dengan;
  final Uint8List flower;
  final Uint8List flowerEdge;
  final Uint8List gallery1;
  final Uint8List gallery2;
  final Uint8List gallery3;
  final Uint8List leaf;
  final Uint8List memakaiMasker;
  final Uint8List mencuciTangan;
  final Uint8List menggunakanHandSanitizer;
  final Uint8List menjagaJarak;
  final Uint8List tidakBersalamanSecaraLangsung;
  final Uint8List resepsi;
  final Uint8List root;
  final Uint8List sandDown;
  final Uint8List sandUp;
  final Uint8List splash;
  final Uint8List bayu;
  final Uint8List bayuFrame;
  final Uint8List yasyaFrame;
  final Uint8List yasya;
  final Uint8List yasyaDanBayu;
  final Uint8List ybCircle;
  final Uint8List ybFrame;

  Assets({
    this.akad,
    this.background,
    this.bismillah,
    this.dengan,
    this.flower,
    this.flowerEdge,
    this.gallery1,
    this.gallery2,
    this.gallery3,
    this.leaf,
    this.memakaiMasker,
    this.mencuciTangan,
    this.menggunakanHandSanitizer,
    this.menjagaJarak,
    this.tidakBersalamanSecaraLangsung,
    this.resepsi,
    this.root,
    this.sandDown,
    this.sandUp,
    this.splash,
    this.bayu,
    this.bayuFrame,
    this.yasyaFrame,
    this.yasya,
    this.yasyaDanBayu,
    this.ybCircle,
    this.ybFrame,
  });

  factory Assets.fromJson(Map json) {
    return Assets(
      akad: json['akad'] ?? null,
      background: json['background'] ?? null,
      bismillah: json['bismillah'] ?? null,
      dengan: json['dengan'] ?? null,
      flower: json['flower'] ?? null,
      flowerEdge: json['flower_edge'] ?? null,
      gallery1: json['gallery1'] ?? null,
      gallery2: json['gallery2'] ?? null,
      gallery3: json['gallery3'] ?? null,
      leaf: json['leaf'] ?? null,
      memakaiMasker: json['memakai_masker'] ?? null,
      mencuciTangan: json['mencuci_tangan'] ?? null,
      menggunakanHandSanitizer: json['menggunakan_hand_sanitizer'] ?? null,
      menjagaJarak: json['menjaga_jarak'] ?? null,
      tidakBersalamanSecaraLangsung:
          json['tidak_bersalaman_secara_langsung'] ?? null,
      resepsi: json['resepsi'] ?? null,
      root: json['root'] ?? null,
      sandDown: json['sand_down'] ?? null,
      sandUp: json['sand_up'] ?? null,
      splash: json['splash'] ?? null,
      bayu: json['bayu'] ?? null,
      bayuFrame: json['bayu_frame'] ?? null,
      yasyaFrame: json['yasya_frame'] ?? null,
      yasya: json['yasya'] ?? null,
      yasyaDanBayu: json['yasyadanbayu'] ?? null,
      ybCircle: json['yb_circle'] ?? null,
      ybFrame: json['yb_frame'] ?? null,
    );
  }
}

class ImageAssets {
  final String url;
  final String key;

  ImageAssets(this.url, this.key);
}
