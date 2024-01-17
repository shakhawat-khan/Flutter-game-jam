import 'dart:async';

import 'package:flame/components.dart';
import 'package:melancholy/pixel_adventure.dart';

enum PlayerState { idel, running }

class Player extends SpriteAnimationGroupComponent
    with HasGameRef<PixelAdventure> {
  String charecter;

  Player({position, required this.charecter}) : super(position: position);

  late final SpriteAnimation idelAnimation;
  final double stepTime = 0.05;

  @override
  FutureOr<void> onLoad() {
    _loadAnimations();
    return super.onLoad();
  }

  void _loadAnimations() {
    idelAnimation = _spriteAnimation(state: 'Run', amount: 12);

    // list of all animation

    animations = {PlayerState.idel: idelAnimation};

    // set current animation

    current = PlayerState.idel;
  }

  SpriteAnimation _spriteAnimation(
      {required String state, required int amount}) {
    return SpriteAnimation.fromFrameData(
      game.images.fromCache(
        'Main Characters/$charecter/$state (32x32).png',
      ),
      SpriteAnimationData.sequenced(
        amount: amount,
        stepTime: stepTime,
        textureSize: Vector2.all(32),
      ),
    );
  }
}
