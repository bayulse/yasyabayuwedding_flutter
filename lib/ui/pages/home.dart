import 'package:flutter/material.dart';
import 'package:states_rebuilder/states_rebuilder.dart';
import 'package:transformer_page_view/transformer_page_view.dart';
import 'package:yasyabayuwedding/models/assets.dart';
import 'package:yasyabayuwedding/services/app_state.dart';
import 'package:yasyabayuwedding/ui/pages/bride.dart';
import 'package:yasyabayuwedding/ui/pages/buku_tamu.dart';
import 'package:yasyabayuwedding/ui/pages/closing.dart';
import 'package:yasyabayuwedding/ui/pages/cover.dart';
import 'package:yasyabayuwedding/ui/pages/event.dart';
import 'package:yasyabayuwedding/ui/pages/gallery.dart';
import 'package:yasyabayuwedding/ui/pages/maps.dart';
import 'package:yasyabayuwedding/ui/pages/protokol_kesehatan.dart';
import 'package:yasyabayuwedding/ui/widgets/transformers.dart';

class HomePage extends StatelessWidget {
  final Assets assets;

  const HomePage({Key key, this.assets}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WhenRebuilderOr<AppState>(
        observe: () => RM.get<AppState>(),
        builder: (context, app) => TransformerPageView(
          controller: app.state.pageViewController,
          itemCount: 8,
          transformer: transformers[5],
          itemBuilder: (context, index) {
            final pageList = [
              CoverPage(assets: assets),
              BridePage(assets: assets),
              EventPage(assets: assets),
              MapsPage(assets: assets),
              ClosingPage(assets: assets),
              GalleryPage(assets: assets),
              ProtokolKesehatanPage(assets: assets),
              BukuTamuPage(assets: assets)
            ];

            return StateWithMixinBuilder.automaticKeepAlive(
              builder: (context, rm) => pageList[index],
            );
          },
        ),
      ),
    );
  }
}
