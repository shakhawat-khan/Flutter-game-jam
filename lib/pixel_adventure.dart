import 'dart:async';
import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:melancholy/level/level.dart';

class PixelAdventure extends FlameGame {
  @override
  Color backgroundColor() {
    return const Color(0xFF211F30);
  }

  late final CameraComponent cam;
  @override
  final world = Level();

  @override
  FutureOr<void> onLoad() async {
    await images.loadAllImages();

    cam = CameraComponent.withFixedResolution(
        world: world, width: 500, height: 500);
    cam.viewfinder.anchor = Anchor.topLeft;
    addAll([cam, world]);
    return super.onLoad();
  }
}
