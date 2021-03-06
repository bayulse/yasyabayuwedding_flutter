import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:yasyabayuwedding/models/assets.dart';
import 'package:yasyabayuwedding/repository/assets_repository.dart';

class AssetsService {
  AssetsService(this.assetsRepository);

  final AssetsRepository assetsRepository;
  AssetsAudioPlayer assetsAudioPlayer;

  Future<Assets> loadAssets() async {
    // var assets = await assetsRepository.getImages();
    // return Assets.fromJson(assets);
    return null;
  }

  Future<void> playAudio() async {
    assetsAudioPlayer = AssetsAudioPlayer();
    await assetsAudioPlayer.open(
      Audio.network('assets/assets/audio/stuck_with_u_kim_boo.mp3'),
      loopMode: LoopMode.single,
    );
  }
}
