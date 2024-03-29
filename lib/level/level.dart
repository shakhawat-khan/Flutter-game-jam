import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame_tiled/flame_tiled.dart';
import 'package:melancholy/components/player.dart';

class Level extends World {
  late TiledComponent level;

  @override
  FutureOr<void> onLoad() async {
    level = await TiledComponent.load(
      'pixel.tmx',
      Vector2.all(16),
    );
    add(level);
    final spawnPointLayer = level.tileMap.getLayer<ObjectGroup>('SpawnPoints');

    for (final spawnPoint in spawnPointLayer!.objects) {
      switch (spawnPoint.class_) {
        case 'Player':
          final player = Player(
            charecter: 'Mask Dude',
            position: Vector2(
              spawnPoint.x,
              spawnPoint.y,
            ),
          );

          add(player);

          break;
        default:
      }
    }

    // add(Player(charecter: 'Ninja Frog'));

    return super.onLoad();
  }
}
