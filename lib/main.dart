import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:states_rebuilder/states_rebuilder.dart';
import 'package:yasyabayuwedding/repository/assets_repository.dart';
import 'package:yasyabayuwedding/services/app_state.dart';
import 'package:yasyabayuwedding/services/assets_service.dart';
import 'package:yasyabayuwedding/ui/pages/opening.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(YasyaBayuWeddingApp());
}

class YasyaBayuWeddingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Injector(
      inject: [
        Inject.future(() => AssetsRepository().init()),
        Inject.future(
          () async {
            final repository = await RM.get<AssetsRepository>().stateAsync;
            return AssetsService(repository);
          },
        ),
        Inject(() => AppState()),
      ],
      builder: (BuildContext context) {
        return LayoutBuilder(builder: (context, constraints) {
          return OrientationBuilder(builder: (context, orientation) {
            SizerUtil().init(constraints, orientation);
            return MaterialApp(
              title: 'Yasya ❤ Bayu Wedding',
              navigatorKey: RM.navigate.navigatorKey,
              debugShowCheckedModeBanner: false,
              home: OpeningPage(),
            );
          });
        });
      },
    );
  }
}
