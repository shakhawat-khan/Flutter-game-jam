import 'dart:async';

import 'package:flame/components.dart';
import 'package:melancholy/pixel_adventure.dart';

enum PlayerState { idel, running }

class Player extends SpriteAnimationGroupComponent
    with HasGameRef<PixelAdventure> {
  late final SpriteAnimation idelAnimation;
  final double stepTime = 0.05;

  @override
  FutureOr<void> onLoad() {
    _loadAnimations();
    return super.onLoad();
  }

  void _loadAnimations() {
    idelAnimation = SpriteAnimation.fromFrameData(
      game.images.fromCache(
        'Main Characters/Ninja Frog/Idle (32x32).png',
      ),
      SpriteAnimationData.sequenced(
        amount: 11,
        stepTime: stepTime,
        textureSize: Vector2.all(32),
      ),
    );

    // list of all animation

    animations = {PlayerState.idel: idelAnimation};

    // set current animation

    current = PlayerState.idel;
  }
}
