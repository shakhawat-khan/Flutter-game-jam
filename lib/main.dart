import 'package:flame/game.dart';
import 'package:flame/flame.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:melancholy/pixel_adventure.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  PixelAdventure game = PixelAdventure();

  Flame.device.fullScreen();
  Flame.device.setLandscape();

  runApp(
    GameWidget(
      game: kDebugMode ? PixelAdventure() : game,
    ),
  );
}
